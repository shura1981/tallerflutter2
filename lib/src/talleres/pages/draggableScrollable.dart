// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
    // isDismissible: false,
    enableDrag: true,
    // isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) => MyBottomSheet(),
  );
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: list.map((food) {
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
            }).toList()),
      ),
    );
  }
}
