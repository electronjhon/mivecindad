import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/listadoNegocios.dart';
import 'package:mivecindad/main.dart';
import 'package:mivecindad/registrarPedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class carritoCompras extends StatefulWidget {
  final List<datosPedido> pedido;
  final String id;
  final String cedula;

  const carritoCompras(
      {required this.pedido, required this.cedula, required this.id });

  @override
  _carritoComprasState createState() => _carritoComprasState();
}

class _carritoComprasState extends State<carritoCompras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de compras'),
      ),
      drawer: menu(),
      body: Center(
        child: ListView.builder(
          itemCount: widget.pedido.length,
          itemBuilder: (BuildContext context, i) {
            return ListTile(
              title: Text(widget.pedido[i].nombre
                  + '\nPrecio :  ' + widget.pedido[i].precio
                  + '    Cant:   ' + widget.pedido[i].cant.toString()
                  + '    Total:  ' + widget.pedido[i].total.toString(),
                      style: TextStyle(fontSize: 20),),
              trailing: Icon(Icons.delete, size: 30, color: Colors.red,),
              onTap: () {
                widget.pedido.removeAt(i);
                setState(() {

                });
              },
            );

          },
        ),
      ),

      bottomNavigationBar: carritoBar(listaPedido: widget.pedido, negocio: widget.id, cliente: widget.cedula),
    );
  }
}

class carritoBar extends StatefulWidget {

  final List<datosPedido> listaPedido;
  final String negocio;
  final String cliente;

  const carritoBar({required this.listaPedido,
    required this.negocio,
    required this.cliente});

  @override
  _carritoBarState createState() => _carritoBarState();
}
class _carritoBarState extends State<carritoBar> {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white60,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(        // BOTON REGRESA
              icon: Icon(Icons.add_shopping_cart_sharp, size: 30),
              label: 'Agregar\nCurso'
          ),
          BottomNavigationBarItem(      // BOTON TOTAL
              icon: Icon(Icons.app_registration, size: 30),
              label: 'TOTAL'
          ),
          BottomNavigationBarItem(      // BOTON CONFIRMAR
              icon: Icon(Icons.add_business_sharp, size: 30),
              label: 'Confirmar\nCompra'
          )
        ],
        onTap: (indice) {
          if (indice == 0) {         // INDICE 0
            Navigator.pop(context);
          } else if (indice == 1) {    // INDICE 1

          }else{              // INDICE 3

          }
        });
  }
}

