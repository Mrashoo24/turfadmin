import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:turfadmin/components/constants.dart';

class AddMatch extends StatefulWidget {
  const AddMatch({Key key}) : super(key: key);

  @override
  _AddMatchState createState() => _AddMatchState();
}

class _AddMatchState extends State<AddMatch> {
  TextEditingController namecontroller;
  TextEditingController opentiming;
  var isload = false;
  List<dynamic> selectedcuisine = [];
  List<dynamic> cuisine = ["FOOTBALL","BASKETBALL"];
  var userDOB = DateTime.now();

  Future<Widget> timePicker(context) async {
    var openingHour = DateTime.now().hour;
    var openingMinute= DateTime.now().minute;


    var selectedTime = TimeOfDay(hour: openingHour, minute: openingMinute);
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)

      setState(() {
        print(picked.minute);
        selectedTime = picked;
        var time = selectedTime.minute.toString().split(":").last == "0" ?
        "${selectedTime.hour}:${selectedTime.minute}0" : "${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.toString().split(".").last}" ;

        opentiming.text = time ;
        print(time);

      });
  }

  _selectstartDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: userDOB, // Refer step 1
      firstDate: DateTime(1960),
      lastDate: DateTime(2050),
    );
    if (picked != null){
      setState(() {
        userDOB = picked;
      });
    }

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                buildTextField(namecontroller, "Name Of Match"),
                SizedBox(height: 10,),
                buildDropdownCard("Select Venue"),
                SizedBox(height: 20,),
                buildDropdownCard("Select Team 1"),
                SizedBox(height: 10,),
                buildDropdownCard("Select Team 2"),
                SizedBox(height: 10,),
                InkWell(
                    onTap: (){
                      timePicker(context);
                    },

                    child:Card(
                      elevation: 0,
                      child: Container(
                        margin: EdgeInsets.only(left: 80, right: 80),
                        child: TextField(
                          enabled: false,
                          controller: opentiming,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText:  opentiming == null ? "SELECT TIMING" :opentiming.value.text,
                            labelStyle: GoogleFonts.basic(color: Colors.black,fontWeight: FontWeight.bold),
                            labelText: opentiming == null ? "SELECT TIMING" :opentiming.value.text,
                            hintStyle: TextStyle(color: Colors.black12),
                          ),
                        ),
                      ),
                    )
                ),

                InkWell(
                  onTap: (){
                    _selectstartDate(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                            userDOB.toLocal().toString().split(' ')[0]),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)),
                    ),
                  ),
                ),

                Padding (
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.height,
                    child: ElevatedButton(onPressed: (){

                    }, child: Text("Submit"),style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kgreen.withOpacity(0.5))
                    ),),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  Card buildDropdownCard(String text) {
    return Card(
                elevation: 0,
                child: Container(
                  margin: EdgeInsets.only(left: 80, right: 80),
                  child: Column(
                    children: [
                      Text(text,style: GoogleFonts.basic(color: Colors.black,fontWeight: FontWeight.bold)),
                      MultiSelectDialogField(
                        items: cuisine.map((e) => MultiSelectItem(e, e)).toList(),
                        listType: MultiSelectListType.CHIP,
                        initialValue: selectedcuisine,
                        onConfirm: (values) {
                          selectedcuisine = values;
                          print("cuisine $cuisine");
                        },
                      ),
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
