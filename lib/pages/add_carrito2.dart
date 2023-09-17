
import 'package:Deadmans/pages/carrito.dart';
import 'package:Deadmans/pages/historial.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'datos_detalle.dart';
import 'datos_ventas.dart';
import 'add_carrito.dart';
import 'login.dart';
import 'datos_cliente.dart';
import 'catalogo.dart';


class Deseos extends StatefulWidget {
  int IDVenta,index;
  Deseos (this.IDVenta, this.index, {super.key});


  @override
 State<Deseos> createState() => _Deseos();

}




class _Deseos extends State<Deseos> {


  List <Datos_Detalle> data = List <Datos_Detalle>.empty (growable:true);

  Future <List <Datos_Detalle>> obtenerProductos (int idventa,int idventa1) async {


      var url= Uri.http("dtai.uteq.edu.mx","~rafher207/DAPPS/Detalle.php");
      var map = <String, dynamic>{};
      map ['apikey'] = '123';
       map['idusuario'] = '1';
      map ['idventa'] = idventa.toString();
     
      var response = 
      await http.post(url,body: map).timeout(const Duration(seconds: 90));
      print(response.statusCode);
      print(response.body);
      
    


      var registros = List <Datos_Detalle>.empty(growable: true);

      return registros;


    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de venta"),
      ),







      // body: _paginas[_paginaActual],
      backgroundColor: Colors.brown[400],
      body: Column(children:<Widget> [
           const SizedBox(

                  height: 20,


              ),
      
         
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
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC0HIKCoLl0tYka429-cZu68ybgLtprXldIg&usqp=CAU"
                            ) 
                          , image: NetworkImage(data[index].Imagen),
                          fit: BoxFit.fitHeight,
                          height: 130.0,
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          Text (
                            "${data[index].IDProd}-${data[index].Nombre}",
                            style: const TextStyle(fontSize: 18,color: Colors.white,),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                             "€""${data[index].Precio}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
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
  print("Id add ${widget.index}");
  super.initState();
      /*Modificar*/
       obtenerProductos(widget.IDVenta,widget.IDVenta).then((value){

    setState(() {
          data.addAll(value);
    });
  });
  }




}


