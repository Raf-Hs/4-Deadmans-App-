
import 'package:Deadmans/pages/add_deseos.dart';
import 'package:Deadmans/pages/carrito.dart';
import 'package:Deadmans/pages/deseos.dart';
import 'package:Deadmans/pages/historial.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'datos_productos.dart';
import 'datos_cliente.dart';
import 'add_carrito.dart';
import 'login.dart';

class SegundaPagina extends StatefulWidget {

  @override
 State<SegundaPagina> createState() => _HomeState();

}




class _HomeState extends State<SegundaPagina> {

    

 

  List <Datos_Productos> data = List <Datos_Productos>.empty (growable:true);

  Future <List <Datos_Productos>> obtenerProductos () async {

      var url= Uri.http("dtai.uteq.edu.mx","~rafher207/DAPPS/Catalogo.php");
      var map = <String, dynamic>{};
      map ['apikey'] = '123';
     
      var response = 
      await http.post(url,body: map).timeout(const Duration(seconds: 90));

      var datos = jsonDecode(response.body);


      var registros = List <Datos_Productos>.empty(growable: true);


      for (datos in datos){
        registros.add(Datos_Productos.fromJson(datos));
      }

      return registros;


    
  }



  List <Datos_Cliente> data1 = List <Datos_Cliente>.empty (growable:true);

  Future <List <Datos_Cliente>> obtenerCliente () async {

      var url= Uri.http("dtai.uteq.edu.mx","~rafher207/DAPPS/pagina.php");
      var map = <String, dynamic>{};
      map ['apikey'] = '123';
     
      var response = 
      await http.post(url,body: map).timeout(const Duration(seconds: 90));

      var datos = jsonDecode(response.body);


      var registros1 = List <Datos_Cliente>.empty(growable: true);


      for (datos in datos){
        registros1.add(Datos_Cliente.fromJson(datos));
      }

      return registros1;


    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogo"),
        
        
      ),


 floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Carrito();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
    





      // body: _paginas[_paginaActual],
      backgroundColor: Colors.brown[400],
      body: Column(children:<Widget> [
           const SizedBox(

                  height: 20,


              ),
         Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          
                        
                         ElevatedButton(
                onPressed: 
                ()  {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Historial()));
                            
                      
                },
                 child: const Text('Historial'),
                ),
                

            const SizedBox(

                  height: 20,


              ),


                         ElevatedButton(
                onPressed: 
                ()  {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Deseos()));
                            
                      
                },
                 child: const Text('Deseos'),
                ),

  const SizedBox(

                  height: 20,


              ),


 ElevatedButton(
                onPressed: 
                ()  {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login()),(Route <dynamic> route) => false);
                            
                      
                },
                 child: const Text('Cerrar Sesion'),
                ),
                         
                        ],
               ),
         
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index,){
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
                             "Existencias: ""${data[index].Existencias}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                            ),
                             
                           

             
                            
                         
                        ],
                        
               ),
                Row(
                        children: [
                        
                            Text(
                             "Precio: \$ ""${data[index].Precio}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                            ),
                              IconButton (
                              icon: Image.asset(
                                'carrito.png',
                                height: 25,
                              ),
                              iconSize: 50,
                              onPressed: (){
                               
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddCarrito(
                                      int.parse(data[index].IDProd),
                                      
                                      index)));
                              },
                            ),
                           
                           IconButton (
                              icon: Image.asset(
                                'heart.png',
                                height: 25,
                              ),
                              iconSize: 50,
                              onPressed: (){
                               
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddDeseos(
                                      int.parse(data[index].IDProd),
                                      
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
       obtenerProductos().then((value){

    setState(() {
          data.addAll(value);
    });
  });
  }

}


