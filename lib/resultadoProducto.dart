import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/main.dart';
import 'package:mivecindad/pantalla3.dart';
import 'package:mivecindad/pantalla4.dart';
import 'package:flutter/widgets.dart';
import 'package:mivecindad/consultaProducto.dart';
import 'package:mivecindad/pantalla6.dart';

// ******    RESULTADO CONSULTA POR PRODUCTO ************

class resultadoProducto extends StatefulWidget {
  final String criterio1;
  const resultadoProducto(this.criterio1,{Key? key}) : super(key: key);

  @override
  _resultadoProducto createState() => _resultadoProducto();
}

class _resultadoProducto extends State<resultadoProducto> {

  List prod=[];
  List Negocios=[];

  void initState(){
    super.initState();
    getCriterio();
  }

  void getCriterio() async{
    CollectionReference datos = FirebaseFirestore.instance.collection('Productos');   //  Conexion a la base de datos
    QuerySnapshot productos = await datos.where('nombre_prod', isEqualTo: widget.criterio1).get();  // consulta campo nombre

    if(productos.docs.length!=0){        //trae datos
      for(var pro in productos.docs){
        print('antes de pro data');
        print(pro.data());
        setState(() {
          prod.add(pro);
        });
      }
    }else{
      //print(criterio1);
      print("Ha fallado...");

    }
    String id;
    CollectionReference datos3 = FirebaseFirestore.instance.collection("Negocios");
    for(var i=0;i<prod.length;i++){
      id=prod[i]['negocio'];
      QuerySnapshot negocio = await datos3.where(FieldPath.documentId, isEqualTo: id).get();
      if(negocio.docs.length>0){
        for(var negc in negocio.docs){
          setState(() {
            print('dentro if consulta negocio id');
            Negocios.add(negc.data());
            print(negc.data());
          });
        }
      }else{
        print('no se encontro negocio para este producto');
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PanResulProd Consulta de '+widget.criterio1),
      ),
      drawer: menu(),
      body:  ListView.builder(
          itemCount: Negocios.length,
          itemBuilder: (BuildContext context, j) {
            return ListTile(
              //padding: EdgeInsets.all(27),
              onTap: (){
                print('dentro de onTap resultadoProducto');
                print(Negocios[j]); // Print datos card * en consola
                datosNegocio2 n =datosNegocio2(Negocios[j]['Nombre'],
                    Negocios[j]['Telefono'],
                    Negocios[j]['Direccion'],
                    Negocios[j]['Logo'],
                    Negocios[j]['Web'],
                    Negocios[j]['Imagen'],
                    Negocios[j]['Imagen1'],
                    Negocios[j]['Imagen2'],
                    Negocios[j]['Imagen3'],
                    Negocios[j]['Imagen4']);

                Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla6(negocio: n)));
              },

              title: miCardImage(url: prod[j]['imagen_prod'], //Negocios[j]['Logo']
                  texto: Negocios[j]['Nombre']
                      + " \n ✆ : " + Negocios[j]['Telefono'].toString()
                      + ' \n ➤ : ' + Negocios[j]['Direccion']
                      + ' \n '
                      + ' \n ' + prod[j]['nombre_prod']
                      + ' \n ' + prod[j]['precio_prod'].toString()
                     // + ' \n ' + prod[j]['imagen_prod'],

              ),
            );

          }),

      floatingActionButton: FloatingActionButton.extended(    //Boton de regreso
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> consultaProducto()));
        }, label: Text("Atras"),
        icon: Icon(Icons.arrow_left),
      ),
    );
  }

}


class miCardImage extends StatelessWidget {
  final String url;
  //final String url1;
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
            ),
            
          ],
        ),
      ),
    );
  }
}

class datosNegocio2{

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


  datosNegocio2(Nombre,Telefono,Direccion,Logo,Web,Imagen,Imagen1,Imagen2,Imagen3,Imagen4){
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