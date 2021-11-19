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
        title: Text('Consulta de '+ widget.criterio),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: negs.length,
            itemBuilder: (BuildContext context, j) {
              return Container(
                //padding: EdgeInsets.all(27),

                  child: miCardImage(url: negs[j]['Logo'],
                      texto: negs[j]['Nombre']
                          + "\n ✆ :  " + negs[j]['Telefono'].toString()
                          + '\n ➤ :  ' + negs[j]['Direccion'])


              );
            }),
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
