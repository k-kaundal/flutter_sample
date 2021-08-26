import 'package:advance_image_picker/configs/image_picker_configs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/src/ui/auth/login.dart';
import 'package:intl/intl.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

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
      home: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error initializing Firebase');
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Login();
          }
          return CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.orange,
            ),
          );
        },
      ),
    );
  }
}
