import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learn_flutter/fatchData.dart';
import 'package:learn_flutter/insertData.dart';

class WelComeage extends StatefulWidget {
  const WelComeage({super.key});

  @override
  State<WelComeage> createState() => _WelComeageState();
}

class _WelComeageState extends State<WelComeage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4D4D4D),
      appBar: AppBar(
        title: Center(child: Text("F  I  R  E  B  A  S  E")),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/firebasepng.png",
            height: 400,
            width: 500,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InsertData()));
              },
              child: Text(
                "Insert Data",
                style: TextStyle(fontSize: 25),
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FatchData()));
              },
              child: Text(
                'Fatch Data',
                style: TextStyle(fontSize: 25),
              ))
        ],
      ),
    );
  }
}
