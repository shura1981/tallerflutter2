import 'package:flutter/material.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({Key? key}) : super(key: key);

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  ScrollController? controller = new ScrollController();
  bool mostrar = false;
  @override
  void initState() {
    controller!.addListener(() {
      print(
          '${controller!.position.pixels}, ${controller!.position.maxScrollExtent}');
      if ((controller!.position.pixels + 200) >=
          controller!.position.maxScrollExtent) {
        mostrar = true;
        setState(() {});
      }

      if ((controller!.position.pixels) <= 100) {
        mostrar = false;
        setState(() {});
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 96, 218),
      // extendBodyBehindAppBar: true,
      floatingActionButton: mostrar
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                controller!.animateTo(0,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn);
              },
            )
          : null,
      // appBar: AppBar(
      //   // flexibleSpace: Image(
      //   //     alignment: Alignment.topCenter,
      //   //     fit: BoxFit.cover,
      //   //     image: Image.network(
      //   //             'https://smoda.elpais.com/wp-content/uploads/images/201137/rubias_654621993.jpg')
      //   //         .image),
      //   backgroundColor: Colors.transparent,
      //   // flexibleSpace: Container(
      //   //   decoration: BoxDecoration(
      //   //     gradient: LinearGradient(colors: const [ Colors.deepPurple,  Colors.purple, Colors.pink])
      //   //   ),
      //   // ),
      //   // bottom: PreferredSize(
      //   //     child: Container(
      //   //       decoration: BoxDecoration(
      //   //           gradient: LinearGradient(colors: const [
      //   //         Colors.deepPurple,
      //   //         Colors.purple,
      //   //         Colors.pink
      //   //       ])),
      //   //     ),
      //   //     preferredSize: Size.fromHeight(100)),
      //   title: Text('Stack container'),
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(20),
      //           bottomRight: Radius.circular(20))),
      // ),
      body: CustomScrollView(controller: controller, slivers: [
        SliverAppBar(
          toolbarHeight: 65,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black87,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 255, 255, 255)),
              ),
            )
          ],
          // floating: true,
          pinned: true,
          expandedHeight: 300,
          backgroundColor: Color.fromARGB(255, 25, 96, 218),
          flexibleSpace: FlexibleSpaceBar(
              background: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.55), BlendMode.darken),
                      fit: BoxFit.cover,
                      image: Image.network(
                              'https://nutramerican.com/api_MegaplexStar/assets/blog/daniela/memoria_xl.webp')
                          .image)),
                          // child: Text(
                          //   'Bienvenidos',
                          //   style:
                          //       TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 40),
                          // ),
                        ),
              )),
          bottom: PreferredSize(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                    child: Text(
                  '¿Sabes qué es la memoria muscular?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 8, 8),
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                )),
              ),
              preferredSize: Size.fromHeight(20)),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            padding: EdgeInsets.all(10),
            color: Color.fromARGB(255, 255, 255, 255),
            // height: 200,
            width: double.infinity,
            child: Text(
                  '''
La memoria celular en el músculo esquelético existe y es lograda por conexiones neuromusculares logradas con múltiples entrenamientos y resultando en la hipertrofia.Está hipertrofia es “recordada” al punto tal que una fibra que anteriormente ha sido grande, pero que subsecuentemente pierde su masa, puede recobrar su volumen más rápido que fibras que jamás han sido entrenadas.
La fibra muscular💪🏼 es una célula como tal, contiene muchos núcleos, mitocondrias, retículo sarcoplasmico (Donde se guarda el calcio), almacén de energía "glucógeno" y "triglicéridos"; pero lo que realmente da su estructura y soporte, son las proteínas. ¿Cuáles proteínas?
Actina, miosina, troponinas C,I,T, tropomiosina, titina, nebulina.

Si realmente queremos mejorar nuestra masa muscular, debemos dar el substrato para ello; es decir consumir proteína.
De fuente animal y vegetal, pero no deben faltar 2 clases de proteína, en momentos especiales: ⭐️De absorción rápida, Proteína de suero de leche aislada; al despertar y después del entrenamiento. Ejemplo: #Bipro ⭐️De absorción lenta, Proteína de Caseinato de calcio, antes de dormir. Ejemplo: #MegaplexComplexNight 8 horas.
 ''',
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 8, 8),
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
          ),
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

RowPanel(),
SizedBox(
            height: 100,
          ),

        ]))
      ]),
    );
  }
  
Widget RowPanel() {
const double height=84;
return Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ClipRRect(
      borderRadius: BorderRadius.circular(20),
  child: Container(
    padding: EdgeInsets.all(8),
    color: Colors.black,
    child: Row(
  children: [
  ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child:   Image(
      height: height,
      width: height,
      fit: BoxFit.cover,
      image: Image.network('https://nutramerican.com/api_MegaplexStar/assets/blog/daniela/memoria_xl.webp')
                              .image),
  ),
SizedBox(width: 10,),
  Expanded(child: Text('Chemistry', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),)),
ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Container(
     height: height,
      width: height,
    padding: EdgeInsets.all(8),
    color: Color.fromARGB(137, 85, 85, 85),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:const [
          Text('119', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30, color: Colors.white),),
           Text('Precio', style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15, color: Color.fromARGB(255, 174, 174, 174)),)
        ],
      ),
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

class CardsStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        CardImage(
          url: images[0],
          margin: EdgeInsets.symmetric(horizontal: 40).copyWith(top: 0),
        ),
        CardImage(
          url: images[1],
          margin: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 60),
        ),
        CardImage(
          url: images[2],
          margin: EdgeInsets.symmetric().copyWith(top: 120),
        ),
      ],
    );
  }
}

class CardImage extends StatelessWidget {
  final String url;

  final EdgeInsets margin;

  const CardImage({Key? key, required this.url, required this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(url).image,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.25), BlendMode.darken)),
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
                    BoxShadow(color: Colors.white, spreadRadius: 4),
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

List<String> images = [
  'http://resizer.sevilla.abc.es/resizer/resizer.php?imagen=https://sevilla.abc.es/estilo/bulevarsur/wp-content/uploads/sites/14/2021/05/apertura-mechas.jpg&nuevoancho=652',
  'https://www.soycarmin.com/__export/1645815631100/sites/debate/img/2022/02/25/danna-paola-mechas-rubias-instagram_crop1645815499350.jpg_1902800913.jpg',
  'https://www.billboard.com/wp-content/uploads/2022/10/christina-aguilera-2019-b-billboard-espagnol-1548.jpg'
];
