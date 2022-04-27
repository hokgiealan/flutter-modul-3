import 'package:flutter/material.dart';
import 'package:modul_3/mainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dummy_data.dart';
import 'accountPage.dart';
import 'mPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isHidden = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameInput = new TextEditingController();
  TextEditingController passwordInput = new TextEditingController();
  final List<Map<String, dynamic>> dummydata = DummyData.data;

  void prosesLogin() async {
    final prefs = await SharedPreferences.getInstance();
    int? currentid = prefs.getInt('id');
    for (var i = 0; i < dummydata.length; i++) {
      if (currentid != null && currentid == dummydata[i]['id']) {
        prefs.setString('nama', dummydata[i]['nama']);
        prefs.setString('nim', dummydata[i]['Nim']);
        Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => accPage()));
      }
    }

    void initState() {
      super.initState();
      prosesLogin();
    }
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
                Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: usernameInput,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "isikan password !";
                            }
                            return null;
                          },
                          controller: passwordInput,
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                              suffix: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  _isHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                            color: Colors.blue[400],
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              for (var i = 0; i < dummydata.length; i++) {
                                if (usernameInput.text ==
                                        dummydata[i]['username'] &&
                                    passwordInput.text ==
                                        dummydata[i]['password']) {
                                  prefs.setInt('id', dummydata[i]['id']);
                                  prefs.setString('nama', dummydata[i]['nama']);
                                  prefs.setString('nim', dummydata[i]['Nim']);
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => mPage()));
                                }
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ))
              ],
            )));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
