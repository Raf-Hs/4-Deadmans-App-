import 'dart:convert';
import 'package:Deadmans/pages/registro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Deadmans/pages/catalogo.dart';


Future <bool> login (String correo,String pass) async{

var url= Uri.http("dtai.uteq.edu.mx","~rafher207/DAPPS/ws_login.php");
var map = <String, dynamic>{};
map ['apikey'] = '123';
map ['usu'] = correo;
map ['pass'] = pass;

  http.Response response = await http.post(
      url,
      body: map,


  );
      
       print(response.statusCode);
        print(response.body);
       List<dynamic> data = jsonDecode(response.body);
      if (response.statusCode ==200){

        return true;
      }
        else{
              return false;
        }
}


Future <void> _dialogError (BuildContext context){

    return showDialog<void>(
      context: context,
      builder: (BuildContext context){

          return AlertDialog(

              title: const Text ('Error'),
              content: const Text ('Error, Usuario o contraseña incorrectos'),
              actions:<Widget> [

                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                  child: const Text('Ok'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  )
              ],
          );
      },
      );
}











void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        "/SegundaPagina": (context) => SegundaPagina(),
      },
      //home:  ,
    );
  }
}

class Login extends StatefulWidget{
 @override
State<Login> createState() => _LoginState();

}


class _LoginState extends State <Login>{

  Future <bool?>showToast(){
    return Fluttertoast.showToast(
      msg:'Bienvenido',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
      fontSize: 16,
    );
  }



final TextEditingController _correo = TextEditingController();
final TextEditingController _contra = TextEditingController();

 @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: Center(
        
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


 const Icon(
                color: Colors.brown,
                Icons.book_rounded,
                size: 125,
              ),

              const SizedBox(height: 20),


Text(
                'DEADMANSTALES',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 42,
                ),
              ),

  const SizedBox(

                  height: 5,


              ),



            Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    
                    controller: _correo,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Ingresa tu correo por favor',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                         validator: (String? value){
                if (value == null || value.isEmpty){

                    return 'Ingresa texto por favor';

                }
                return null;
              },
                  ),

                  
                ),
              const SizedBox(

                  height: 5,


              ),
             Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    
                    controller: _contra,
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Ingresa tu contraseña',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                         validator: (String? value){
                if (value == null || value.isEmpty){

                    return 'Ingresa texto por favor';

                }
                return null;
              },
                  ),

                  
                ),



            

              const SizedBox(

                  height: 20,


              ),

              ElevatedButton(
                
                onPressed: 
                () async {

                    if (await login(_correo.text, _contra.text)){

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SegundaPagina()),(Route <dynamic> route) => false);
                            showToast() ;
                            var snackBar = const SnackBar(content: Text('Bienvenido'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }else{
                      _dialogError(context);
                       showToast() ;
                            var snackBar = const SnackBar(content: Text('Error, usuario o contraseña no validos'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    
                    setState((){});

                    //Navigator.pushNamed(context,"/SegundaPagina");

                },
                 child: const Text('Iniciar Sesion'),
                 
                ),



 const SizedBox(

                  height: 10,


              ),
                ElevatedButton(
                onPressed: 
                ()  {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registro()));
                            
                      
                },
                 child: const Text('Registrate'),
                ),

          ],
        ),
      ),
  
    );
  }

}
