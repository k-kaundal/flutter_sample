import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/src/ui/my_home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Size size = MediaQuery.of(context).size;
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                Image.network(
                  'https://alexwebdevelop.com/wp-content/uploads/2019/08/php-login-and-authentication-the-definitive-guide.webp',
                  width: size.width * 0.6,
                  height: size.height * 0.3,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3, bottom: 3),
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
                Padding(
                  padding: EdgeInsets.only(top: 3, bottom: 0.8),
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
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: SizedBox(
                    width: size.width * 0.8,
                    child: Text('Forgot Password?', textAlign: TextAlign.end),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        padding: EdgeInsets.only(
                            left: size.width * 0.34, right: size.width * 0.34)),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyHome()));
                    },
                    child: Text(
                      'Login',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
