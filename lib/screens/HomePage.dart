import 'package:flutter/material.dart';
import 'package:talan_mobile_interface/screens/AddPatientPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talan_mobile_interface/screens/CameraPage.dart';
import 'CapturePage.dart';
import 'InfoPage.dart';
import 'HomePage.dart';
import 'package:talan_mobile_interface/form_components/delayed_animation.dart';

import 'ResultatPage.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Home'),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1500,
                child: Container(
                  height: 170,
                  child: Image.asset('assets/2.png'),
                ),
              ),
              DelayedAnimation(
                delay: 2500,
                child: Container(
                  height: 200,
                  child: Image.asset('assets/3.png'),
                ),
              ),
              DelayedAnimation(
                delay: 4500,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(13)),
                    child: Text('GET STARTED'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>ResultatPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      )
    ),
  );
  Widget buildHeader(BuildContext context) => Container(
    color: Colors.cyan,
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Column(

    )
  );
  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
    runSpacing: 16, //vertical spacing
    children: [
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const  Text('Home'),
        onTap: ()=>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomePage(),
            )),
      ),
      const Divider(color: Colors.black54),
      ListTile(
        leading: const Icon(Icons.add_a_photo_outlined),
        title: const  Text('RESULTATS'),
        onTap: () {
          //close navigation drawer before
          Navigator.pop(context);
          //swip to the capture page
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const LineCharts(),
          ));
        },
        ),
      const Divider(color: Colors.black54),
      ListTile(
        leading: const Icon(Icons.info_outline),
        title: const  Text('Informations'),
        onTap: (){
          //close navigation drawer before
          Navigator.pop(context);
          //swip to the information page
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const InfoPage(),
        ));
        },
      ),
      const Divider(color: Colors.black54),
      ListTile(
        leading: const Icon(Icons.account_circle_outlined),
        title: const  Text('Formulaire patient'),
        onTap: (){
          //close navigation drawer before
          Navigator.pop(context);
          //swip to the AddPatientMaterial page
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  AddPatientMaterial(),
          ));
        },
      )
    ],
  )
  );
}