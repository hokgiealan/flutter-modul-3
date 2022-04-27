import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dummy_data.dart';
import 'main.dart';

class accPage extends StatefulWidget {
  @override
  _accPage createState() => _accPage();
}

String? nama;
String? nim;

class _accPage extends State<accPage> {
  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('nama');
      nim = prefs.getString('nim');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(children: [
                    Text('Hello !!'),
                    Text(nama ?? '$nama'),
                    Text(nim ?? '$nim'),
                    Text('Nice to meet you !'),
                  ]),
                ),
                FlatButton(
                    color: Color.fromARGB(255, 58, 113, 43),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.remove('id');
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => LoginForm()));
                    },
                    child: Text(
                      'Log out',
                      style: TextStyle(color: Colors.white),
                    )),
                FlatButton(
                    color: Color.fromARGB(255, 58, 113, 43),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )));
  }
}
