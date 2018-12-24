import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        actions: <Widget>[ 
        new IconButton( icon: new Icon(Icons.settings,color: Colors.white), tooltip: 'Search', onPressed: () {
          return showDialog(
                     context: context,
                     builder: (context)
                     {
                       return AlertDialog(
                         content: Text("စက်တင်"),
                       );
                     }
                   );
        },),
        ], 
      ),
      body: Container(
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
                  splashColor: Colors.orange,
                  onPressed: () {
                   if(usernameController.text == "batman" && passwordController.text == "gothmn")
                   {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                   }
                   else return showDialog(
                     context: context,
                     builder: (context)
                     {
                       return AlertDialog(
                         content: Text("၀င်ရောက်ခြင်း အဆင်မပြေပါ။ \nကြိုးစား ကြည့်ပါဦး။"),
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
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("PTH Lab"),
              currentAccountPicture: new Icon(Icons.supervised_user_circle,color: Colors.white), accountEmail: null,
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Videos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Welcome from PTH LAB"),
        actions: <Widget>[ 
        new IconButton( icon: new Icon(Icons.settings,color: Colors.white), tooltip: 'Search', onPressed: () {
          return showDialog(
                     context: context,
                     builder: (context)
                     {
                       return AlertDialog(
                         content: Text("စက်တင်"),
                       );
                     }
                   );
        },),
        ], 
      ),
      body: Container(
        child: new RandomWords()
      ),
    );
  }
}
class RandomWordsState extends State<RandomWords> {
  @override                               
  Widget build(BuildContext context) {
    return _buildSuggestions();
  } 
  Widget _buildSuggestions() {
    /*return new Row(
      children: <Widget>[
        
      ],
  );*/
  return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: new CarouselSlider(
                items: [1,2,3,4,5].map((i) {
                  return new Builder(
                    builder: (BuildContext context) {
                    return new Container(
                      width: MediaQuery.of(context).size.width,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: new BoxDecoration(
                        color: Colors.teal
                      ),
                      child: new Center(
                        child: Text('text $i', style: new TextStyle(fontSize: 16.0,color: Colors.white),),
                      )
                    );
                  },
                );
              }).toList(),
              height: 400.0,
              autoPlay: true
              )
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: new Text('text')
            ),
          ],
        ),
      );
  }
    
}
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

