import 'package:flutter/material.dart';

import '../widgets/custom_textformfield.dart';

class TextFieldScreen extends StatelessWidget {
  onChange(value) {
    print('el valor es: $value');
  }

  String? validator(value) {
    if (value == null || value.length < 3) {
      return 'Campo requerido';
    }
    return null;
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
                  labelText: 'Nombres',
                  onChanged: (value) => formValue['firstName'] = value,
                  validator: validator,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  labelText: 'Apellidos',
                  onChanged: (value) => formValue['lastName'] = value,
                  // validator: validator,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  labelText: 'Correo',
                  onChanged: (value) => formValue['email'] = value,
                  // validator: validator,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                    isExpanded: true,
                    hint: Text('Seleccione el usuario'),
                    items: const [
                      DropdownMenuItem(
                        value: 'Admin',
                        child: Text('admin'),
                      ),
                      DropdownMenuItem(
                        value: 'User',
                        child: Text('user'),
                      ),
                      DropdownMenuItem(
                        value: 'Root',
                        child: Text('root'),
                      ),
                    ],
                    onChanged: (value) {
                      formValue['role'] = value ?? 'Admin';
                    }),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(15))),
                    onPressed: () {
                      // FocusScope.of(context).requestFocus(FocusNode());
                      if (!myFormKey.currentState!.validate()) {
                           print('No ingresa..');
                      } else {
                        print('ingresa..');
                        showDialog<bool>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('¿Deseas grabar los datos?'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Los datos son:'),
                                    Text(formValue.toString()),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                       Navigator.of(context).pop(false);
                                  },
                                ),
                                TextButton(
                                  child: const Text('Approve'),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ],
                            );
                          },
                        ).then((value) => print(value));
                      }
                    },
                    child: Center(
                      child: SizedBox(
                        child: Text('Enviar'),
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
