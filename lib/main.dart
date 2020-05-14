import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'contact.dart';

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Test(),
    );
  }
}

TestState pageState;

class Item {
  PermissionGroup group;
  PermissionStatus status;

  Item(this.group, this.status);
}

class Test extends StatefulWidget {
  @override
  TestState createState() {
    pageState = TestState();
    return pageState;
  }
}

class TestState extends State<Test> {
  List<Item> list = List<Item>();

  @override
  void initState() {
    initList();
    super.initState();
  }

  void initList() {
    list.clear();
    list.add(Item(PermissionGroup.values[2], PermissionStatus.denied));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
          child: RaisedButton(
        onPressed: requestPermission,
        child: Text('data'),
      )),
    );
  }

  Future requestPermission() async {
    var status =
        await PermissionHandler().requestPermissions([pageState.list[0].group]);
    if (status.toString() ==
        "{PermissionGroup.contacts: PermissionStatus.granted}") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Contact1(),
        ),
      );
    } else {
      requestPermission();
    }
  }
}
