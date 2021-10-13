import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turfadmin/components/constants.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({Key key}) : super(key: key);

  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  TextEditingController nameController ;
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

              Text("ALL ORDERS ",style: TextStyle(letterSpacing: 2),),

              Center(
                child: buildSportCard("JK TURF","12/09/2021","Arsalan","10:00 Am","Paid"),
              ),
              Center(
                child: buildSportCard("JK TURF","12/09/2021","Arsalan","10:00 Am","Paid"),
              ),
            ],
          ),
        )
    );
  }

  Card buildSportCard(String venue,String user,String date,String slot,String pay ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildRow("Venue:", venue) ,
            buildRow("User:", user) ,
            buildRow("Date:", date) ,
            buildRow("Slot:", slot) ,
            buildRow("Pay:", pay) ,
          ],
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
