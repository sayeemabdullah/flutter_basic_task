import 'package:flutter/material.dart';
import 'package:flutter_basic_task/ProductPage.dart';

//Email : abcd@theantopolis.com
//Password: 12345678

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Ant Store',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mail = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String getmail , getpass;

    void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("ERROR!!"),
          content: new Text("Please enter correct email / password."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Okay!"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showValid() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("ERROR!!"),
          content: new Text("The email is not valid."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Okay!"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 120,),
                Image.asset('assets/logo_trans.png'),
                SizedBox(height: 5,),
              ],
            ),
            SizedBox(height: 60.0,),
            TextField(
              controller: mail,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(fontSize: 20),
                filled: true,
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 20),
                filled: true,
              ),
            ),
            SizedBox(height: 50.0,),
            Column(
              children: <Widget>[
                ButtonTheme(
                  height: 50,
                  disabledColor: Colors.redAccent,
                  child: RaisedButton(
                    disabledElevation: 4.0,
                    color: Colors.red,
                    onPressed: (){
                      getmail = mail.text;
                      getpass = pass.text;
                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(getmail);
                      if(emailValid==false){
                        _showValid();
                      }
                      //print(getpass);
                      else if(getmail=="abcd@theantopolis.com" && getpass=="12345678"){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ProductPage();
                      }));
                      }
                      else{
                        _showDialog();
                      }
                    },
                    child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}