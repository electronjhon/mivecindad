import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mivecindad/pantalla3.dart';
import 'package:mivecindad/pantalla4.dart';
import 'package:mivecindad/resultadoProducto.dart';

// ********** DATOS NEGOCIO  Y PAGINA WEB **************************

class pantalla5 extends StatelessWidget {

  final datosNegocio negocio;

  const pantalla5({required this.negocio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pan5 Datos Negocio '+negocio.Nombre),
      ),
      body: ListView(
        children: [
          miCardImage(url: negocio.Logo,
              texto: negocio.Nombre
              + ' \n ✆ : ' + negocio.Telefono.toString()
              + ' \n ➤ : ' + negocio.Direccion),
               //Image.network(negocio.Imagen),

          Center(                  //         boton pagina web
            child: ElevatedButton.icon(

              onPressed: (){
                  launch(negocio.Web.toString());

                },
              icon: Icon(Icons.travel_explore_outlined),
              label: Text('Mi pagina web'),

              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),

                ),
                minimumSize: Size(300, 40),    // tamaño del  boton
              ),

            ),
          ),
          Column(
            children: [
             /* ElevatedButton.icon(
                onPressed: (){
                  print('Boton de productos pan5');
                },
                icon: Icon(Icons.arrow_downward),
                label: Text('Nuestros Productos'),

              ),   */

             // Image.network(negocio.Imagen),

             // Image.network(negocio.Imagen1),   //  IMAGENES INDIVIDUAL

              /*ClipRRect(                    // **  Muestra imagen
                borderRadius: BorderRadius.circular(8.0),

                child: Image.network(
                  negocio.Imagen,
                  //height: 150.0,
                  //width: 100.0,
                ),
              ), */
              /*Center(

                child: Text(' ↓  Nuestros Productos ↓ ',
                  style: TextStyle(
                      color: Colors.white54,
                    backgroundColor: Colors.blue,
                   // decoration: TextDecoration.combine(decorations),
                   // decorationColor: Colors.red,
                    fontSize: 25
                    ),
                ),
              ), */
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(6.0)
                ),
                child: Text(' ↓  Nuestros Productos ↓ ',style: TextStyle(fontSize: 27),),
              ),
              Container(        //    CONTAINER  PARA IMAGEN
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Colors.black,
                    width: 6,
                  ),
                ),
                child: Image.network(negocio.Imagen,scale: 1.0,),
                height: 450.0,
                width: 450.0,

              ),
              Container(          //    CONTAINER  PARA IMAGEN1
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Colors.black,
                    width: 6,
                  ),
                ),
                child: Image.network(negocio.Imagen1),
                height: 450.0,
                width: 450.0,
              ),
              Container(          //    CONTAINER  PARA IMAGEN2
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Colors.black,
                    width: 6,
                  ),
                ),
                child: Image.network(negocio.Imagen2),
                height: 450.0,
                width: 450.0,
              ),
              Container(        //    CONTAINER  PARA IMAGEN3
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Colors.black,
                    width: 6,
                  ),
                ),
                child: Image.network(negocio.Imagen3,scale: 1.0,),
                height: 450.0,
                width: 450.0,

              ),
              Container(        //    CONTAINER  PARA IMAGEN4
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Colors.black,
                    width: 6,
                  ),
                ),
                child: Image.network(negocio.Imagen4,scale: 1.0,),
                height: 450.0,
                width: 450.0,

              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla3()));
          //Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
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