import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/pantalla3.dart';

class pantalla2 extends StatelessWidget {
  //const pantalla2({Key? key}) : super(key: key);

  TextEditingController dato = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla2'),
      ),
      body: Column(
        children: [
          Container(
            child:
            TextField(controller: dato,),
          ),
          Container(
            child: ElevatedButton(
              onPressed: (){
                print(dato.text);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla3(dato.text)));
              },child: Text('Consultar'),
            ),
          ),
        ],
      ),
    );
  }
}
