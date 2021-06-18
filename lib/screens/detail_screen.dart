import 'package:flutter/material.dart';
import 'package:flutter_pemesanan_menu/models/Menu.dart';

class DetailScreen extends StatefulWidget {
  final Menu menu;

  DetailScreen({required this.menu});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var isLiked = false;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return detailPortrait(context);
              } else {
                return detailLanscape(context);
              }
            }),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: (orientation == Orientation.landscape)
                        ? Colors.black
                        : Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.only(right: 20),
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: (orientation == Orientation.landscape)
                        ? Colors.black
                        : Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SafeArea detailLanscape(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width / 8,
            left: MediaQuery.of(context).size.width / 8,
            bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 400,
                    width: 400,
                    child: Hero(
                      tag: widget.menu.id,
                      child: Image.asset('images/' + widget.menu.picture),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.menu.name,
                          style:
                              TextStyle(fontFamily: 'South Sea', fontSize: 35),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "IDR ${widget.menu.price}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text('4.5'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.menu.description,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Card(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: (isLiked) ? Colors.red : null,
                        )),
                  ),
                  Expanded(
                    child: Container(
                      height: 47,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  widget.menu.name + " ditambahkan ke Cart!"),
                            ),
                          );
                        },
                        child: Text('Tambahkan ke Cart'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Column detailPortrait(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: Hero(
            tag: widget.menu.id,
            child: Image.asset(
              'images/' + widget.menu.picture,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Card(
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
            width: double.infinity,
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.menu.name,
                        style: TextStyle(fontFamily: 'South Sea', fontSize: 35),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text('4.5'),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    "IDR ${widget.menu.price}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.menu.description,
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Card(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                      color: (isLiked) ? Colors.red : null,
                    )),
              ),
              Expanded(
                child: Container(
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text(widget.menu.name + " ditambahkan ke Cart!"),
                        ),
                      );
                    },
                    child: Text('Tambahkan ke Cart'),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
