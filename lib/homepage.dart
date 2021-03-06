
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:turfadmin/components/constants.dart';
import 'package:turfadmin/location/location.dart';
import 'package:turfadmin/orders/allorders.dart';
import 'package:turfadmin/sports/allsports.dart';
import 'package:turfadmin/tournament/tournament.dart';
import 'package:turfadmin/venue/venuepage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,  this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        elevation: 0,
        backgroundColor: kbg,
        title: Text("Admin",style: TextStyle(color: kblackcolor),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){

            }, child: Text("LOG OUT"),style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kgreen.withOpacity(0.5))
            ),),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Activity Overview"),
            Center(
              child: Wrap(
                children: [
                  buildCatCard("Location",FontAwesomeIcons.locationArrow,()=>Get.to(LocatioPage())),
                  buildCatCard("Sport",FontAwesomeIcons.mobile,()=>Get.to(AllSports())),
                  buildCatCard("Venue",FontAwesomeIcons.handPaper,()=>Get.to(VenuePage())),
                  buildCatCard("Order",FontAwesomeIcons.home,()=>Get.to(AllOrders())),
                  buildCatCard("Tournament",FontAwesomeIcons.home,()=>Get.to(TournamentPage())),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  Widget buildCatCard(String text,IconData location,Function press) {
    return InkWell(
      onTap: press,
      child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Container(
                      child: Column(
                        children: [
                        Icon(location),
                          Text(text),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}