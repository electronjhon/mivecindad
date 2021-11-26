import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mivecindad/comprobarCliente.dart';
import 'package:mivecindad/main.dart';

class actualizarCliente extends StatefulWidget {
  final datosCliente cliente;

  const actualizarCliente({required this.cliente});

  @override
  _actualizarClienteState createState() => _actualizarClienteState();
}

class _actualizarClienteState extends State<actualizarCliente> {
  final nombre = TextEditingController();
  final apellido = TextEditingController();
  final correo = TextEditingController();
  final celular = TextEditingController();

  CollectionReference cliente =
  FirebaseFirestore.instance.collection('Clientes');

  void limpiar() {
    nombre.text = '';
    apellido.text = '';
    correo.text = '';
    celular.text = '';
  }

  void regresar() {
    //Navigator.push(context, route)
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => comprobarCliente()));
  }
  void pantalla2(){
    /*Navigator.push(
        context, MaterialPageRoute(builder: (context) => pantalla2()));   */
    Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    String cedula = widget.cliente.cedula;
    nombre.text = widget.cliente.nombre;
    apellido.text = widget.cliente.apellido;
    correo.text = widget.cliente.correo;
    celular.text = widget.cliente.celular;

    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar Datos: ' + widget.cliente.nombre),
      ),
      drawer: menu(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: nombre,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  fillColor: Colors.white12,
                  filled: true,
                  icon: Icon(
                    Icons.badge_outlined,
                    size: 25,
                  ),
                  hintText: 'Digite su nombre',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: apellido,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  icon: Icon(
                    Icons.badge_outlined,
                    size: 25,
                  ),
                  hintText: 'Digite sus apellidos',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: correo,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  icon: Icon(
                    Icons.local_post_office_outlined,
                    size: 25,
                  ),
                  hintText: 'Digite su correo',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: celular,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  icon: Icon(
                    Icons.call_outlined,
                    size: 25,
                    color: Colors.blue,
                  ),
                  hintText: 'Digite su numero de celular',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          /*Row(
            children: [
              /*ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('Actualizar')
              ),ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('Eliminar')
              )
            ], */
          ), */
          Row(
            children: [
              //  3ER BOTON  ACTUALIZAR FUNCIONALIDAD
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (nombre.text.isEmpty ||
                        apellido.text.isEmpty ||
                        correo.text.isEmpty ||
                        celular.text.isEmpty) {
                      print('campos vacios');
                      Fluttertoast.showToast(
                          msg: "Campos vacios",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM);
                    } else {
                      cliente.doc(widget.cliente.cedula).update({
                        'nombre': nombre.text,
                        'apellido': apellido.text,
                        'correo': correo.text,
                        'celular': celular.text
                      });
                      limpiar();
                      Fluttertoast.showToast(
                          msg: "Datos actualizados",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER);
                      regresar();
                    }
                  },
                  //   BOTON  ACTUALIZAR
                  child: Text('Actualizar',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
              //  4TO BOTON  ELIMINAR FUNCIONALIDAD
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (nombre.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: 'Campos vacios',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER);
                    } else {
                      cliente.doc(widget.cliente.cedula).delete();
                      //cliente.doc(cedula.text).delete();
                      limpiar();
                      Fluttertoast.showToast(
                          msg: 'Cliente eliminado Exitosamente',
                          fontSize: 20,
                          backgroundColor: Colors.amber,
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER);
                      pantalla2();
                    }
                  },
                  //  4TO BOTON  ELIMINAR
                  child: Text('Eliminar',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.push(context,
              //MaterialPageRoute(builder: (context) => comprobarCliente()));
              Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        },
        child: Icon(Icons.home, size: 30, color: Colors.white),
      ),
    );
  }
}
