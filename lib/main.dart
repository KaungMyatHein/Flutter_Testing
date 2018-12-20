import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: new RandomWords()
      ),
    );
  }
}
class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0); 
  @override                               
  Widget build(BuildContext context) {
    return _buildSuggestions();
  } 
  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return new Divider();
        }
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }        
}
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

