// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taller2/src/talleres/pages/palatte.dart';
import 'package:taller2/src/talleres/pages/widgets/input_pass_login.dart';

import 'widgets/button_login.dart';
import 'widgets/forgot_pass.dart';
import 'widgets/input_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Background(),
        Content(),
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
                colors: const [Colors.black, Colors.black12],
                begin: Alignment.bottomCenter,
                end: Alignment.center)
            .createShader(bounds);
      },
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/food.jpg').image,
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken))),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                  child: Text(
                'FoodyBite',
                style: kHeading,
              )),
              const SizedBox(height: 100),
              InputLogin(
                hintText: 'Email',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                hintStyle: kInputStyleLato,
                icon: Icon(Icons.email, color: Colors.white, size: 30),
              ),
              const SizedBox(height: 20),
              InputLoginPass(
                hintText: 'Password',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                hintStyle: kInputStyleLato,
                icon: Icon(Icons.security, color: Colors.white, size: 30),
              ),
              const SizedBox(height: 20),
              ButtonForgotPass(),
              ButtonLogin(),
              SizedBox(height: 80),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1))),
                  child: Text(
                    'Create new account',
                    style: kInputStyleLato,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
