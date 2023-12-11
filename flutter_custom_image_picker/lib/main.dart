import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart' as rec;
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Attachment Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> media = [];
  bool isRecording = false;
  final record = rec.AudioRecorder();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attachment Bottom Sheet"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Upload"),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Cancel")
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[350]),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: media.length,
                                itemBuilder: (context, index) {
                                  return attachmentWidget(
                                      media[index],
                                      (int index) {
                                        setState(() {
                                          media.removeAt(index);
                                        });
                                      },
                                      index,
                                      context,
                                      (File file, int index) {
                                        setState(() {
                                          media[index] = {
                                            "type": "image",
                                            "file": file
                                          };
                                        });
                                      });
                                }),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Wrap(
                            children: [
                              iconTextButton(
                                  "Take a Photo",
                                  Colors.orange,
                                  () {},
                                  const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  context),
                              iconTextButton("Take a Video", Colors.blue,
                                  () async {
                                final video = await ImagePicker()
                                    .pickVideo(source: ImageSource.camera);
                              },
                                  const Icon(
                                    Icons.video_camera_back,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  context),
                              iconTextButton("Record a voice",
                                  isRecording ? Colors.black : Colors.red,
                                  () async {
                                File file = File("");
                                String? filePath;
                                if (await record.hasPermission()) {
                                  if (isRecording) {
                                    setState(() {
                                      isRecording = !isRecording;
                                    });
                                    filePath = await record.stop();
                                    file = File(filePath!);
                                    setState(() {
                                      media
                                          .add({"type": "audio", "file": file});
                                    });
                                  } else {
                                    setState(() {
                                      isRecording = !isRecording;
                                    });
                                    // await record.start(path: filePath!);
                                  }
                                }
                              },
                                  isRecording
                                      ? const Icon(Icons.stop,
                                          color: Colors.white, size: 30)
                                      : const Icon(
                                          Icons.mic,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                  context),
                              iconTextButton("Choose a photo", Colors.blue,
                                  () async {
                                final images =
                                    await ImagePicker().pickMultiImage();
                                for (var i = 0; i < images.length; i++) {
                                  File file = File(images[i].path);
                                  setState(() {
                                    media.add({"type": "image", "file": file});
                                  });
                                }
                              },
                                  const Icon(
                                    Icons.image,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  context),
                              iconTextButton("Select a video", Colors.orange,
                                  () async {
                                File file;
                                final video = await ImagePicker()
                                    .pickVideo(source: ImageSource.gallery);
                                if (video != null) {
                                  file = File(video.path);
                                  setState(() {
                                    media.add({"type": "video", "file": file});
                                  });
                                }
                              },
                                  const Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  context),
                              iconTextButton("Choose a file", Colors.purple,
                                  () async {
                                final result =
                                    await FilePicker.platform.pickFiles();
                                if (result != null) {
                                  String extension = lookupMimeType(
                                      result.files.single.path!)!;
                                  List<String> myArray = extension.split("/");
                                  setState(() {
                                    media.add({
                                      "type": "docs",
                                      "file": File(result.files.single.path!),
                                      "extension": myArray[1].contains("pdf")
                                          ? "pdf"
                                          : myArray[1].contains("presentation")
                                              ? "power-point"
                                              : myArray[1].contains("sheet")
                                                  ? "excel"
                                                  : myArray[1]
                                                          .contains("document")
                                                      ? "word"
                                                      : myArray[0] == "image"
                                                          ? "image"
                                                          : myArray[0] ==
                                                                  "video"
                                                              ? "video"
                                                              : ""
                                    });
                                  });
                                }
                              },
                                  const Icon(
                                    Icons.attachment,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  context),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              });
        },
        child: const Icon(Icons.attachment),
      ),
    );
  }
}

Widget iconTextButton(String name, Color color, Function function, Icon icon,
    BuildContext context) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.3,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: icon,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(name)
        ],
      ),
    ),
  );
}

Widget attachmentWidget(
    Map<String, dynamic> attachment,
    Function deleteAttachment,
    int index,
    BuildContext context,
    Function editImage) {
  VideoPlayerController videoPlayerController;
  Widget videoWidget = Container();
  if (attachment["type"] == "video") {
    videoPlayerController = VideoPlayerController.file(attachment["file"])
      ..initialize().then((value) {});
    videoWidget = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: VideoPlayer(videoPlayerController),
      ),
    );
  }
  return GestureDetector(
    onTap: () {
      OpenFilex.open(attachment["file"].path);
    },
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          attachment["type"] == "image"
              ? Align(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      attachment["file"],
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                )
              : attachment["type"] == "video"
                  ? videoWidget
                  : attachment["type"] == "audio"
                      ? Align(
                          child: Image.network(
                            "https://www.kindpng.com/picc/m/220-2203262_transparent-audio-symbol-png-volume-icon-png-png.png",
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                        )
                      : attachment["type"] == "docs"
                          ? Align(
                              child: attachment["extension"] == "pdf"
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        "https://media.istockphoto.com/vectors/file-icon-format-pdf-download-document-image-button-vector-doc-icon-vector-id1356214382?k=20&m=1356214382&s=612x612&w=0&h=ePIXaunywn6Ty1zxHFk8jtJUqH9E74BA9L5B3m3vf5I=",
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : attachment["extension"] == "word"
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7Gc35vru52VOvdoidjxRXOHZjLdFOSJND7fh-ADfqKBqz3MMYLbW2II5thFpukmye2nY&usqp=CAU"),
                                        )
                                      : attachment["extension"] == "excel"
                                          ? Image.network(
                                              "https://logos-world.net/wp-content/uploads/2022/02/Excel-Logo-2013.png")
                                          : attachment["extension"] ==
                                                  "power-point"
                                              ? Image.network(
                                                  "https://1000logos.net/wp-content/uploads/2020/08/Microsoft-PowerPoint-Logo.png")
                                              : attachment["extension"] ==
                                                      "image"
                                                  ? Align(
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.file(
                                                            attachment["file"],
                                                            width: 100,
                                                            fit: BoxFit.cover,
                                                          )),
                                                    )
                                                  : Container(),
                            )
                          : Container(),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () {
                  deleteAttachment(index);
                },
                child: const Icon(Icons.cancel)),
          ),
          attachment["type"] == "image"
              ? GestureDetector(
                  onTap: () async {
                    print("I want to edit this image");
                    var data = await attachment["file"].readAsBytes();
                    print("DATA : $data");
                    var editedImage = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ImageEditor(
                        image: data,
                      );
                    }));
                    print("EDITED IMAGE : $editedImage");
                    File file = await fromUint8ListToImage(editedImage);
                    editImage(file, index);
                  },
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.edit),
                  ),
                )
              : Container(),
        ],
      ),
    ),
  );
}

Future<File> fromUint8ListToImage(editedImage) async {
  int i = 0;
  final tempDir = await getTemporaryDirectory();
  String imagePath = "image$i.jpg";
  while (File("${tempDir.path}/$imagePath}").existsSync()) {
    i++;
    imagePath = "image$i.jpg";
  }
  final file = await File("${tempDir.path}/$imagePath").create();
  file.writeAsBytesSync(editedImage);
  print(file);
  return file;
}
