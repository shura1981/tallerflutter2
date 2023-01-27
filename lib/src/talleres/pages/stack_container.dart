import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack container')),
      body: ListView(children: [
        CustomStackContainer(),
        SizedBox(
          height: 100,
        ),
        StackContainer(),
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CardsStack(),
        ),
           SizedBox(
          height: 100,
        ),
      ]),
    );
  }
}

class CardsStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
   
children:  [
CardImage(url:images[0], margin:  EdgeInsets.symmetric(  horizontal: 40 ).copyWith(top:0),),
CardImage(url:images[1], margin:  EdgeInsets.symmetric( horizontal: 20 ).copyWith(top:60),),
CardImage(url:images[2], margin:  EdgeInsets.symmetric().copyWith(top:120),),
],

    );

  }
}

class CardImage extends StatelessWidget {
  final String url;
  
  final EdgeInsets margin;

   const CardImage({
    Key? key, required this.url, required this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Container(
      margin: margin,
      child: AspectRatio(
        aspectRatio: 1,
        child:   Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(url).image,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.darken)
              ),
          ),
        ),
      ),
    );
  }
}

class CustomStackContainer extends StatelessWidget {
  const CustomStackContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Color.fromARGB(255, 113, 113, 113),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(100))),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -30,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 2.0,
                          blurRadius: 10.0,
                          offset: Offset(2.0, 10.0))
                    ]),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: Color.fromARGB(255, 236, 243, 33),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StackContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const url =
        'https://smoda.elpais.com/wp-content/uploads/images/201137/rubias_654621993.jpg';

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 300,
          color: Colors.orange,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -30,
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                  color: Colors.white, spreadRadius: 4
                ),
                 BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              spreadRadius: 2.0,
                              blurRadius: 10.0,
                              offset: Offset(2.0, 10.0))
                ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      image: Image.network(url).image)),
            ),
          ),
        )
      ],
    );
  }
}

List<String> images= [
  'http://resizer.sevilla.abc.es/resizer/resizer.php?imagen=https://sevilla.abc.es/estilo/bulevarsur/wp-content/uploads/sites/14/2021/05/apertura-mechas.jpg&nuevoancho=652',
'https://www.soycarmin.com/__export/1645815631100/sites/debate/img/2022/02/25/danna-paola-mechas-rubias-instagram_crop1645815499350.jpg_1902800913.jpg',
'https://www.billboard.com/wp-content/uploads/2022/10/christina-aguilera-2019-b-billboard-espagnol-1548.jpg'
];