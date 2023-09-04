import 'package:flutter/material.dart';

class DesktopBody extends StatelessWidget {
   
  const DesktopBody({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T A B L E T'),
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                //youtube video
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 8,
                    child: Container(
                      color: Colors.deepPurple[400],
                    ),
                  ),
                ),
                //comment section & recommend videos
                Expanded(child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
                        color: Colors.deepPurple[300],
                        child: Text("index: $index"),
                      ),
                    );
                  },
                ))
              ],
            ),
          ),
      Container(
        color: Colors.deepPurple[300],
        width: 300,
        child: const Center(child: Text("comments")))
        ],
      ),
    );
  }
}