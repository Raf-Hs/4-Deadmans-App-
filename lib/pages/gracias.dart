
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'datos_productos.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

class Gracias extends StatefulWidget {



  @override
 State<Gracias> createState() => _HomeGracias();

}




class _HomeGracias extends State<Gracias> {


  List <Datos_Productos> data = List <Datos_Productos>.empty (growable:true);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Venta Realizada"),
      ),
      backgroundColor: Colors.brown[400],
      body: Center(
        
        child: Column ( children: [
          
           const SizedBox(

                  height: 20,


              ),
             
          const Text ("Gracias por tu compra",style: const TextStyle(fontSize: 18,color: Colors.white,),),
          IconButton (
                              icon: Image.asset(
                                'check.png',
                                height: 25,
                              ),
                              iconSize: 50,
                              onPressed: (){
                              
                              },
                            ),
          const Padding(padding: EdgeInsets.all(15)),
             const SizedBox(

                  height: 20,


              ),
        



          ElevatedButton(onPressed: (){
                //Navigator.pop(/Catalogo);
                Navigator.pushNamed(context,"/SegundaPagina");
          }, 
          child: const Text("Home"),
          ),
        ]),

        ),
    );

  }





}


