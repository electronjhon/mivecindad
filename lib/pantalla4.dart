import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/main.dart';
import 'package:mivecindad/pantalla3.dart';
import 'package:mivecindad/pantalla5.dart';
import 'package:flutter/widgets.dart';

// ******    RESULTADO CONSULTA POR CATEGORIA ************

class pantalla4 extends StatefulWidget {
  final String criterio;
  const pantalla4(this.criterio,{Key? key}) : super(key: key);

  @override
  _pantalla4State createState() => _pantalla4State();
}

class _pantalla4State extends State<pantalla4> {

  List negs=[];

  void initState(){
    super.initState();
    getCriterio();
  }

  void getCriterio() async{
    CollectionReference datos = FirebaseFirestore.instance.collection('Negocios');
    QuerySnapshot negocios2 = await datos.where('Categoria', isEqualTo: widget.criterio).get();
    if(negocios2.docs.length!=0){ //trae datos
      for(var neg in negocios2.docs){
        print(neg.data());
        setState(() {
          negs.add(neg);
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
        title: Text('Pan4 Consulta de '+ widget.criterio),
      ),
      drawer: menu(),
      body:  ListView.builder(
            itemCount: negs.length,
            itemBuilder: (BuildContext context, j) {
              return ListTile(
                //padding: EdgeInsets.all(27),
                onTap: (){
                  print('dentro de onTap pantalla4');
                  print(negs[j]); // Print datos card * en consola
                  datosNegocio n =datosNegocio(negs[j]['Nombre'],
                      negs[j]['Telefono'],
                      negs[j]['Direccion'],
                      negs[j]['Logo'],
                      negs[j]['Web'],
                      negs[j]['Imagen'],
                      negs[j]['Imagen1'],
                      negs[j]['Imagen2']);

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla5(negocio: n)));
                },

                  title: miCardImage(url: negs[j]['Logo'],
                      texto: negs[j]['Nombre']
                          + "\n ✆ :  " + negs[j]['Telefono'].toString()
                          + '\n ➤ :  ' + negs[j]['Direccion']),
              );
            }),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla3()));
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


  datosNegocio(Nombre,Telefono,Direccion,Logo,Web,Imagen,Imagen1,Imagen2){
    this.Nombre=Nombre;
    this.Telefono=Telefono;
    this.Direccion=Direccion;
    this.Logo=Logo;
    this.Web=Web;
    this.Imagen=Imagen;
    this.Imagen1=Imagen1;
    this.Imagen2=Imagen2;

  }

}