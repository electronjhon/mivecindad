import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mivecindad/main.dart';

// REGISTRO CLIENTE

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

  void limpiar(){
    cedula.text=""; nombre.text=""; apellido.text=""; correo.text=""; celular.text="";
  }

  CollectionReference clientes = FirebaseFirestore.instance.collection('Clientes');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Clientes'),
      ),
      drawer: menu(),
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
                  icon: Icon(Icons.pin_outlined,size: 36,color: Colors.blue,),
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
                  icon: Icon(Icons.badge_outlined,size: 36,color: Colors.blue,),
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
                  icon: Icon(Icons.badge_outlined,size: 36,color: Colors.blue,),
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
                  icon: Icon(Icons.local_post_office_outlined,size: 36,color: Colors.blue,),
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
                  icon: Icon(Icons.call_outlined,size: 36,color: Colors.blue,),
                  hintText: 'Digite su numero de celular',
                  hintStyle: TextStyle(color: Colors.black38)

              ),
            ),
          ),

              Center(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(

                    onPressed: () async {
                      if(cedula.text.isEmpty || nombre.text.isEmpty ||
                          apellido.text.isEmpty || correo.text.isEmpty ||
                          celular.text.isEmpty ) {
                        print('campos vacios');
                        Fluttertoast.showToast(msg: "Campos Vacios", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                      }else{
                        QuerySnapshot existe = await clientes.where(FieldPath.documentId, isEqualTo: cedula.text).get();

                      if(existe.docs.length>0){
                      Fluttertoast.showToast(msg: "El cliente ya Existe.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                      limpiar();
                      }else {
                        clientes.doc(cedula.text).set({
                          "nombre": nombre.text,
                          "apellido": apellido.text,
                          "correo": correo.text,
                          "celular": celular.text
                          });
                        QuerySnapshot inserto = await clientes.where(FieldPath.documentId, isEqualTo: cedula.text).get();
                        limpiar();
                        if(inserto.docs.length>0){
                          Fluttertoast.showToast(msg: "Cliente registrado exitosamente.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                        }else{
                          Fluttertoast.showToast(msg: "Cliente no fue registrado.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                          }
                        }
                      }
                    },
                    child: Text('Registrar',style: TextStyle(color: Colors.white,fontSize: 25),),

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      minimumSize: Size(150, 45)
                    ),
                  ),
                ),
              ),
              /*
              Container(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if(cedula.text.isEmpty){
                      Fluttertoast.showToast(msg: "Digite la cedula.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                    }else{
                      List lista=[];
                      var id;
                      var ced=cedula.text;
                      QuerySnapshot consulta = await clientes.where(FieldPath.documentId, isEqualTo: cedula.text).get();
                      if(consulta.docs.length>0){
                        for(var doc in consulta.docs){
                          //id= FieldPath.documentId;
                          lista.add(doc.data());
                        }
                        Fluttertoast.showToast(msg: "Cargando Datos.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                        cedula.text=ced;
                        nombre.text=lista[0]['nombre'];
                        apellido.text= lista[0]['apellido'];
                        correo.text= lista[0]['correo'];
                        celular.text= lista[0]['celular'];
                      }
                      else{
                        limpiar();
                        Fluttertoast.showToast(msg: "El Cliente no se encontro.", fontSize: 20, backgroundColor: Colors.red, textColor: Colors.lightGreen,
                            toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                      }
                    }
                  },
                  child: Text("Consultar",style: TextStyle(color: Colors.white, fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      minimumSize: Size(150, 45)
                  ),
                ),
              )*/

          /*
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: (){
                    if(cedula.text.isEmpty || nombre.text.isEmpty || apellido.text.isEmpty || correo.text.isEmpty || celular.text.isEmpty){
                      Fluttertoast.showToast(msg: "Campos Vacios.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                    }else{
                      clientes.doc(cedula.text).update({
                        "nombre": nombre.text,
                        "apellido": apellido.text,
                        "correo": correo.text,
                        "celular": celular.text
                      });
                      limpiar();
                      Fluttertoast.showToast(msg: "Datos Actualizados Correctamente.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                    }
                  },
                  child: Text("Actualizar",style: TextStyle(color: Colors.white, fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      minimumSize: Size(150, 45)
                  ),
                ),
              ),*/
              /*
              Container(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: (){
                    if(cedula.text.isEmpty){
                      Fluttertoast.showToast(msg: "Campos Vacios.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                    }else
                    {
                      clientes.doc(cedula.text).delete();
                      limpiar();
                      Fluttertoast.showToast(msg: "Cliente Eliminado Exitosamente.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                    }
                  },
                  child: Text("Eliminar",style: TextStyle(color: Colors.white, fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      minimumSize: Size(150, 45)
                  ),
                ),
              )
            ],
          )*/
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
