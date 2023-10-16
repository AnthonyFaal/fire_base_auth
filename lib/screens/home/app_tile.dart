
import 'package:flutter/material.dart';
import 'package:flutter_api/models/appName.dart';

class AppTile extends StatelessWidget {

  final MyDatabase mydata;
  AppTile({ required this.mydata });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[mydata.strength],
            backgroundImage: AssetImage('assets/dodos bg@4x 1.png'),
          ),
          title: Text(mydata.name),
          subtitle: Text('Takes ${mydata.sugars} sugar(s)'),
        ),
      ),
    );
  }
}