import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> {

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  String _welcomeString = "";

  void _erase(){
    setState(() {
        _nameController.clear();
        _passController.clear();
    });
  }
  void _showWelcome(){
    setState(() {
      if (_nameController.text.isNotEmpty && _passController.text.isNotEmpty){
           _welcomeString = "Welcome, ${_nameController.text}";
      } else if(_nameController.text.isEmpty) {
        _welcomeString = "Enter a valid username";
      } else {
        _welcomeString = "Enter a valid password";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'assets/images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.greenAccent,
            ),
            new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _nameController,
                    decoration: new InputDecoration(
                      hintText: 'UserName',
                      icon: new Icon(Icons.person)
                    ),
                  ),
                  new TextField(
                    controller: _passController,
                    decoration: new InputDecoration(
                        hintText: 'Password',
                        icon: new Icon(Icons.lock)
                    ),
                    obscureText: true,
                  ),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Padding(
                          padding: const EdgeInsets.fromLTRB(40.0,30.0,45.0,20.0),
                          child: new RaisedButton(onPressed:_showWelcome,
                          color: Colors.red,
                        child: new Text("Login"),
                        textColor: Colors.white,
                            elevation: 0.5,
                        ),
                        ),
                      ),
                      new Expanded(
                        child: new Padding(
                          padding: const EdgeInsets.fromLTRB(40.0,30.0,45.0,20.0),
                          child: new RaisedButton(onPressed: _erase,
                            color: Colors.red,
                            child: new Text('Clear'),
                            textColor: Colors.white,
                            elevation: 0.5,
                        ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.all(18.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(_welcomeString,
                style: TextStyle(color: Colors.white,
                fontSize: 19.4,
                fontWeight: FontWeight.w500
                ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}