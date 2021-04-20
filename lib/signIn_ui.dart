// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_profile_screen/playerSplash_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_profile_screen/signUp_ui.dart';
import 'package:get/get.dart';

import 'formValidator.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  FocusNode _focusNode = FocusNode();
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _animation = Tween(begin: 500, end: 50).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _animationController?.forward();
      } else {
        _animationController?.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222232),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xff222232),
          child: SafeArea(
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Text('Tap'),
                // ));
                FocusScope.of(context).requestFocus(FocusNode());
                print("tapped");
              },
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.only(top: 1),
                        color: Colors.black,
                        child: Opacity(
                          opacity: 0.4,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Color(0xff222232),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(50, 37, 35, 0),
                              child: PlayerSplash(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 250,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(24, 39, 24, 0),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xff222232),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              style: GoogleFonts.sourceSansPro(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            LoginUiText(
                              focusNode: _focusNode,
                            ),
                          ],
                        ),
                      ),
                    ),
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

class LoginUiText extends StatefulWidget {
  const LoginUiText({
    Key? key,
    required this.focusNode,
  }) : super(key: key);
  final FocusNode focusNode;
  @override
  _LoginUiTextState createState() => _LoginUiTextState();
}

class _LoginUiTextState extends State<LoginUiText>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _validate = false;
  String? _email;
  String? _password;
  bool _obscureText = true;
  bool _checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          new TextFormField(
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black54,
              focusColor: Color(0xff65656b),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.email_outlined,
                  color: Colors.grey[600],
                ),
              ),
              hintText: "Email",
              hintStyle: TextStyle(color: Color(0xff65656b)),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: FormValidator().validateEmail,
            onSaved: (val) => _email = val,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            focusNode: widget.focusNode,
          ),
          SizedBox(
            height: 12,
          ),
          new TextFormField(
            obscureText: _obscureText,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black54,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              hintText: "Password",
              hintStyle: TextStyle(color: Color(0xff65656b)),
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                color: Colors.grey[600],
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
            ),
            validator: FormValidator().validatePassword,
            onSaved: (val) => _password = val,
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 1.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _checkedValue,
                    onChanged: (val) {
                      setState(() {
                        _checkedValue = val!;
                      });
                    },
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 63,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.purple,
                backgroundColor: Color(0xff246bfd),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have account?",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => SignUp());
                },
                child: Text("Sign UP"),
              )
            ],
          )
        ],
      ),
    );
  }
}
