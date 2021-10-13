import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfadmin/components/constants.dart';
import 'package:turfadmin/venue/venuepage.dart';

class TimeSlots extends StatefulWidget {
  const TimeSlots({Key key}) : super(key: key);

  @override
  _TimeSlotsState createState() => _TimeSlotsState();
}

class _TimeSlotsState extends State<TimeSlots> {
  TextEditingController nameController ;
  TextEditingController timingController = TextEditingController();

   List slots = [];


  Future<Widget> timePicker(context) async {
    var openingHour = DateTime.now().hour;
    var openingMinute= DateTime.now().minute;
    // var openingHour = timingController.value.text.toString().split(":").first;
    // var openingMinute= timingController.value.text.toString().split(":").last;


    var selectedTime = TimeOfDay(hour: openingHour, minute: openingMinute);
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {

      setState(() {
        print(picked.minute);
        selectedTime = picked;
       var time = selectedTime.minute.toString().split(":").last == "0" ?
        "${selectedTime.hour}:${selectedTime.minute}0" : "${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.toString().split(".").last}" ;

        timingController.text = time ;
        print(time);
        slots.add(time);
      });

    }
  }

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
                        controller: timingController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Select Open Timing",
                          labelStyle: GoogleFonts.basic(color: Colors.black,fontWeight: FontWeight.bold),
                          labelText: "Select Open Timing",
                          hintStyle: TextStyle(color: Colors.black12),
                        ),
                      ),
                    ),
                  )
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  timePicker(context);
                }, child: Text("ADD TIME"),style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kblackcolor)
                ),),
              ),
              Text("CURRENT TIME SLOT",style: TextStyle(letterSpacing: 2),),

              ListView.builder(
                itemCount: slots.length,
                shrinkWrap: true,
                itemBuilder : (context,index){
               return   Center(
                    child: buildSportCard(slots[index],"1"),
                  );
                }
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(index),
            Text(title),
            Container(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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

  Widget buildDisabledTextField(TextEditingController controller, String label) {
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
              enabled: false,
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
