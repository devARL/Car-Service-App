import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Aqmar Motors',
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: 'Aqmar Motors'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _select(Choice choice) {
    if (choice.title == "View Vehicle Details") {
      t  = "Details";
      print("vehicle details");
      Navigator.push(context, VehicleDetails());
    }
    if (choice.title == "Settings") {
      t  = "Application Settings";
      print("settings");
      Navigator.push(context, Settings());
    }
    if (choice.title == "Import/Export Center") {
      t  = "Import/Export Center";
      print("import/export center");
      Navigator.push(context, IECenter());
    }
    if (choice.title == "Contact Support..") {
      t = "Contact Support";
      print("contact support");
      Navigator.push(context, ContactSupport());
    }
    if (choice.title == "About") {
      t = "About Aqmar Motors";
      print("about");
      Navigator.push(context, About());
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: false,
        //leading: new IconButton(icon: const Icon(Icons.line_weight), onPressed: () {}),
        actions: <Widget>[
          //new IconButton(icon: const Icon(Icons.), onPressed: () {}),
          new PopupMenuButton<Choice>(
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  //child: Text(choice.title),
                  //child: new IconButton(icon: Icon(choice.icon), onPressed: null),
                  child: Row(
                    children: <Widget>[
                      new IconButton(icon: Icon(choice.icon), onPressed: () {}, color: choice.color,),
                      Text(choice.title),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: _select,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class VehicleDetails extends MaterialPageRoute<Null> {
  VehicleDetails() : super(builder: (BuildContext cntx) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(t),
        centerTitle: true,
      ),
    );
  });
}

class About extends MaterialPageRoute<Null> {
  About() : super(builder: (BuildContext cntx) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(t),
        centerTitle: true,
        actions: <Widget>[
          //new IconButton(icon: const Icon(Icons.), onPressed: () {}),
          new PopupMenuButton<Choice>(
            itemBuilder: (BuildContext context) {
              return aboutChoices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  //child: Text(choice.title),
                  //child: new IconButton(icon: Icon(choice.icon), onPressed: null),
                  child: Row(
                    children: <Widget>[
                      new IconButton(icon: Icon(choice.icon), onPressed: () {}, color: choice.color,),
                      Text(choice.title),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: _selectAboutChoice,
          ),
        ],
      ),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
                flex: 1,
                child: new SingleChildScrollView(
                  child: new Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                    style: new TextStyle(color: Colors.black,fontSize: 20.0),
                  ),

                )

            ),
          ],
        ),
      ),
    );
  });

  static Future<Null> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url,forceSafariVC: false,forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<Null>  _launched;

  static void _selectAboutChoice(Choice choice) {
    if (choice.title == "Visit Facebook Page") {
      _launched = _launchInBrowser('https://q-sols.com');
    }
    if (choice.title == "Visit Twitter Page") {
      _launched = _launchInBrowser('https://q-sols.com');
    }
    if (choice.title == "Visit Google+ Page") {
      _launched = _launchInBrowser('https://q-sols.com');
    }
    if (choice.title == "Visit Website") {
      _launched = _launchInBrowser('https://q-sols.com');
    }
  }

}

class Settings extends MaterialPageRoute<Null> {
  Settings() : super(builder: (BuildContext cntx) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(t),
        centerTitle: true,
      ),
    );
  });
}

class IECenter extends MaterialPageRoute<Null> {
  IECenter() : super(builder: (BuildContext cntx) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(t),
        centerTitle: true,
      ),
    );
  });
}

class ContactSupport extends MaterialPageRoute<Null> {
  ContactSupport() : super(builder: (BuildContext cntx) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(t),
        centerTitle: true,
      ),
    );
  });
}

class Choice {
  const Choice({this.title, this.icon, this.color});

  final String title;
  final IconData icon;
  final Color color;
}

String t = "";

const List<Choice> choices = const <Choice>[
  const Choice(title: 'View Vehicle Details', icon: Icons.directions_car, color: Colors.purpleAccent),
  const Choice(title: 'Settings', icon: Icons.settings, color: Colors.grey),
  const Choice(title: 'Import/Export Center', icon: Icons.import_export, color: Colors.amber),
  const Choice(title: 'Contact Support..', icon: Icons.face, color: Colors.brown),
  const Choice(title: 'About', icon: Icons.sms_failed, color: Colors.purple),

  //const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  //const Choice(title: 'Boat', icon: Icons.directions_boat),
  // const Choice(title: 'Bus', icon: Icons.directions_bus),
  //const Choice(title: 'Train', icon: Icons.directions_railway),
  // const Choice(title: 'Walk', icon: Icons.directions_walk),
];

const List<Choice> aboutChoices = const <Choice>[
  const Choice(title: "Visit Facebook Page", icon: Icons.public, color: Colors.blue),
  const Choice(title: "Visit Twitter Page", icon: Icons.public, color: Colors.lightBlue),
  const Choice(title: "Visit Google+ Page", icon: Icons.public, color: Colors.red),
  const Choice(title: "Visit Website", icon: Icons.public, color: Colors.blueAccent),

];
