import 'package:advance_image_picker/configs/image_picker_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/src/ui/auth/login.dart';
import 'package:intl/intl.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var configs = ImagePickerConfigs();
    configs.appBarTextColor = Colors.black;
    configs.stickerFeatureEnabled = true; // ON/OFF features
    configs.translateFunc = (name, value) => Intl.message(value, name: name);
    return MaterialApp(
      // Setup image picker configs (global settings for app)

      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Login(),
    );
  }
}
