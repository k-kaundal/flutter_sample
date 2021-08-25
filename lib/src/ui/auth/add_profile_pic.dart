import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sample/src/theme/images.dart';
import 'package:flutter_sample/src/theme/my_fonts.dart';
import 'package:flutter_sample/src/utils/common_utils.dart';

import '../my_home.dart';

class AddProfilePic extends StatefulWidget {
  const AddProfilePic({Key? key}) : super(key: key);

  @override
  _AddProfilePicState createState() => _AddProfilePicState();
}

class _AddProfilePicState extends State<AddProfilePic>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String? profilePic_;
  List<String> _imgObjs = [];

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
    profilePic_ = _imgObjs.length.toString();
    Size size = MediaQuery.of(context).size;
    var image;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Card(
                      elevation: 5,
                      child: Container(
                          width: 300,
                          height: 300,
                          child: Stack(children: [
                            Center(
                              child: Container(
                                child: _imgObjs.length != 0
                                    ? Card(
                                        // shadowColor: MyColors.myWhite,
                                        child: StreamBuilder(builder:
                                            (BuildContext context,
                                                AsyncSnapshot<dynamic>
                                                    snapshot) {
                                        return Image.file(File(_imgObjs[0]),
                                            fit: BoxFit.fill);
                                      }))
                                    : Card(
                                        elevation: 5,
                                        shadowColor: Colors.black,
                                        child: Image.network(
                                          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_960_720.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () async {
                                    _imgObjs = await CommonUtils()
                                        .openMultiImagePicker(context, 1);
                                    print("images lenght " +
                                        _imgObjs.length.toString());
                                    setState(() {
                                      image = _imgObjs[0];
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, bottom: 2),
                                    child: Image.asset(
                                      MyImages.camera,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                )),
                          ])),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyHome()));
                    },
                    icon: Icon(Icons.navigate_next),
                    label: Text(
                      'Next',
                      style: TextStyle(fontFamily: MyFonts.SegoeUIBold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
