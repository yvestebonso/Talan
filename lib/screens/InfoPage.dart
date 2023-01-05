import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget{
  const InfoPage({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text ('Equipe & Produit'),
      backgroundColor: Colors.cyan,
    ),
    body: Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          SizedBox(height: 40),
          Row(
            children: [
              Icon(
                Icons.wallet,
                color: Colors.blue,
              ),
              SizedBox(width: 10),
              Text("Produit",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
            ],
          ),
          Divider(height: 20, thickness: 1),
          SizedBox(height: 10),
          Container(
            padding : EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PUPILLOMETRE',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nous sommes une equipe DYNAMIQUE ET HEUREUSE !!!',
                    style: TextStyle(fontSize: 16,height: 1.4),
                  ),
                ],
              )
          ),
          // TextButton(
          //   style: TextButton.styleFrom(
          //     padding: EdgeInsets.all(20),
          //     shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          //     backgroundColor: Color(0xFFF5F6F9),
          //   ),
          //   onPressed: () {  },
          //
          //   child: Row(
          //     children: [
          //
          //       SizedBox(height: 40),
          //       Expanded(child: Text('Nous sommes une equipe DYNAMIQUE ET HEUREUSE !!!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),)
          //
          //     ],
          //   ),
          // ),
          const SizedBox(height: 30),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.blue,
              ),
              SizedBox(width: 10),
              Text("Les membres de l'équipe",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
            ],
          ),
          Divider(height: 20, thickness: 1),
          SizedBox(height: 10),

          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {  },
            child: Row(
              children: [

                SizedBox(width: 20),
                Expanded(child: Text('Stephane THURNEYSSEN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {  },
            child: Row(
              children: [

                SizedBox(width: 20),
                Expanded(child: Text('Saiida DEBBICHE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {  },
            child: Row(
              children: [

                SizedBox(width: 20),
                Expanded(child: Text('Doline TOUKO', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {  },
            child: Row(
              children: [

                SizedBox(width: 20),
                Expanded(child: Text('Andy MBONING', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {  },
            child: Row(
              children: [

                SizedBox(width: 20),
                Expanded(child: Text('Fabrice TOUOMOU', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {  },
            child: Row(
              children: [

                SizedBox(width: 20),
                Expanded(child: Text('Yves TEBONSO', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {  },
            child: Row(
              children: [

                SizedBox(width: 20),
                Expanded(child: Text('Yassine BEN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}
