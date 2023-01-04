import 'package:flutter/material.dart';
 

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
  List<String> ids = [ ];

getData() async{
final url= Uri.parse('https://picsum.photos/v2/list');

}



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        String image = 'https://picsum.photos/500/300?image=$index';
        return FadeInImage(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: Image.network(image).image);
      },
      itemCount: ids.length,
    );
  }
}
