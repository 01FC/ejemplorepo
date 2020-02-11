import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  // recibe un string de parametro
  final String textoRecibido;
  TextEditingController _textController = TextEditingController();

  SecondPage({Key key, this.textoRecibido}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla 2"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                controller: _textController,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "Ingrese palabra",
                  hintText: "Palabra",
                ),
              ),
            ),
            MaterialButton(
              child: Text("Back"),
              onPressed: () {
                // regresamos datos
                Navigator.of(context)
                    .pop(textoRecibido + " " + _textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
