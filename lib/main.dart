import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PTH LAB',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'PTH LAB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "Username",
                ),
                autofocus: true,
              )
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: new SizedBox(
                width: double.infinity,
                child: new RaisedButton(
                  textColor: Colors.white,
                  child: const Text('Login'),
                  color: Theme.of(context).accentColor,
                  elevation: 4.0,
                  splashColor: Colors.green,
                  onPressed: () {
                   if(usernameController.text == "batman" && passwordController.text == "gothmn")
                   {
                     return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Success"),
                        );
                      },
                    );
                   }
                   else return showDialog(
                     context: context,
                     builder: (context)
                     {
                       return AlertDialog(
                         content: Text("Fail"),
                       );
                     }
                   );
                  },
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
