import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../models/patient.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:basic_utils/basic_utils.dart';



class AddPatientMaterial extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatientMaterial> {
  final _patient = Patient();
  final _formKey = GlobalKey<FormState>();
  Gender? _gender;

  TextEditingController dateInput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text('Ajout Patient')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Builder(
          builder: (context) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: ('Nom'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nom invalide';
                      }
                    },
                    onSaved: (firstName) =>
                        setState(() => _patient.firstName = firstName!),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                        labelText: ('Prenom'),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value!.isEmpty) return 'Prenom invalide';
                    },
                    onSaved: (lastName) => setState(() {
                      _patient.lastName = lastName!;
                    }),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: dateInput,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: "Date de naissance",
                    ),
                    onTap: () async {
                        final date =  await showDatePicker(context:context,
                         locale: const Locale("fr", "FR"),
                         initialDate: DateTime.now(),
                         firstDate: DateTime(1900),
                         lastDate: DateTime.now(),
                    );
                        if (date !=null)
                          {
                            setState(() {
                              _patient.birthDate=DateFormat('dd-MM-yyyy').format(date);
                              dateInput.text=DateFormat('dd-MM-yyyy').format(date);
                            });
                          }
                    }
                  ),
                  const SizedBox(height: 20),

                  CountryListPick(
                      appBar: AppBar(
                        backgroundColor: Colors.cyan,
                        title: const Text('Choisir un pays'),
                      ),
                      theme: CountryTheme(
                        searchHintText:  "Chercher",
                        searchText:  "Chercher",
                        lastPickText: "Dernière sélection",
                        isShowFlag: true,
                        isShowTitle: true,
                        isDownIcon: true,
                        showEnglishName: true,
                      ),
                      onChanged: (CountryCode? code) {
                        print(code?.name);
                        _patient.country = code!.name!;
                      },
                    initialSelection: '+33',
                      // Whether to allow the widget to set a custom UI overlay
                      useUiOverlay: true,
                      // Whether the country list should be wrapped in a SafeArea
                      useSafeArea: false),
                  Row(
                    children:[
                      Expanded(child:
                        RadioListTile(
                          title: Text(Gender.Femme.name),
                          value: Gender.Femme,
                          groupValue: _gender,
                          onChanged: (value)=>{
                            setState((){
                              _gender= value;
                              _patient.gender = _gender!;
                            })
                          }
                      )
                      ),

                      Expanded(child: RadioListTile(
                      title: Text(Gender.Homme.name),
                      value: Gender.Homme,
                  groupValue: _gender,
                    onChanged: (value)=>{
                   setState((){
                    _gender= value;
                     _patient.gender = _gender!;
                   })
                  }
                  )
                      )
  ]),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        final form = _formKey.currentState;
                        if (form!.validate()) {
                          form.save();
                          _patient.save();
                          _showDialog(context);
                        }
                      },
                      child: const Text('Continuer'),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                  StringUtils.capitalize(_patient.firstName) +
                  " " +
                  StringUtils.capitalize(_patient.lastName)),
              content: Text("Birthdate  : " +
                  _patient.birthDate +
                  "\n" +
                  "Genre : " +
                  _patient.gender.name +
                  "\n"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes"),
                )
              ]);
        });
  }
}
