import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('BasicScreen'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.55), BlendMode.darken),
                      fit: BoxFit.cover,
                      image: Image.network(
                              'https://smoda.elpais.com/wp-content/uploads/images/201137/rubias_654621993.jpg')
                          .image)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'title sdkfjalsñkdf  sdf',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Subtitle sdfsd sdf sdf',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text('41'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoColumn(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    text: Text('CALL'),
                  ),
                  InfoColumn(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    text: Text('CALL'),
                  ),
                  InfoColumn(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    text: Text('CALL'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  'Aliqua nulla id voluptate ipsum tempor incididunt cillum. Minim ad cupidatat veniam aute reprehenderit id minim ad nisi amet aliquip incididunt. Incididunt irure laboris velit consectetur cupidatat magna minim amet elit amet dolore pariatur esse adipisicing. Consequat consequat pariatur do exercitation adipisicing minim fugiat. Tempor pariatur consectetur Lorem nostrud occaecat enim ut aute do consequat laborum do fugiat. Reprehenderit laborum et pariatur exercitation minim duis ex dolor tempor veniam.'),
            )
          ],
        ),
      ),
    );
  }
}

class InfoColumn extends StatelessWidget {
  InfoColumn({super.key, required this.icon, required this.text});
  Icon icon;
  Text text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [icon, SizedBox(height: 5), text],
    );
  }
}
