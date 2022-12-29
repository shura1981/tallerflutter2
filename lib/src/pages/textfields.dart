import 'package:flutter/material.dart';

import '../widgets/custom_textformfield.dart';

class TextFieldScreen extends StatelessWidget {
  onChange(value) {
    print('el valor es: $value');
  }

  String validator(value) {
    if (value == null || value.length < 3) {
      return 'Campo requerido';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValue = {
      'firstName': 'Steven',
      'lastName': 'Realpe',
      'email': 'realpelee@gmail.com',
      'role': 'admin'
    };

    final myFormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: Text('Text field')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                Text('Inputs y forms'),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  onChanged: onChange,
                  validator: validator,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  onChanged: onChange,
                  validator: validator,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  onChanged: onChange,
                  validator: validator,
                ),
                     SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                    hint: Text('Seleccione el usuario'),
                  items: const [
                  DropdownMenuItem(value: 'Admin', child: Text('admin'),),
                    DropdownMenuItem(value: 'User', child: Text('user'),),
                      DropdownMenuItem(value: 'Root', child: Text('root'),),
                ],
                 onChanged: (value){
                   print("value $value");
                  //  formValue['role']= value ?? 'Admin';
                 }),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      // FocusScope.of(context).requestFocus(FocusNode());
                      if(!myFormKey.currentState!.validate()){
                       
                      }
                      print(formValue);
                    },
                    child: Center(
                      child: SizedBox(
                        child: Text("Enviar"),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
