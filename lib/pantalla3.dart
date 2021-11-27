import 'package:flutter/material.dart';
import 'package:mivecindad/pantalla1.dart';
import 'package:mivecindad/pantalla4.dart';

import 'main.dart';

//  *****  TEXTFIELD  PARA INGRESAR BUSQUEDA POR CATEGORIA **************

class pantalla3 extends StatelessWidget {
  //const pantalla3({Key? key}) : super(key: key);

  TextEditingController dato = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta por Categoria en Pantalla 3'),
      ),
      drawer: menu(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(33.0),

            child:
            TextField(controller: dato,style: TextStyle(fontSize: 27),
              autofocus: false,
              // autofocus: true,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.black38,),
                  hintText: "Busca Categoria en plural"
              ),
            ),

          ),
          Container(
            child: ElevatedButton(
              onPressed: (){
                print(dato.text);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla4(dato.text)));
              },child: Text('Consultar por categoria'),

            ),
          ),
          Container(
            margin: const EdgeInsets.all(36.0),
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(6.0)
            ),
            child: Text(' Ejemplo de consulta ' '\n' 'Asaderos '
                '\n' 'Panaderias' '\n''Droguerias '
              ,style: TextStyle(fontSize: 27),),
          ),


        ],
        /*floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> main()));
          }, label: Text("Inicio"),
          icon: Icon(Icons.arrow_left), */
        ),
      bottomNavigationBar: barrainferior(),

    );

  }
}

class barrainferior extends StatelessWidget {
  String title=" ";
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white38,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blue,
      onTap: (index){
        if(index==0){
          print('redirecciona a inicio'); //linea para regresar a inicio sin importar la ruta
          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        }else {
          //var t=DateTime.now();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla1(title: title)));

          //print(t);
        }/*else{
          print("va a consulta categoria");
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla3()));
        } */

      },
      items: [

        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Negocios'
        ),/*
        BottomNavigationBarItem(
            icon: Icon(Icons.cases),
            label: 'Categorias'
        )*/
      ],
    );
  }
}