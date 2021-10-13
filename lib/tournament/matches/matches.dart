import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turfadmin/components/constants.dart';
import 'package:turfadmin/tournament/matches/addMatch.dart';

class MatchePage extends StatefulWidget {
  const MatchePage({Key key}) : super(key: key);

  @override
  _MatchePageState createState() => _MatchePageState();
}

class _MatchePageState extends State<MatchePage> {
  TextEditingController nameController ;
  TextEditingController locationController;
  TextEditingController sportController;
  TextEditingController priceController;
  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                    Get.to(AddMatch());
                }, child: Text("ADD Match"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kblackcolor)
                ),),
              ),
              Text("VENUE LIST",style: TextStyle(letterSpacing: 2),),
              Center(
                child: buildSportCard("MATCH 1","MUMBAI","0","CHENNAI","0","JK TURF","YET TO PLAY"),
              )
            ],
          ),
        )
    );
  }


  Card buildSportCard(String matchNumber,String team1,String steam1,team2,steam2,venue,won) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(matchNumber)) ,
            buildRow("Team 1:", team1) ,
            buildRow("Score of Team 1:", steam1),
            buildRow("Team 2:", team2) ,
            buildRow("Score of Team 2:", steam2),
            buildRow("Venue:", venue) ,
            buildRow("Won:", won) ,
            Container(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){}, child: Text("Delete"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kredcolor.withOpacity(0.5))
                ),),
                ElevatedButton(onPressed: (){

                }, child: Text("Update Scores"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kgreen.withOpacity(0.5))
                ),),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    return Material(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)), color: kbg),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: kblue, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.solid,
                ),
              ),
              label: Text(
                label,
                style: TextStyle(color: kblue),
              ),
              hintStyle: TextStyle(color: kblue.withOpacity(0.5)),
              hintText: label,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              fillColor: kblue,
              labelStyle: TextStyle(color: kblue),
              floatingLabelStyle: TextStyle(color: kblue),
            ),
            style:
            TextStyle(color: kblackcolor, decoration: TextDecoration.none),
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {
              print(value);
            },
          ),
        ),
      ),
    );
  }

  Widget buildRow(String index, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(index),
          Text(title),
        ],
      ),
    );
  }
}
