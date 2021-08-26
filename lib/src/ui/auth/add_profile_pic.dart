import 'dart:io';

import 'package:flutter/material.dart';
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
      body: Container(
        color: const Color(0xFFEACBCB).withOpacity(0.2),
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Image.network(
              "https://estilo-tendances.com/wp-content/uploads/2020/01/e883b8ba079d25e01ca78d53fe086687.jpeg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Center(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Container(
                                width: 200,
                                height: 200,
                                child: Stack(children: [
                                  Center(
                                    child: Container(
                                      child: _imgObjs.length != 0
                                          ? Container(
                                              height: 200,
                                              width: 200,
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            500.0),
                                                  ),
                                                  // shadowColor: MyColors.myWhite,
                                                  child: StreamBuilder(builder:
                                                      (BuildContext context,
                                                          AsyncSnapshot<dynamic>
                                                              snapshot) {
                                                    return Image.file(
                                                        File(_imgObjs[0]),
                                                        fit: BoxFit.fill);
                                                  })),
                                            )
                                          : Container(
                                              height: 200,
                                              width: 200,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          500.0),
                                                ),
                                                elevation: 5,
                                                shadowColor: Colors.black,
                                                child: Image.network(
                                                  "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_960_720.png",
                                                  fit: BoxFit.fill,
                                                ),
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
                                                right: 10, bottom: 4),
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.blueGrey,
                                              size: 40,
                                            )),
                                      )),
                                ])),
                          ),
                        ),
                      ]),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyHome()));
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
            )
          ],
        ),
      ),
    );
  }
}
