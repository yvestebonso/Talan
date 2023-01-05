import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

enum Gender {
  Femme,
  Homme
}
class Patient {

  String firstName ='';
  String lastName ='';
  String country='';
  late int age;
  late Gender gender;
  late String birthDate;


  Map <String,dynamic> toJson()=>{
    'firstName':firstName,
    'lastName' : lastName,
    'birthdate': birthDate,
    'gender': gender.name,
    'country' : country,
  };

  save(){
     FirebaseFirestore.instance.collection('patients').add(this.toJson()).then((value) => print("user added"))
         .catchError((error) => print("Failed to add user: $error"));
  }
}

