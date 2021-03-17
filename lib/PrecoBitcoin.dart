import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

class PrecoBitcoin extends StatefulWidget {
  @override
  _PrecoBitcoinState createState() => _PrecoBitcoinState();
}

class _PrecoBitcoinState extends State<PrecoBitcoin> {
  double _price = 0;

  void _getPrice() async {
    Http.Response response = await Http.get(Uri.parse('https://blockchain.info/ticker'));
    Map<String, dynamic> result = json.decode(response.body);
    setState(() {
      _price = result['BRL']['buy'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(36),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/bitcoin.png'),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'R\$ ${_price.toString()}',
                  style: TextStyle(
                    fontSize: 30,
                  )
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text('Atualizar')
                ),
                onPressed: _getPrice
              )
            ]
          )
        )
      )
    );
  }
}
