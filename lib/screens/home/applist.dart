import 'package:flutter/material.dart';
import 'package:flutter_api/models/appName.dart';
import 'package:provider/provider.dart';

import 'app_tile.dart';

class AppList extends StatefulWidget {
  @override
  _AppListState createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  @override
  Widget build(BuildContext context) {

    final mydatabases = Provider.of<List<MyDatabase>>(context) ?? [];

    return ListView.builder(
      itemCount: mydatabases.length,
      itemBuilder: (context, index) {
        return AppTile(mydata: mydatabases[index]);
      },
    );
  }
}