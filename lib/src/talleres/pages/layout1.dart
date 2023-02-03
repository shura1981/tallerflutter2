import 'package:flutter/material.dart';

class Layout1Screen extends StatelessWidget {
  const Layout1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text('Layout1Screen'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/a-/AOh14GjR7gEsaI7P2twKde42cKHh3FJrb865iCesZPz8'),
            ),
          )
        ],
      ),
      body: Body(),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Theme.of(context).primaryColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_off_outlined), label: 'Home')
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Material(
            elevation: 10,
            child: Container(
              margin: EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Search',
                    icon: Icon(Icons.search)),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'PHOTOGRAPHY',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Container(
                            child: Image.network(
                              'https://smoda.elpais.com/wp-content/uploads/images/201137/rubias_654621993.jpg',
                              width: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: 300,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: Image.network(
                                      'https://smoda.elpais.com/wp-content/uploads/images/201137/rubias_654621993.jpg')
                                  .image,
                            ),
                            title: Text('hogo yamada'),
                            subtitle: Text('ago 2 hours'),
                          ),
                        ))
                  ],
                );
              }),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 40),
            child: Text(
              'DESIGNS',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 400,
            margin: EdgeInsets.only(bottom: 30),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Ink(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Color.fromARGB(50, 0, 0, 0),  BlendMode.darken),
                                  image: Image.network(
                                          'https://smoda.elpais.com/wp-content/uploads/images/201137/rubias_654621993.jpg')
                                      .image)),
                          height: 400,
                          width: 300,
                          child: InkWell(
                            // splashColor: Theme.of(context).primaryColor,
                            overlayColor: MaterialStateProperty.all(
                                Color.fromARGB(65, 255, 7, 226)),
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.transparent,
                              height: double.infinity,
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomLeft,
                              child: Text('Hogo Yamada', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: SizedBox(
                          // padding: EdgeInsets.only(left: 10, right: 10),
                          width: 300,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: Image.network(
                                      'https://smoda.elpais.com/wp-content/uploads/images/201137/rubias_654621993.jpg')
                                  .image,
                            ),
                            title: Text('hogo yamada'),
                            subtitle: Text('ago 2 hours'),
                          ),
                        ))
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
