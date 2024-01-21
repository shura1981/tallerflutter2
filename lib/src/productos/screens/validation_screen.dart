import 'package:flutter/material.dart';
import 'package:taller_flutter/src/productos/screens/home_productos.dart';
import 'package:taller_flutter/src/productos/screens/login_screen.dart';
import 'package:taller_flutter/src/productos/services/authentication_service.dart';

class ValidationScreen extends StatelessWidget {
  const ValidationScreen({Key? key}) : super(key: key);
  static const routeName = 'productos/validation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValidationScreen'),
      ),
      body: FutureBuilder(
          future: AuthenticationService.getToken(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('Token: ${snapshot.data}'),
              );
            }

            if (snapshot.data == '') {
              Future.microtask(() {
                //   Navigator.push(
                //       context,  MaterialPageRoute(builder: (_) => LoginProductScreen()));
//navigator con PageRouteBuilder
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => LoginProductScreen(),
                        transitionDuration: Duration(milliseconds: 0)));
              });
            } else {
              Future.microtask(() {
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeProductosScreen()));

                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => HomeProductosScreen(),
                        transitionDuration: Duration(milliseconds: 0)));
              });
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
