import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class registroClientes extends StatefulWidget {
  const registroClientes({Key? key}) : super(key: key);

  @override
  _registroClientesState createState() => _registroClientesState();
}

class _registroClientesState extends State<registroClientes> {

  final cedula = TextEditingController();
  final nombre = TextEditingController();
  final apellido = TextEditingController();
  final correo = TextEditingController();
  final celular = TextEditingController();

  CollectionReference clientes = FirebaseFirestore.instance.collection('Clientes');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Clientes'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: cedula,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  icon: Icon(Icons.pin_outlined,size: 25,color: Colors.blue,),
                  hintText: 'Digite su numero de cedula',
                  hintStyle: TextStyle(color: Colors.black38)

              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: nombre,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  icon: Icon(Icons.badge_outlined,size: 25,color: Colors.blue,),
                  hintText: 'Digite su nombre',
                  hintStyle: TextStyle(color: Colors.black38)

              ),
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
                  icon: Icon(Icons.badge_outlined,size: 25,color: Colors.blue,),
                  hintText: 'Digite sus apellidos',
                  hintStyle: TextStyle(color: Colors.black38)

              ),
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
                  icon: Icon(Icons.local_post_office_outlined,size: 25,color: Colors.blue,),
                  hintText: 'Digite su correo',
                  hintStyle: TextStyle(color: Colors.black38)

              ),
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
                  icon: Icon(Icons.call_outlined,size: 25,color: Colors.blue,),
                  hintText: 'Digite su numero de celular',
                  hintStyle: TextStyle(color: Colors.black38)

              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
              
              onPressed: (){
                if(cedula.text.isEmpty || nombre.text.isEmpty ||
                    apellido.text.isEmpty || correo.text.isEmpty ||
                    celular.text.isEmpty ) {
                  print('campos vacios');
                }else{
                  clientes.doc(cedula.text).set({
                    "nombre": nombre.text,
                    "apellido": apellido.text,
                    "correo": correo.text,
                    "celular": celular.text
                  });
                }

              },
              icon: Icon(Icons.app_registration_outlined),
              label: Text('Registrar',style: TextStyle(color: Colors.white,fontSize: 25),),

              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                minimumSize: Size(150, 45)
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla3()));

        }, label: Text("Atras"),
        icon: Icon(Icons.arrow_left),
      ),
    );
  }
}
