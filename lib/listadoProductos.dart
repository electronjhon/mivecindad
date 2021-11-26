import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/moduloPedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mivecindad/pantalla1.dart';
import 'package:mivecindad/registrarPedido.dart';
import 'main.dart';

class listadoProductos extends StatefulWidget {
  const listadoProductos({Key? key}) : super(key: key);

  @override
  _listadoProductosState createState() => _listadoProductosState();
}

class _listadoProductosState extends State<listadoProductos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de productos '),
      ),
      drawer: menu(),
      body: Text('cuerpo'),
      floatingActionButton: FloatingActionButton(
        // BOTON NAVEGACION  A HOME
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>comprobarCliente()));
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        },
        child: Icon(Icons.home, size: 30, color: Colors.white),
      ),
    );

  }
}
