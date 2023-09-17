
import 'package:Deadmans/pages/catalogo.dart';
import 'package:Deadmans/pages/delete_deseos.dart';
import 'package:Deadmans/pages/gracias.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'datos_deseos.dart';
import 'add_deseos.dart';
import 'delete_carrito.dart';
import 'login.dart';

class Deseos extends StatefulWidget {

  @override
 State<Deseos> createState() => _HomeDeseos();

}




class _HomeDeseos extends State<Deseos> {

    int _paginaActual=0;



  List <Datos_Deseos> data = List <Datos_Deseos>.empty (growable:true);

  Future <List <Datos_Deseos>> obtenerProductos () async {

      var url= Uri.http("dtai.uteq.edu.mx","~rafher207/DAPPS/Deseos.php");
      var map = <String, dynamic>{};
      map ['apikey'] = '123';
     
      var response = 
      await http.post(url,body: map).timeout(const Duration(seconds: 90));

      var datos = jsonDecode(response.body);


      var registros = List <Datos_Deseos>.empty(growable: true);


      for (datos in datos){
        registros.add(Datos_Deseos.fromJson(datos));
      }

      return registros;


    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deseos "),
      ),


      backgroundColor: Colors.brown[400],
      body: Column(children:<Widget> [
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index){
              return Container(
                
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    border:
                    Border(bottom: BorderSide(color: Colors.blue,width: 1)),
              ),
              
              child: Row(
                
                children: [
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: <Widget>[
                          FadeInImage(
                            placeholder: const NetworkImage(
                              ""
                            ) 
                          , image: NetworkImage(data[index].Imagen),
                          fit: BoxFit.fitHeight,
                          height: 45.0,
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          Text (
                            "${data[index].IDProd}-${data[index].Nombre}    ",
                            style: const TextStyle(fontSize: 16),
                          ),
                            Text(
                             "€""${data[index].Precio}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                            ),
                           IconButton (
                              icon: Image.asset(
                                'equis.png',
                                height: 25,
                              ),
                              iconSize: 50,
                              onPressed: (){
                               
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DeleteDeseos(
                                      int.parse(data[index].IDProd),
                                      
                                      index)),(Route <dynamic> route) => false);
                              },
                            ),
                        ],
                        
                      ),
                      
              
               
            ],
          ),  
          
          
                ],
                
                
        ),
        
      );
      
      
            },
            
            itemCount: data.length,
          ),
          
        ),
           ElevatedButton(
                onPressed: 
                ()  {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SegundaPagina()),(Route <dynamic> route) => false);
                            
                      
                },
                 child: const Text('Home'),
                ),    
                   const SizedBox(

                  height: 40,


              ),
                
      ]
      ),
    );
  }
  
  @override
  void initState(){
  super.initState();
       obtenerProductos().then((value){

    setState(() {
          data.addAll(value);
    });
  });
  }

}


