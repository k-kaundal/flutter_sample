import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sample/src/theme/my_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Image.network(
            "https://estilo-tendances.com/wp-content/uploads/2020/01/e883b8ba079d25e01ca78d53fe086687.jpeg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            color: const Color(0xFFEACBCB).withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.3,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 5,
                          borderOnForeground: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500.0),
                          ),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            child: Stack(children: [
                              Container(
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              "https://images.unsplash.com/photo-1520635360276-79f3dbd809f6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2lybCUyMHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")))),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: () async {
                                      setState(() {});
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, bottom: 4),
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 40,
                                        )),
                                  )),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: SizedBox(
                          child: Container(
                            height: size.height * 0.001,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontFamily: MyFonts.SegoeUI,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: 20, left: 20, bottom: 10),
                        child: Card(
                          elevation: 2,
                          color: const Color(0xFFFCFFFC).withOpacity(0.0),
                          borderOnForeground: false,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Kamlesh",
                                      style: TextStyle(
                                          fontFamily: MyFonts.SegoeUIBoldItalic,
                                          fontSize: 17,
                                          color: Colors.white),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: SizedBox(
                          child: Container(
                            height: size.height * 0.001,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Text(
                          'Email-ID',
                          style: TextStyle(fontFamily: MyFonts.SegoeUI),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: 20, left: 20, bottom: 10),
                        child: Card(
                          color: const Color(0xFF0E3311).withOpacity(0.0),
                          elevation: 2,
                          borderOnForeground: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "kamlesh6633ak@gmail.com",
                                      style: TextStyle(
                                          fontFamily: MyFonts.SegoeUIBoldItalic,
                                          fontSize: 17,
                                          color: Colors.white),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: SizedBox(
                          child: Container(
                            height: size.height * 0.001,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Text(
                          'Phone Number',
                          style: TextStyle(fontFamily: MyFonts.SegoeUI),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: 20, left: 20, bottom: 10),
                        child: Card(
                          color: const Color(0xFF0E3311).withOpacity(0.0),
                          elevation: 2,
                          borderOnForeground: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "+918219416633",
                                      style: TextStyle(
                                          fontFamily: MyFonts.SegoeUIBoldItalic,
                                          fontSize: 17,
                                          color: Colors.white),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: SizedBox(
                          child: Container(
                            height: size.height * 0.001,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
