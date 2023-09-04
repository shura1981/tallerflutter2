import 'package:flutter/material.dart';

import '../widgets/buttonWidget.dart';

class TextFieldsScreen extends StatefulWidget {
  const TextFieldsScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldsScreen> createState() => _TextFieldsScreenState();
}

class _TextFieldsScreenState extends State<TextFieldsScreen> {
  String _errorText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  bool showPass = true;
  String pass = '';
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text fields"),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          onVerticalDragDown: (details) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              buildEmail(),
              const SizedBox(
                height: 20,
              ),
              buildPass(),
              const SizedBox(
                height: 40,
              ),
              ButtonWidget(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  setState(() {
                    if (pass.length < 5)
                      _errorText = "contraseña no válida";
                    else
                      _errorText = '';
                  });
                  print(pass);
                  print(emailController.text);
                },
                text: "Aceptar",
              )
            ],
          ),
        ));
  }

  Widget buildEmail() {
    return TextField(
      controller: emailController,
      onTap: () => print("cambiar color foco"),
      style: const TextStyle(color: Colors.red),
      decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: const TextStyle(color: Colors.red),
          hintText: 'name@example.com',
          hintStyle: const TextStyle(color: Colors.red),
          filled: true,
          fillColor: const Color.fromARGB(255, 208, 208, 208).withOpacity(.3),
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.red,
          ),
          suffixIcon: emailController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(
                    color: Colors.red,
                    Icons.close,
                  ),
                  onPressed: () {
                    emailController.clear();
                  },
                ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 236, 32, 18)),
              borderRadius: BorderRadius.all(Radius.circular(30)))),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget buildPass() {
    return TextField(
      // controller: emailController,
      onTap: () => print("cambiar color foco"),
      onChanged: (value) => pass = value,
      style: const TextStyle(color: Colors.red),
      obscureText: showPass,
      decoration: InputDecoration(
          errorText: _errorText,
          labelText: 'Password',
          labelStyle: const TextStyle(color: Colors.red),
          hintStyle: const TextStyle(color: Colors.red),
          filled: true,
          fillColor: const Color.fromARGB(255, 208, 208, 208).withOpacity(.3),
          suffixIcon: IconButton(
            icon: !showPass
                ? const Icon(
                    color: Colors.red,
                    Icons.visibility_off,
                  )
                : const Icon(
                    color: Colors.red,
                    Icons.visibility,
                  ),
            onPressed: () {
              setState(() {
                showPass = !showPass;
              });
            },
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 236, 32, 18)),
              borderRadius: BorderRadius.all(Radius.circular(30)))),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
