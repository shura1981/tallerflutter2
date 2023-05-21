// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Food {
  String description;

  String image;

  String title;

  Food({required this.title, required this.description, required this.image});
}

class DraggableScrollabe extends StatefulWidget {
  const DraggableScrollabe({super.key});

  @override
  State<DraggableScrollabe> createState() => _DraggableScrollabeState();
}

bool show = false;

final List<Food> list = [
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
  Food(
      title: 'Hamburguer 10',
      description: 'Deliciosa hamburguesa con doble queso',
      image:
          'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1'),
];

class _DraggableScrollabeState extends State<DraggableScrollabe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Draggable'),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  showBottomSheet(context);
                },
                icon: Icon(Icons.open_in_browser)),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1',
            fit: BoxFit.cover,
          ),
          if (show)
            DraggableScrollableSheet(
              initialChildSize: .2,
              minChildSize: .1,
              maxChildSize: .8,
              expand: false,
              builder: (context, scrollController) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  child: Container(
                      color: Colors.white70,
                      child: ListFood(controller: scrollController)),
                );
              },
            )
        ],
      ),
    );
  }
}

class ListFood extends StatelessWidget {
  ScrollController? controller;
  ListFood({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Container(
        color: Color.fromARGB(115, 235, 235, 235),
        child: Column(
            children: list.map((food) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.red,
              onTap: () => print(food.title),
              child: ListTile(
                title: Text(
                  food.title,
                ),
                subtitle: Text(food.description),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      food.image,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    )),
              ),
            ),
          );
        }).toList()),
      ),
    );
  }
}

showBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: true,
    enableDrag: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) => MyBottomSheet(),
  );
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
        initialChildSize: .5,
        maxChildSize: .8,
        minChildSize: .5,
        builder: (BuildContext context, ScrollController scrollController) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(18),
              child: ListView(
                controller: scrollController,
                children: listOptions(context),
              ),
            ),
          );
        },
      ),
    );
  }

  listOptions(BuildContext context) {
    return list.map((food) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            print(food.title);
            Navigator.of(context).pop();
          },
          child: ListTile(
            title: Text(
              food.title,
            ),
            subtitle: Text(food.description),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  food.image,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                )),
          ),
        ),
      );
    }).toList();
  }
}

class Bonnie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        CircleAvatar(
          maxRadius: 60,
          backgroundImage: Image.network(
            'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSK7tFSJPsJW3XXDj8x64bnNc6-tv846qOPV5X5RFXOyPovh40XkngoEcaAp4zomnIN',
            fit: BoxFit.cover,
          ).image,
        ),
        SizedBox(height: 20),
        Text(
            'El conejo común o conejo europeo es una especie de mamífero lagomorfo de la familia Leporidae, y el único miembro actual del género Oryctolagus. Mide hasta 50 cm y su masa puede ser hasta 2.5 kg. Ha sido introducido en varios continentes y es la especie que se utiliza en la cocina y en la cunicultura'),
        SizedBox(height: 10),
        Text(
            'El conejo común o conejo europeo es una especie de mamífero lagomorfo de la familia Leporidae, y el único miembro actual del género Oryctolagus. Mide hasta 50 cm y su masa puede ser hasta 2.5 kg. Ha sido introducido en varios continentes y es la especie que se utiliza en la cocina y en la cunicultura'),
        SizedBox(height: 10),
        Text(
            'El conejo común o conejo europeo es una especie de mamífero lagomorfo de la familia Leporidae, y el único miembro actual del género Oryctolagus. Mide hasta 50 cm y su masa puede ser hasta 2.5 kg. Ha sido introducido en varios continentes y es la especie que se utiliza en la cocina y en la cunicultura'),
        SizedBox(height: 30),
        FilledButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
            label: Text('Cerrar')),
        SizedBox(height: 30),
      ]),
    );
  }
}
