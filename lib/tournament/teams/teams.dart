import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turfadmin/components/constants.dart';
import 'package:turfadmin/tournament/teams/addteam.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({Key key}) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
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
                  Get.to(AddTeam());
                }, child: Text("ADD TEAM"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kblackcolor)
                ),),
              ),
              Text("TEAM LIST",style: TextStyle(letterSpacing: 2),),
              Center(
                child: buildSportCard("JK TURF","1"),
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
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return AlertDialog(
                              title: Text("Add Team",style: TextStyle(fontWeight: FontWeight.w700),),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("ADD NOW"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          kgreen)),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("CANCEL"))
                              ],
                              content: Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      color: kbg,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView(
                                        children: [

                                          buildTextField(nameController, "NAME OF VENUE"),
                                          buildTextField(locationController, "LOCATION"),
                                          buildTextField(sportController, "SPORTS"),
                                          buildTextField(priceController, "PRICE"),
                                        ])
                                ),
                              ),
                            );
                          },
                        );
                      });
                }, child: Text("Edit"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kblue.withOpacity(0.5))
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
