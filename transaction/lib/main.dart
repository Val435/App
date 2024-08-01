import 'package:flutter/material.dart';
import 'package:transaction/screens/activity/transactions.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: const Transaction(), // Establece Transaction como la pantalla de inicio
    );
  }
}

 

  


  


