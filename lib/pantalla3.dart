import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/main.dart';
import 'package:mivecindad/pantalla2.dart';
import 'package:mivecindad/pantalla3.dart';
import 'package:mivecindad/pantalla4.dart';

class pantalla3 extends StatelessWidget {
  //const pantalla3({Key? key}) : super(key: key);

  TextEditingController dato = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta por Categoria en Pantalla 3'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(33.0),

            child:
            TextField(controller: dato,style: TextStyle(fontSize: 27),
              autofocus: false,
              // autofocus: true,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.black38,),
                  hintText: "Busca Categoria en plural"
              ),
            ),

          ),
          Container(
            child: ElevatedButton(
              onPressed: (){
                print(dato.text);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla4(dato.text)));
              },child: Text('Consultar por categoria'),

            ),
          ),

        ],
        /*floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> main()));
          }, label: Text("Inicio"),
          icon: Icon(Icons.arrow_left), */
        ),
      bottomNavigationBar: barrainferior(),

    );

  }
}

class barrainferior extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white38,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blue,
      onTap: (index){
        if(index==0){
          print('redirecciona a inicio'); //linea para regresar a inicio sin importar la ruta
          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        }else {
          //var t=DateTime.now();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla2()));

          //print(t);
        }/*else{
          print("va a consulta categoria");
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla3()));
        } */

      },
      items: [

        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Negocios'
        ),/*
        BottomNavigationBarItem(
            icon: Icon(Icons.cases),
            label: 'Categorias'
        )*/
      ],
    );
  }
}