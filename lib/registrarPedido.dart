import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mivecindad/listadoNegocios.dart';
import 'main.dart';

class registrarPedido extends StatefulWidget {
  final String id,cedula;  // id es id de profesor / cedula es el id del cliente
  const registrarPedido({required this.id,required this.cedula});

  @override
  _registrarPedidoState createState() => _registrarPedidoState();
}

class _registrarPedidoState extends State<registrarPedido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Pedido'),
      ),
      drawer: menu(),
      body: Text('Id persona'+widget.id+'--'+'Cedula'+widget.cedula),

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
