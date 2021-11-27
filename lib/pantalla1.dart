import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/main.dart';
import 'package:mivecindad/pantalla2.dart';
import 'package:mivecindad/consultaProducto.dart';

// *******  LISTADO COMPLETO DE NEGOCIOS EN BASE DE DATOS ***********

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
        title: Text('Listado De Negocios Pantalla 1'),
      ),
      drawer: menu(),
      body:ListView.builder(
          itemCount: datos_negocios.length,
          itemBuilder: (BuildContext context, j) {
            return ListTile(
              //padding: EdgeInsets.all(27),
                onTap: (){
                  print('dentro de onTap pantalla1');
                  print(datos_negocios[j]); // Print datos card * en consola
                  datosNegocio d =datosNegocio(datos_negocios[j]['Nombre'],
                      datos_negocios[j]['Telefono'],
                      datos_negocios[j]['Direccion'],
                      datos_negocios[j]['Logo'],
                      datos_negocios[j]['Web'],
                      datos_negocios[j]['Imagen'],
                      datos_negocios[j]['Imagen1'],
                      datos_negocios[j]['Imagen2'],
                      datos_negocios[j]['Imagen3'],
                      datos_negocios[j]['Imagen4']);


                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla2(negocio: d)));
                },

                title: miCardImage(url: datos_negocios[j]['Logo'],
                    texto: datos_negocios[j]['Nombre']
                        + "\n ✆ :  " + datos_negocios[j]['Telefono'].toString()
                        + '\n ➤ :  ' + datos_negocios[j]['Direccion'])


            );
          }),
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


class datosNegocio{

  String Nombre="";
  String Telefono="";
  String Direccion="";
  String Logo="";
  String Web="";
  String Imagen="";
  String Imagen1="";
  String Imagen2="";
  String Imagen3="";
  String Imagen4="";


  datosNegocio(Nombre,Telefono,Direccion,Logo,Web,Imagen,Imagen1,Imagen2,Imagen3,Imagen4){
    this.Nombre=Nombre;
    this.Telefono=Telefono;
    this.Direccion=Direccion;
    this.Logo=Logo;
    this.Web=Web;
    this.Imagen=Imagen;
    this.Imagen1=Imagen1;
    this.Imagen2=Imagen2;
    this.Imagen3=Imagen3;
    this.Imagen4=Imagen4;

  }

}



