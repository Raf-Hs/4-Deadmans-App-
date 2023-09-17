
import 'package:Deadmans/pages/add_carrito.dart';
import 'package:Deadmans/pages/add_venta.dart';
import 'package:Deadmans/pages/detalle.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'datos_ventas.dart';
import 'add_carrito2.dart';
import 'login.dart';

class Historial extends StatefulWidget {

  @override
 State<Historial> createState() => _HomeHistorial();

}




class _HomeHistorial extends State<Historial> {

    int _paginaActual=0;

  

  List <Datos_Ventas> data = List <Datos_Ventas>.empty (growable:true);

  Future <List <Datos_Ventas>> obtenerVentas () async {

      var url= Uri.http("dtai.uteq.edu.mx","~rafher207/DAPPS/Historial.php");
      var map = <String, dynamic>{};
      map ['apikey'] = '123';
     map ['idventa'] = '15';
      var response = 
      await http.post(url,body: map).timeout(const Duration(seconds: 90));

      var datos = jsonDecode(response.body);


      var registros = List <Datos_Ventas>.empty(growable: true);


      for (datos in datos){
        registros.add(Datos_Ventas.fromJson(datos));
      }

      return registros;


    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial de Ventas"),
      ),
      
      // body: _paginas[_paginaActual],
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
                       
                         Text(
                            
                              "Venta: #""${data[index].IDVenta}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                            ),
                        ],
                      ),
                     
                     Row(
                        children: <Widget>[

                          Text (
                            "Fecha: ""${data[index].fecha}",
                            
                            style: const TextStyle(fontSize: 18,color: Colors.white,),
                          ),

                        ],
               ),
                      Row(
                        children: <Widget>[
                          

                            
                          Text (
                            "Total: \$""${data[index].monto}",
                            
                            style: const TextStyle(fontSize: 18,color: Colors.white,),
                          ),
                    

                             IconButton (
                              icon: Image.asset(
                                'ojo.png',
                                height: 25,
                              ),
                              iconSize: 50,
                              onPressed: (){
                               
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detalle(
                                      int.parse(data[index].IDVenta),
                                      
                                      index)));
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
          
        )
        
      ]),
    );
  }
  
  @override
  void initState(){
  super.initState();
       obtenerVentas().then((value){

    setState(() {
          data.addAll(value);
    });
  });
  }

}


