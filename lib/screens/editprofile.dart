import 'dart:io';

import 'package:first_app/components/textfields.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class editprofile extends StatefulWidget {
  editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  File? _selectedImage;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _selectedImage = File(pickedImage.path);
      } else {
        print("NO Picked Image");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _updateemail = TextEditingController();
    TextEditingController _updatephone = TextEditingController();
    TextEditingController _updateadress = TextEditingController();
    TextEditingController _updatepass = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onSurface),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "EDIT PROFILE".toUpperCase(),
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
            child: Column(
              children: [
                Stack(children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                child: _selectedImage == null
                                    ? Container(
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          // borderRadius:
                                          //     BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/avatar1.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Image.file(_selectedImage!)));
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: _selectedImage == null
                              ? Container(
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(20)Talhassan,
                                    image: DecorationImage(
                                      image: AssetImage('images/avatar1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Image.file(
                                  _selectedImage!,
                                  fit: BoxFit.fill,
                                )),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        getImage();
                        // Future _pickImageFromGallery() async {
                        //   final returnedImage = await ImagePicker()
                        //       .pickImage(source: ImageSource.gallery);
                        //   setState(() {
                        //     _selectedImage = File(returnedImage!.path);
                        //   });
                        // }

                        // print("object");
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).primaryColor),
                        child: Icon(
                          Icons.camera_enhance_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 0.15,
                  color: Colors.grey[400],
                ),
                MyTextField(
                    hintName: "Update Email",
                    controller: _updateemail,
                    obsecuretext: false),
                MyTextField(
                    hintName: "Update Phone Number",
                    controller: _updatephone,
                    obsecuretext: false),
                MyTextField(
                    hintName: "Update Adress",
                    controller: _updateadress,
                    obsecuretext: false),
                MyTextField(
                    hintName: "Update Pass",
                    controller: _updatepass,
                    obsecuretext: false),
                SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //     width: 150,
                //     child: MyButton(
                //       text: 'Update Credentials',
                //       onpress: () {
                //         Navigator.pushNamed(context, RouteName.edituserprofile);
                //       },
                //     ))
                MYBUTTON2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MYBUTTON2 extends StatelessWidget {
  const MYBUTTON2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return GestureDetector(
      onTap: () {
        Toast.show("Updated Successfully !\n Restart to see updated one");
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 65),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 130, 128, 128),
              offset: Offset(0.0, 9.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text("Update Credentials",
              style: GoogleFonts.roboto(
                  // ignore: deprecated_member_use
                  textStyle: Theme.of(context).textTheme.labelLarge)),
        ),
      ),
    );
  }
}
