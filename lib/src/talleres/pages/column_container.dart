import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColumnScreen'),
      ),
      body: Columns(),
    );
  }
}

class Columns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const height = 20.0;
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: [
            buildBackgroundCard(),
            SizedBox(
              height: height,
            ),
            buildBackgroundCard(),
            SizedBox(
              height: height,
            ),
            buildBackgroundCard(),
            SizedBox(
              height: height,
            ),
            buildBackgroundCard(),
            SizedBox(
              height: height,
            ),
            buildBackgroundCard(),
            SizedBox(
              height: height,
            ),
            InkWell(
                splashColor: Colors.white,
                onTap: () {
                  print('on tap');
                },
                child: buildIconCard()),
            SizedBox(
              height: height,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: buildHamburguer()),
                    SizedBox(width: 5,),
                  Expanded(
                    flex: 1,
                    child: buildHamburguer())
                ],
              ),
            ),
                Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: buildHamburguer()),
                    SizedBox(width: 5,),
                  Expanded(
                    flex: 1,
                    child: buildHamburguer())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildBackgroundCard() {
  return Container(
    alignment: Alignment.topLeft,
    width: 300,
    height: 200,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              spreadRadius: 1.0,
              blurRadius: 3.0,
              offset: Offset(1.0, 5.0))
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.55), BlendMode.darken),
            fit: BoxFit.cover,
            image: Image.network(
                    'https://smoda.elpais.com/wp-content/uploads/images/201137/rubias_654621993.jpg')
                .image)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          'Cottage',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          '70-150\$',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ],
    ),
  );
}

Widget buildIconCard() {
  return Card(
    elevation: 10,
    color: Color(0xFF40358a),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    child: SizedBox(
      width: 160,
      height: 160,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Icon(
          Icons.access_time,
          color: Colors.grey,
          size: 48,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'ACTIVE',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '2 Times a day',
          style: TextStyle(color: Color.fromARGB(255, 243, 243, 243)),
        )
      ]),
    ),
  );
}

Widget buildHamburguer() {
  const url = 'assets/pngimg.com - burger_sandwich_PNG4134.png';
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      //  width: 200,
      padding: EdgeInsets.all(12),
      color: Color(0xFF010101),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => print('hamburguesa'),
              child: Image.asset(
                url,
                width: double.infinity,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Beff Burger',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              'Beff Burger',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$24.00',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () {
                        print("comprar");
                      },
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                      ))
                ],
              ),
            )
          ]),
    ),
  );
}
