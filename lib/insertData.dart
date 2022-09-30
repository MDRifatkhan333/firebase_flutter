import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  final numberController = TextEditingController();

  void clearText() {
    usernameController.clear();
    ageController.clear();
    numberController.clear();
  }

  late DatabaseReference dBrbf;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    dBrbf = FirebaseDatabase.instance.ref().child("Rifat"); //Database Name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Data from F I R E B A S E'),
      ),
      body: Column(
        children: <Widget>[
          const Center(
              child: Text(
            "Insert Data",
            style: TextStyle(fontSize: 25),
          )),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Name",
                labelText: "Name",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Age",
                labelText: "Age",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: numberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Number",
                labelText: "Number",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Map<String, String> Rifat = {
                "name": usernameController.text,
                "age": ageController.text,
                "number": numberController.text
              };
              clearText();
              dBrbf.push().set(Rifat);
            },
            child: const Text("Insert"),
          ),
          //MyWidget(button: 'Insert'),
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.button});
  final String button;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Map<String, String> Rifat = {
          "name": "usernameController.text",
          "age": "ageController.text",
          "number": "numberController.text"
        };
        //dBrbf.push().set(Person);
      },
      child: Text(widget.button),
    );
  }
}
