import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/widgets.dart';

class AvanceScreen extends StatefulWidget {
  const AvanceScreen({Key? key}) : super(key: key);

  @override
  State<AvanceScreen> createState() => _AvanceScreenState();
}

class _AvanceScreenState extends State<AvanceScreen> {
  int index = 0;

  Widget buildBottomBar() {
    return Container(
      color: Color(0xff202333),
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xff2E305F),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: false,
          currentIndex: index,
          
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Basic',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Advanced',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cabin),
              label: 'TabBar',
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),
      ),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return Stack(
          children: [BackgroundWidget(), _HomeBody()],
        );
      case 1:
        return Container(child: BackgroundWidget(),);
      case 2:
       return Container(child: BackgroundWidget(),);
      default:
        return Container(child: BackgroundWidget(),);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
        bottomNavigationBar: buildBottomBar(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('AvanceScreen'),
        ),
        body: buildPages());
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PateTitle(),
        ],
      ),
    );
  }
}

