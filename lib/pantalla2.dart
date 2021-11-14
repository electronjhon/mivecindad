import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class pantalla2 extends StatefulWidget {
  const pantalla2({Key? key}) : super(key: key);

  @override
  _pantalla2State createState() => _pantalla2State();
}

class _pantalla2State extends State<pantalla2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de negocios"),
      ),
       body:  Container(
          child: Text("Listado de negocios en pantalla 2"),
        ),
    );


  }
}
