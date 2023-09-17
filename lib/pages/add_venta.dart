
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'datos_ventas.dart';


class AddVenta extends StatefulWidget {
  int IDVenta,index;
  AddVenta (this.IDVenta, this.index, {super.key});


  @override
 State<AddVenta> createState() => _AddVenta();

}




class _AddVenta extends State<AddVenta> {


  List <Datos_Ventas> data = List <Datos_Ventas>.empty (growable:true);

  Future <List <Datos_Ventas>> obtenerProductos (int idprod,int idclie) async {


      var url= Uri.http("dtai.uteq.edu.mx","~rafher207/DAPPS/detalle.php");
      var map = <String, dynamic>{};
      map ['apikey'] = '123';
       map['idusuario'] = '1';
      map ['idproducto'] = idprod.toString();
     
      var response = 
      await http.post(url,body: map).timeout(const Duration(seconds: 90));
      print(response.statusCode);
      print(response.body);
      
    


      var registros = List <Datos_Ventas>.empty(growable: true);

      return registros;


    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de Venta"),
      ),
      backgroundColor: Colors.brown[400],
      body: Center(
        
        child: Column ( children: [
           const SizedBox(

                  height: 20,


              ),
               const SizedBox(

                  height: 20,


              ),
          const Text ("Producto Agregado al carrito",style: const TextStyle(fontSize: 18,color: Colors.white,),),
          const Padding(padding: EdgeInsets.all(15)),
           IconButton (
                              icon: Image.asset(
                                'check.png',
                                height: 25,
                              ),
                              iconSize: 50,
                              onPressed: (){
                              
                              },
                            ),
          ElevatedButton(onPressed: (){
                Navigator.pop(context);
                //Navigator.pushNamed(context,"/SegundaPagina");
          }, 
          child: const Text("Regresar"),
          ),
        ]),

        ),
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


