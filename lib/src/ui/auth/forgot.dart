import 'package:flutter/material.dart';
import 'package:flutter_sample/src/theme/images.dart';
import 'package:flutter_sample/src/theme/my_fonts.dart';
class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> with SingleTickerProviderStateMixin {
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
        child: Container(
          child: SizedBox(
            height: size.height * 0.7,
            width: size.width * 0.8,
            child: Column(
              children: [
                Image.asset(
                  MyImages.forgotImage,
                  width: size.width * 0.6,
                  height: size.height * 0.3,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 3),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        padding: EdgeInsets.only(
                            left: size.width * 0.30, right: size.width * 0.30)),
                    onPressed: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => MyHome()));
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 18, fontFamily: MyFonts.SegoeUIBold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
