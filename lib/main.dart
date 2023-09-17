
import 'package:Deadmans/pages/carrito.dart';
import 'package:Deadmans/pages/deseos.dart';
import 'package:Deadmans/pages/login.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Deadmans/pages/catalogo.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deadmans',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        "/SegundaPagina": (context) => SegundaPagina(),
        "/Carrito": (context) => Carrito(),
         "/Deseos": (context) => Deseos(),
         
      },
      //home:  ,
    );
  }
}

