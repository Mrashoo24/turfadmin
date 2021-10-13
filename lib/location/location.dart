import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:turfadmin/components/constants.dart';

class LocatioPage extends StatefulWidget {
  const LocatioPage({Key key}) : super(key: key);

  @override
  _LocatioPageState createState() => _LocatioPageState();
}

class _LocatioPageState extends State<LocatioPage> {
  TextEditingController nameController ;
  String name ;
  @override
  Widget build(BuildContext context) {
    var fire= FirebaseFirestore.instance;

   var locStream = fire.collection("locations").snapshots();

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
        body: StreamBuilder<QuerySnapshot>(
          stream: locStream,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              Center(
                child: CircularProgressIndicator(),
              );
            }

            var locData = snapshot.requireData;


            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return AlertDialog(
                                  title: Text("Add Location",style: TextStyle(fontWeight: FontWeight.w700),),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (name != null) {
                                          fire.collection("locations").doc((locData.size + 1).toString()).set({
                                            "id": (locData.size + 1).toString(),
                                            "location": name
                                          }).then((value) {
                                            Fluttertoast.showToast(msg: "Added");
                                            Get.back();
                                          });
                                        }else{
                                          Fluttertoast.showToast(msg: "ADD NAME");
                                        }
                                      },
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
                                              buildTextField(nameController, "NAME OF LOCATION"),


                                            ])
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                    }, child: Text("ADD LOCATION"),style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kblackcolor)
                    ),),
                  ),
                  Text("LOCATION LIST",style: TextStyle(letterSpacing: 2),),

                  Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: locData.docs.length,
                      itemBuilder: (context, index) {
                        return buildSportCard(locData.docs[index].get("location"),locData.docs[index].get("id"));
                      }
                    ),
                  )
                ],
              ),
            );
          }
        )
    );
  }


  Card buildSportCard(String title,String index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(index),
            Text(title),
            Container(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  nameController = TextEditingController(text: title);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return AlertDialog(
                              title: Text("Edit Location",style: TextStyle(fontWeight: FontWeight.w700),),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (name != null) {
                                      FirebaseFirestore.instance.collection("locations").doc((index).toString()).update({
                                        "id": index,
                                        "location": name
                                      }).then((value) {
                                        Fluttertoast.showToast(msg: "Added");
                                        Get.back();
                                      });
                                    }else{
                                      Fluttertoast.showToast(msg: "ADD NAME");
                                    }
                                  },
                                  child: Text("Save"),
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
                                          buildTextField(nameController, "NAME OF LOCATION"),


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
                ElevatedButton(onPressed: (){
                  FirebaseFirestore.instance.collection("locations").doc(index).delete();
                }, child: Text("Delete"),style: ButtonStyle(
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
              setState(() {
                 name = value;
              });
            },
          ),
        ),
      ),
    );
  }



}
