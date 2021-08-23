import 'package:flutter/material.dart';
import 'package:flutter_sample/src/ui/about_us.dart';
import 'package:flutter_sample/src/ui/profile.dart';
import 'package:flutter_sample/src/ui/settings.dart';

import 'home.dart';

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
        title: Text(title!),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.deepOrangeAccent,
              )),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return {'Setting', 'Log Out'}.map((e) {
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
              Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://image.freepik.com/free-photo/hand-painted-watercolor-background-with-sky-clouds-shape_24972-1095.jpg"),
                        fit: BoxFit.cover)),
                child: DrawerHeader(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: const Color(0xFF0E3311).withOpacity(0.2),
                    ),
                    child: Column(children: [
                      Text(
                        'Sample App',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.deepOrange,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        'kamlesh6633ak@gmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ]),
                  ),
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
                    'Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
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
                        fontSize: 22,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
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
                        fontSize: 22,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
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
                        fontSize: 22,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 30,
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
