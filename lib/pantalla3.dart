import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class pantalla3 extends StatefulWidget {
  final String criterio;
  const pantalla3(this.criterio,{Key? key}) : super(key: key);

  @override
  _pantalla3State createState() => _pantalla3State();
}

class _pantalla3State extends State<pantalla3> {

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
        title: Text('Pantalla3'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: negs.length,
            itemBuilder: (BuildContext context, i){
              return Container(
              child: Text(negs[i]['Nombre']+' : '), //+negs[i]['Productos']
              );
    },
        ),
      ),
    );
  }
}
