import 'dart:io';

import 'package:flutter/material.dart';

import 'package:open_settings_plus/android/open_settings_plus_android.dart';
import 'package:open_settings_plus/ios/open_settings_plus_ios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const settingsiOS = OpenSettingsPlusIOS();
  static const settingsAndroid = OpenSettingsPlusAndroid();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Builder(builder: (context) {
          if (Platform.isAndroid) {
            return _buildAndroidList();
          } else if (Platform.isIOS) {
            return _buildIOSList();
          } else {
            return const Center(
              child: Text("Unsupported platform"),
            );
          }
        }),
      ),
    );
  }

  ListView _buildIOSList() {
    return ListView(
      children: [
        ListTile(
          onTap: settingsiOS.settings,
          title: const Text("Open settings"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.wifi,
          title: const Text("Open wi-fi"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.about,
          title: const Text("Open about"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.accessibility,
          title: const Text("Open accessibility"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.accountSettings,
          title: const Text("Open account settings"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.autoLock,
          title: const Text("Open auto lock"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.battery,
          title: const Text("Open battery"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.bluetooth,
          title: const Text("Open bluetooth"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.dateAndTime,
          title: const Text("Open date and time"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.faceIDAndPasscode,
          title: const Text("Open face ID and passcode"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.cellular,
          title: const Text("Open cellular"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.dictionary,
          title: const Text("Open dictionary"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.displayAndBrightness,
          title: const Text("Open display and brightness"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.general,
          title: const Text("Open general"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.iCloud,
          title: const Text("Open iCloud"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.music,
          title: const Text("Open music"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.keyboard,
          title: const Text("Open keyboard"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.keyboards,
          title: const Text("Open keyboards"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.languageAndRegion,
          title: const Text("Open language and region"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.locationServices,
          title: const Text("Open location services"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.personalHotspot,
          title: const Text("Open personal hotspot"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.phone,
          title: const Text("Open phone"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.photosAndCamera,
          title: const Text("Open photos and camera"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.privacy,
          title: const Text("Open privacy"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.profilesAndDeviceManagement,
          title: const Text("Open Profiles"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.storageAndBackup,
          title: const Text("Open storage and backup"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.siri,
          title: const Text("Open siri"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsiOS.soundsAndHaptics,
          title: const Text("Open sounds and haptics"),
          trailing: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  ListView _buildAndroidList() {
    return ListView(
      children: [
        ListTile(
          onTap: settingsAndroid.wifi,
          title: const Text("Open wifi"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.accessibility,
          title: const Text("Open accessibility"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.addAccount,
          title: const Text("Open add account"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.airplaneMode,
          title: const Text("Open airplane mode"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.apnSettings,
          title: const Text("Open apn settings"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.appNotification,
          title: const Text("Open app notification"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.appSettings,
          title: const Text("Open app settings"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.applicationDetails,
          title: const Text("Open application details"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.applicationDevelopment,
          title: const Text("Open application development"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.applicationNotification,
          title: const Text("Open application notification"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.applicationSettings,
          title: const Text("Open application settings"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.applicationWriteSettings,
          title: const Text("Open application write settings"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.batterySaver,
          title: const Text("Open battery saver"),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: settingsAndroid.bluetooth,
          title: const Text("Open bluetooth"),
          trailing: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
