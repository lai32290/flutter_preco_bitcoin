import 'package:flutter/material.dart';
import 'package:preco_bitcoin/PrecoBitcoin.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preço Bitcoin',
      home: PrecoBitcoin()
    )
  );
}

