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
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/pancakes.jpg?quality=82&strip=1',
            fit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
            initialChildSize: .2,
            minChildSize: .1,
            maxChildSize: .6,
            expand: false,
            builder: (context, scrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(24),
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
    return Container(
      color: Colors.red,
      child: ListView.builder(
        itemCount: list.length,
        controller: controller,
        itemBuilder: (context, index) {
          final food = list[index];
          return ListTile(
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
          );
        },
      ),
    );
  }
}
