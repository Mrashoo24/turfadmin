import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turfadmin/components/constants.dart';
import 'package:turfadmin/tournament/addTournament.dart';
import 'package:turfadmin/tournament/matches/matches.dart';
import 'package:turfadmin/venue/timeslot.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({Key key}) : super(key: key);

  @override
  _TournamentPageState createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  TextEditingController nameController ;
  TextEditingController teamsController;
  TextEditingController matchesController;
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
                        Get.to(AddTournament());
                }, child: Text("ADD TOURNAMENT"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kblackcolor)
                ),),
              ),
              Text("TOURNAMENT LIST",style: TextStyle(letterSpacing: 2),),
              Center(
                child: buildSportCard("IPL","1"),
              )
            ],
          ),
        )
    );
  }


  Card buildSportCard(String title,String index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Center(child: Text(index)),
            Center(child: Text(title,style: TextStyle(letterSpacing: 3,fontSize: 18),)),
            Container(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){

                }, child: Text("Team"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kblue.withOpacity(0.5))
                ),),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){
                  Get.to(MatchePage());
                }, child: Text("Matches"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kblackcolor.withOpacity(0.5))
                ),),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){}, child: Text("Delete"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kredcolor.withOpacity(0.5))
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
}
