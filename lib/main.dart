import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My profile',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        initialData: false,
        stream: slimyCard.stream, //Stream of SlimyCard
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return SingleChildScrollView(
            child: Column(
              // padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                SlimyCard(
                  topCardWidget: topCardWidget('assets/images/my_pic.jpg',
                      (snapshot.data) ? 'Tap to see less' : 'Tap to see more'),
                  bottomCardWidget: bottomCardWidget(),
                  color: Colors.blue[800],
                  bottomCardHeight: MediaQuery.of(context).size.height * .5,
                  slimeEnabled: true,
                ),
                // SizedBox(height: 50),
                // SlimyCard(
                //   width: 200,
                //   topCardWidget: topCardWidget(
                //       (snapshot.data)
                //           ? 'assets/images/my_pic.jpg'
                //           : 'assets/images/my_pic2.jpg',
                //       (snapshot.data) ? 'Tap to see less' : 'Tap to see more'),
                //   bottomCardWidget: bottomCardWidget(),
                //   color: Colors.blue,
                //   bottomCardHeight: 250,
                //   slimeEnabled: true,
                // ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget(String imagePath, String buttonText) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .089,
            width: MediaQuery.of(context).size.width * .18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage(imagePath)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .015,
          ),
          Text(
            'Mahmoud Samy',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .005,
          ),
          Text(
            'Flutter developer',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Text(
            buttonText,
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
        ],
      ),
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.mail_solid,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .04,
                ),
                Text(
                  'msamy13579@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  //  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.phone,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .04,
                ),
                GestureDetector(
                  onTap: () async {
                    launch('tel://+201125488886');
                  },
                  child: Text(
                    '01125488886',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    //  textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.location,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .04,
                ),
                Text(
                  'Villa 471, El-Shorouk, Cairo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  //  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.calendar_today,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .04,
                ),
                Text(
                  '12/08/1998 (23 years)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  //  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Center(
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width * .7,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Text(
            'Projects',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    //color: Colors.lightBlue,

                    width: MediaQuery.of(context).size.width * .6,

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mini Market',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SingleChildScrollView(
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                  Text(
                                    'It\'s an e-commerce App, connected with an API, So you can add any new products, offers, banners and so on\nEvery customer able to create an account and enjoy the shopping',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 15,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .005,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Some of Application features: ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          'Responsive & Modern UI, Reliable, Easy to use, Dark/Light Mode',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ]))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    //color: Colors.lightBlue,

                    width: MediaQuery.of(context).size.width * .6,

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daily news',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SingleChildScrollView(
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                  Text(
                                    'Daily news App update itself daily, connected with a news API, has 3 categories business, sports, science\nUsers have the ability to search about any news',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 15,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .005,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Some of Application features: ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          'Responsive UI, Reliable, Easy to use, Dark/Light Mode',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ]))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    //color: Colors.lightBlue,

                    width: MediaQuery.of(context).size.width * .6,

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Loan Calculator',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SingleChildScrollView(
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                  Text(
                                    'It\'s an one-screen Application, lite application for calculating your loans',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 15,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .005,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Some of Application features: ',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text:
                                              'Responsive & Modern UI, Reliable, Easy to use with great user experince',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    //color: Colors.lightBlue,

                    width: MediaQuery.of(context).size.width * .6,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To-Do List',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                  Text(
                                    'It\'s an e-commerce App, connected with Database using sqflite, user have the ability to add tasks and pick time and date for this task\nuser also can delete or archive any task\nWhen he does his task, He can click on done to change the status of the task to "Done Task"',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 15,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .005,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Some of Application features: ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: 'Responsive, Reliable, Easy to use',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ]))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Center(
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width * .7,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Text(
            'Skills',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  //direction: Axis.vertical,
                  runSpacing: 0.0,
                  spacing: 4.0,
                  children: [
                    Chip(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      label: Text(
                        'Ability to learn new technologies',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      label: Text(
                        'Clean code & Responsive UI',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      label: Text(
                        'Database',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      label: Text(
                        'SOLID principles',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      label: Text(
                        'Dealing with APIs using Dio',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      label: Text(
                        'Dealing with Firebase',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      label: Text(
                        'State managment using BLOC',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      label: Text(
                        'Familirity with Shared Preference',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      label: Text(
                        'Using custom packages',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Center(
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width * .7,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Text(
            'Contact',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.github,
                  //color: Colors.white,
                  size: 18,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .04,
                ),
                Link(
                  uri: Uri.parse('https://github.com/ekramy74'),
                  target: LinkTarget.blank,
                  builder: (context, followLink) {
                    return GestureDetector(
                      onTap: followLink,
                      child: Text(
                        'ekramy74',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.linkedinIn,
                  //color: Colors.black,
                  size: 18,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .04,
                ),
                Link(
                  uri: Uri.parse(
                      'https://www.linkedin.com/in/mahmoud-samy-9a97a4216/'),
                  target: LinkTarget.blank,
                  builder: (context, followLink) {
                    return GestureDetector(
                      onTap: followLink,
                      child: Text(
                        'Mahmoud Samy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.facebook,
                  // color: Colors.white,
                  size: 18,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .04,
                ),
                Link(
                  uri: Uri.parse('https://www.facebook.com/mahmouddsamyy'),
                  target: LinkTarget.blank,
                  builder: (context, followLink) {
                    return GestureDetector(
                      onTap: followLink,
                      child: Text(
                        'Mahmoud Samy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.instagram,
                  // color: Colors.white,
                  size: 18,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .04,
                ),
                Link(
                  uri: Uri.parse('https://www.instagram.com/itsekramyy/'),
                  target: LinkTarget.blank,
                  builder: (context, followLink) {
                    return GestureDetector(
                      onTap: followLink,
                      child: Text(
                        'itsekramyy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
