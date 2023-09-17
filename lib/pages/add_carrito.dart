
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'datos_productos.dart';


class AddCarrito extends StatefulWidget {
  int IDProd,index;
  AddCarrito (this.IDProd, this.index, {super.key});


  @override
 State<AddCarrito> createState() => _AddCarrito();

}




class _AddCarrito extends State<AddCarrito> {


  List <Datos_Productos> data = List <Datos_Productos>.empty (growable:true);

  Future <List <Datos_Productos>> obtenerProductos (int idprod,int idclie) async {


      var url= Uri.http("dtai.uteq.edu.mx","~rafher207/DAPPS/addCarrito.php");
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
       obtenerProductos(widget.IDProd,widget.IDProd).then((value){

    setState(() {
          data.addAll(value);
    });
  });
  }




}


