import 'package:flutter/material.dart';
import 'package:modul_3/accountPage.dart';

class mPage extends StatefulWidget {
  @override
  State<mPage> createState() => _mPageState();
}

class _mPageState extends State<mPage> {
  List a = [
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/02/01/22/02/mountain-landscape-2031539_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/09/14/18/04/dandelion-445228_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/07/11/15/43/pretty-woman-1509956_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/02/13/12/26/aurora-1197753_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/08/05/26/woman-1807533_960_720.jpg",
    "https://cdn.pixabay.com/photo/2013/11/28/10/03/autumn-219972_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/17/19/08/away-3024773_960_720.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Wallpapers",
          style: TextStyle(color: Color.fromARGB(255, 78, 145, 103)),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => accPage()));
            },
            icon: Icon(Icons.account_box),
            iconSize: 32,
            color: Color.fromARGB(255, 78, 145, 103),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0x665ac18e),
              Color(0x995ac18e),
              Color(0xcc5ac18e),
              Color(0xff5ac18e)
            ])),
        child: ListView.builder(
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                elevation: 20,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Image.network(a[index]),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 40,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: a.length,
        ),
      ),
    );
  }
}
