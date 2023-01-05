import 'package:flutter/material.dart';
import 'package:talan_mobile_interface/form_components/delayed_animation.dart';
import 'AddPatientPage.dart';
import 'InfoPage.dart';
import 'HomePage.dart';

class ResultatPage extends StatelessWidget{
const ResultatPage({Key? key}) : super(key:key);
@override
Widget build(BuildContext context) =>
    Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(

        title: const Center(
          child: Text("Resultats Capture"),

        ),

        ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 20),
            Center(
                child: Container(
                  width: 350,
                  height: 350,
                  color: Colors.grey,
                )
            ),

            SizedBox(height: 150),
            DelayedAnimation(
              delay: 500,

              child:Container(

                margin: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 40,
                ),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed:() {} ,
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.green

                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed:(){},
                              style:ElevatedButton.styleFrom(shape: StadiumBorder()) ,
                              icon: Icon(
                                Icons.thumb_up,
                                color: Colors.white70,
                              ),
                            ),
                            const Center(child: Text("Validation"))
                          ],
                        )
                    ),
                    ElevatedButton(
                        onPressed:() {} ,
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.red
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed:(){
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.thumb_down,
                                color: Colors.white70,
                              ),
                            ),
                            const Center(child: Text("Decline"))
                          ],
                        )
                    )
                  ],
                ),
              ),

            ),
          ],
        ),
      ),

    );

Widget content(){
  return Center(
    child: Container(
      width: 350,
      height: 350,
      color: Colors.grey,
    ),




    //*For AUTO Flash:*
    //       ElevatedButton(
    //       onPressed: () {
    //       _cameraController.setFlashMode(FlashMode.auto);
    //       },
    //     style: ElevatedButton.styleFrom(primary: Colors.transparent),
    //     child: Text(
    //     "Auto Flash",
    //     style: TextStyle(
    //     color: Colors.white, backgroundColor: Colors.transparent),
    //     ),
    // )
  );
}
}

