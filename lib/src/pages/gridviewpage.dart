import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridViewGallery extends StatefulWidget {
  const GridViewGallery({Key? key}) : super(key: key);

  @override
  _GridViewGalleryState createState() => _GridViewGalleryState();
}

class _GridViewGalleryState extends State<GridViewGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      // backgroundColor: Colors.pink,
      body: Gallery(),
    );
  }
}

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  bool loading = true;
  List<String> ids = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final url = Uri.parse('https://picsum.photos/v2/list');
    final response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final json = jsonDecode(response.body);

    for (var p in json) {
      ids.add(p['id']);
    }
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        String image = 'https://picsum.photos/500/300?image=$index';
        return  InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute<void>( builder: (BuildContext context) => FullScreenDialog(image: image), // fullscreenDialog: true, 
            ), );

          },
          child: FadeInImage(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: Image.network(image).image),
        );
      },
      itemCount: ids.length,
    );
  }
}

class FullScreenDialog extends StatelessWidget {
  String image;
   FullScreenDialog(
   { Key? key,
 required this.image,}
  ) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 0, 0, 0) ,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body:  Center(
        child: Image.network(image),
      ),
    );
  }
}
