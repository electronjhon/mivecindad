import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/main.dart';
import 'package:mivecindad/pantalla2.dart';
import 'package:mivecindad/pantalla3.dart';

class pantalla2 extends StatefulWidget {
  const pantalla2({Key? key, required this.title}) : super(key: key);

  final String title;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const pantalla2(title: 'Flutter Demo Home Page'),
    );
  }



  @override
  State<pantalla2> createState() => _pantalla2State();
}

class _pantalla2State extends State<pantalla2> {
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
        title: Text('Listado De Negocios Pantalla 2'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: datos_negocios.length,
            itemBuilder: (BuildContext context, j) {
              return Container(
                //padding: EdgeInsets.all(27),

                  child: miCardImage(url: datos_negocios[j]['Logo'],
                      texto: datos_negocios[j]['Nombre']
                          + "\n ✆ :  " + datos_negocios[j]['Telefono'].toString()
                          + '\n ➤ :  ' + datos_negocios[j]['Direccion'])


              );
            }),
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


class miCardImage extends StatelessWidget {
  final String url;
  final String texto;

  const miCardImage({required this.url, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      margin: EdgeInsets.all(20),
      elevation: 10,
      color: Colors.blueAccent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Column(
          children: [
            Image.network(url),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blueAccent,
              child: Text(texto,style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}


