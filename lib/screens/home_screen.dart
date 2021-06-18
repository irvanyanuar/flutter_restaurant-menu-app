import 'package:flutter/material.dart';
import 'package:flutter_pemesanan_menu/models/User.dart';
import 'package:flutter_pemesanan_menu/screens/about_screen.dart';
import 'package:flutter_pemesanan_menu/screens/list_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          title: Text(
            'Halo, ' + User.name,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.red,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AboutScreen();
                  }));
                },
                icon: Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.blue,
                )),
            SizedBox(
              width: 10,
            )
          ],
          foregroundColor: Colors.red,
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.red[600],
          unselectedLabelColor: Colors.red.shade200,
          indicatorColor: Colors.yellow,
          tabs: [
            Container(
              child: Tab(
                text: 'Makanan',
                icon: Icon(
                  Icons.food_bank,
                ),
              ),
            ),
            Container(
              child: Tab(
                text: 'Minuman',
                icon: Icon(
                  Icons.local_drink,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            (orientation == Orientation.portrait)
                ? Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/header.jpg'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/header2.png'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/header3.jpg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Silakan Pilih Menu ",
                  style: TextStyle(color: Colors.black54),
                ),
                Icon(Icons.menu_book_outlined, color: Colors.red)
              ],
            ),
            (orientation == Orientation.portrait)
                ? Flexible(
                    child: TabBarView(children: [
                      ListMenu(menuType: 'Makanan'),
                      ListMenu(menuType: 'Minuman'),
                    ]),
                  )
                : Flexible(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 9.5,
                          right: MediaQuery.of(context).size.width / 9.5),
                      child: TabBarView(children: [
                        ListMenu(menuType: 'Makanan'),
                        ListMenu(menuType: 'Minuman'),
                      ]),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
