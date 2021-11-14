import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/pantalla3.dart';

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
        title: Text('Listado por categorias Pantalla 4'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: negs.length,
          itemBuilder: (BuildContext context, i){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(15),

              elevation: 20,
             // padding: EdgeInsets.all(33.0),
              child: Text(negs[i]['Nombre']+' \nDirección :  '+ negs[i]['Direccion']+
                  ' \nTel :  '+(negs[i]['Telefono'].toString()//+'\n '+ negs[i]['Logo']
              )
                  ,style: TextStyle(fontSize: 27,color: Colors.black87,
                  backgroundColor: Colors.yellow),),
              //Container:(Image.network(negs[i]['Logo']))
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla3()));
        }, label: Text("Atras"),
        icon: Icon(Icons.arrow_left),
      ),
    );
  }
}
