import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
          DrawerHeader(child: Container()),
          Column(
            children: <Widget>[
              ListTile(leading: const Icon(Icons.info), onTap: () {Navigator.pop(context);}),
              ListTile(leading: const Icon(Icons.save), onTap: () {Navigator.pop(context);}),
              ListTile(leading: const Icon(Icons.settings), onTap: () {Navigator.pop(context);}),
            ],
          )
        ]));
  }
}