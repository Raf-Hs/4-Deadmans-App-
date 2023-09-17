
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'datos_productos.dart';


class DeleteCarrito extends StatefulWidget {
  int IDProd,index;
 DeleteCarrito (this.IDProd, this.index, {super.key});


  @override
 State<DeleteCarrito> createState() => _DeleteCarrito();

}




class _DeleteCarrito extends State<DeleteCarrito> {


  List <Datos_Productos> data = List <Datos_Productos>.empty (growable:true);

  Future <List <Datos_Productos>> obtenerProductos (int idprod,int idclie) async {


      var url= Uri.http("dtai.uteq.edu.mx","~rafher207/DAPPS/deleteCarrito.php");
      var map = <String, dynamic>{};
      map ['apikey'] = '123';
      map['idusuario'] = '1';
      map ['idproducto'] = idprod.toString();
     
      var response = 
      await http.post(url,body: map).timeout(const Duration(seconds: 90));
      print(response.statusCode);
      print(response.body);
      
    


      var registros = List <Datos_Productos>.empty(growable: true);

      return registros;


    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de Productos"),
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
          const Text ("Producto Eliminado",style: const TextStyle(fontSize: 18,color: Colors.white,),),
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
                
                Navigator.pushNamedAndRemoveUntil(context,"/Carrito",(Route <dynamic> route) => false);
          }, 
          child: const Text("Regresar"),
          ),
        ]),

        ),
    );

  }
 @override
  void initState(){
  print("Id remove ${widget.index}");
  super.initState();
      /*Modificar*/
       obtenerProductos(widget.IDProd,widget.IDProd).then((value){

    setState(() {
          data.addAll(value);
    });
  });
  }




}


