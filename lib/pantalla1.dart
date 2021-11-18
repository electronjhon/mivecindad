import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/main.dart';
import 'package:mivecindad/pantalla2.dart';
import 'package:mivecindad/pantalla3.dart';

class pantalla1 extends StatefulWidget {
  const pantalla1({Key? key, required this.title}) : super(key: key);

  final String title;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const pantalla1(title: 'Flutter Demo Home Page'),
    );
  }



  @override
  State<pantalla1> createState() => _pantalla1State();
}

class _pantalla1State extends State<pantalla1> {
  List datos_negocios=[];
  void initState(){
    super.initState();
    getNegocios();
  }
  void getNegocios() async{
    CollectionReference datos= FirebaseFirestore.instance.collection("Negocios"); //conecte a la coleccion
    QuerySnapshot negocios= await datos.get(); //traer todos los negocios
    if(negocios.docs.length>0){ //trae datos
      print("Trae datos...");
      for(var doc in negocios.docs){
        print(doc.data());
        setState(() {
          datos_negocios.add(doc.data());
        });
      }
    }else{
      print("Ha fallado...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Listado de negocios"),
      ),
      body: Center(

        child:  ListView.builder(
          itemCount: datos_negocios.length,
          itemBuilder: (BuildContext context, i){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(15),

              elevation: 20,
              // padding: EdgeInsets.all(33.0),
              child: Text(datos_negocios[i]['Nombre'].toString()
                  +' \nDirección :  '+ datos_negocios[i]['Direccion']+
                  ' \nTel :  '+(datos_negocios[i]['Telefono'].toString())
                ,style: TextStyle(fontSize: 27,color: Colors.black87,
                backgroundColor: Colors.yellow),),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
         // Navigator.push(context, MaterialPageRoute(builder: (context)=> main()));
          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        }, label: Text("Atras"),
        icon: Icon(Icons.arrow_back),
      ),
    );
  }
}




