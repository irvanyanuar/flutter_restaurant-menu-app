import 'package:flutter/material.dart';

import 'package:flutter_pemesanan_menu/models/Data.dart';
import 'package:flutter_pemesanan_menu/models/Menu.dart';
import 'package:flutter_pemesanan_menu/screens/detail_screen.dart';

class ListMenu extends StatelessWidget {
  final String menuType;

  ListMenu({required this.menuType});

  @override
  Widget build(BuildContext context) {
    var newMenu = menus.where((menu) => menu.type == menuType);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return menuList(newMenu, context);
      } else {
        return menuGrid(newMenu, context);
      }
    });
  }

  GridView menuGrid(Iterable<Menu> newMenu, BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: newMenu
          .map((menu) => Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(menu: menu);
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: menu.id,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'images/' + menu.picture,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          menu.name,
                          style:
                              TextStyle(fontFamily: 'South Sea', fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("IDR ${menu.price}"),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(menu.rating.toString()),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  SingleChildScrollView menuList(Iterable<Menu> newMenu, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: newMenu
            .map(
              (menu) => Card(
                elevation: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(menu: menu);
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Hero(
                                tag: menu.id,
                                child: Image.asset(
                                  'images/' + menu.picture,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  menu.name,
                                  style: TextStyle(
                                      fontFamily: 'South Sea', fontSize: 23),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(menu.rating.toString()),
                                  ],
                                ),
                              ],
                            ),
                            Text("IDR ${menu.price}")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
