import 'package:flutter/material.dart';
import 'package:flutter_sample/src/theme/images.dart';
import 'package:flutter_sample/src/theme/my_fonts.dart';
import 'package:flutter_sample/src/ui/auth/login.dart';

import '../my_home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Size size = MediaQuery.of(context).size;
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

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
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: SizedBox(
                height: size.height * 0.7,
                width: size.width * 0.8,
                child: Column(
                  children: [
                    Image.asset(
                      MyImages.registerImage,
                      width: size.width * 0.6,
                      height: size.height * 0.3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 3),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.black54,
                        child: SizedBox(
                          height: size.height * 0.05,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: border,
                                hintText: 'Enter Name',
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: Colors.blue,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3, bottom: 3),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.black54,
                        child: SizedBox(
                          height: size.height * 0.05,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: border,
                                hintText: 'Enter Email-ID',
                                labelText: 'Email-ID',
                                labelStyle: TextStyle(
                                  color: Colors.blue,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3, bottom: 0.8),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: SizedBox(
                          height: size.height * 0.05,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter Password',
                                labelText: 'Password',
                                border: border,
                                labelStyle: TextStyle(
                                  color: Colors.blue,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            padding: EdgeInsets.only(
                                left: size.width * 0.28,
                                right: size.width * 0.28)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyHome()));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 18, fontFamily: MyFonts.SegoeUIBold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login()));
                            },
                            child: Text('Login',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: MyFonts.SegoeUIBoldItalic)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
