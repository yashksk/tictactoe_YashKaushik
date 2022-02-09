import 'package:flutter/material.dart';

import 'algo.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title:"Tic Tac Toe Game",
    home: Scaffold(
      appBar: AppBar(title: Text("Tic Tac Toe")),
      body: Button()
    )
  ));
}