import 'package:flutter/material.dart';
import 'package:flutter_sample/src/theme/images.dart';
import 'package:flutter_sample/src/theme/my_fonts.dart';
import 'package:flutter_sample/src/ui/about_us.dart';
import 'package:flutter_sample/src/ui/notification/notifications.dart';
import 'package:flutter_sample/src/ui/profile.dart';
import 'package:flutter_sample/src/ui/settings.dart';

import 'Home.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  String? title = "Home";
  int selectionId = 0;

  _getScreen(int selectionId) {
    switch (selectionId) {
      case 0:
        return Home();
      case 1:
        return Settings();
      case 2:
        return Profile();
      case 3:
        return AboutUs();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _animation = Tween(begin: 0, end: 200).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: TextStyle(fontFamily: MyFonts.SegoeUIBold),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return {'Settings', 'Log Out'}.map((e) {
              return PopupMenuItem<String>(value: e, child: Text(e));
            }).toList();
          }),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey,
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: [
              DrawerHeader(
                child: Container(child: Image.asset(MyImages.loginImage)),
              ),
              SizedBox(
                height: 3,
                child: Container(
                  color: Colors.black,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(color: Colors.black54),
                child: ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: MyFonts.SegoeUIBoldItalic),
                  ),
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 25,
                  ),
                  onTap: () {
                    setState(() {
                      selectionId = 0;
                      title = 'Home';
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 3,
                child: Container(
                  color: Colors.black,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(color: Colors.black54),
                child: ListTile(
                  title: Text(
                    'Settings',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: MyFonts.SegoeUIBoldItalic),
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 25,
                  ),
                  onTap: () {
                    setState(() {
                      title = 'Settings';
                      selectionId = 1;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 3,
                child: Container(
                  color: Colors.black,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(color: Colors.black54),
                child: ListTile(
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: MyFonts.SegoeUIBoldItalic),
                  ),
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 25,
                  ),
                  onTap: () {
                    setState(() {
                      title = 'Profile';
                      selectionId = 2;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 3,
                child: Container(
                  color: Colors.black,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(color: Colors.black54),
                child: ListTile(
                  title: Text(
                    'About Us',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: MyFonts.SegoeUIBoldItalic),
                  ),
                  leading: Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 25,
                  ),
                  onTap: () {
                    setState(() {
                      title = 'About Us';
                      selectionId = 3;
                    });

                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 3,
                child: Container(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _getScreen(selectionId),
    );
  }
}
