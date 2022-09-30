import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FatchData extends StatefulWidget {
  const FatchData({super.key});

  @override
  State<FatchData> createState() => _FatchDataState();
}

class _FatchDataState extends State<FatchData> {
  Query dBRef = FirebaseDatabase.instance.ref().child("Person");
  @override
  Widget listitem({required Map person}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      height: 140,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            person['name'],
            style: TextStyle(fontSize: 20),
          ),
          Text(
            person['age'],
            style: TextStyle(fontSize: 20),
          ),
          Text(
            person['number'],
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.edit),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("F I R E B A S E")),
        ),
        body: Container(
          child: FirebaseAnimatedList(
            query: dBRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map person = snapshot.value as Map;
              person['key'] = snapshot.key;
              return listitem(person: person);
            },
          ),
        ));
  }
}
