import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turfadmin/components/constants.dart';

class AddTeam extends StatefulWidget {
  const AddTeam({Key key}) : super(key: key);

  @override
  _AddTeamState createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  TextEditingController namecontroller;

  var isload = false;

  var _picker = ImagePicker();
  bool stock;

  XFile _image;

  String _uploadedFileURL;

  final dir = Directory.systemTemp;
  final targetPath = Directory.systemTemp.absolute.path + "/temp.webp";

  Future chooseFile() async {
    await _picker.pickImage(source: ImageSource.gallery,imageQuality: 55).then((image) {
      setState(() {
        _image = image;
      });
    });}



  Future uploadFile() async {
    // setState(() {
    //   isload = true;
    // });
    chooseFile().then((value) {
      // var storageReference = FirebaseStorage.instance
      //     .ref()
      //     .child('Product/ ${_image.path.split("/").last}');
      // UploadTask uploadTask = storageReference.putFile(File(_image.path));
      // uploadTask.then((value) {
      //   print('File Uploaded');
      //   storageReference.getDownloadURL().then((fileURL) {
      //
      //     setState(() {
      //       isload = false;
      //       _uploadedFileURL = fileURL;
      //
      //     });
      //   });
      // });



    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                buildTextField(namecontroller, "Name Of Team"),
                SizedBox(height: 10,),
                Text("ADD LOGO OF TEAM"),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    uploadFile();
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        _uploadedFileURL == null ? Container(child: Icon(FontAwesomeIcons.image,size: 70,),width: 100,height: 100,decoration: BoxDecoration(border: Border.all(color: Colors.blue)),) :    Image.network(_uploadedFileURL,width: 100,height: 100,),
                        isload ? CircularProgressIndicator(

                        ): Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(
                                FontAwesomeIcons.edit
                            )

                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
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
