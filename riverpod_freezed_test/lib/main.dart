import 'package:flutter/material.dart';
import 'package:riverpod_freezed_test/pages/collections_page.dart';
import 'package:riverpod_freezed_test/pages/hotel_list_page.dart';
import 'package:riverpod_freezed_test/pages/method_page.dart';
import 'package:riverpod_freezed_test/pages/mutable_person_page.dart';
import 'package:riverpod_freezed_test/pages/person_page.dart';
import 'package:riverpod_freezed_test/widgets/custom_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freeezed Riverpod Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: const [
            CustomButton(
              title: 'Person',
              child: PersonPage(),
            ),
            CustomButton(
              title: 'Mutable Person',
              child: MutablePersonPage(),
            ),
            CustomButton(
              title: 'Collections',
              child: CollectionsPage(),
            ),
            CustomButton(
              title: 'Method',
              child: MethodPage(),
            ),
            CustomButton(
              title: 'Hotel List',
              child: HotelListPage(),
            ),
          ],
        ),
      ),
    );
  }
}
