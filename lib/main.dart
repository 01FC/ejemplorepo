import 'package:act_routes/route_generator.dart';
import 'package:act_routes/second_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruteo',
      //initialRoute: "/",
      home: PageOne(),
      // onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class PageOne extends StatefulWidget {
  PageOne({
    Key key,
  }) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String _callBackParams;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("$_callBackParams"),
            Container(
              child: MaterialButton(
                child: Text(
                  "Next page",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () {
                  //_openSecondPage(context);
                  _showAlertDialog();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _textController = TextEditingController();

        return AlertDialog(
          title: Text("Add data"),
          content: TextField(
            controller: _textController,
            maxLength: 10,
            decoration: InputDecoration(
              labelText: "Ingrese palabra",
              hintText: "Palabra",
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              child: Text("Siguiente"),
              onPressed: () async {
                // Navigator.of(context).pop();
                // await Navigator.of(context)
                //     .pushNamed(
                //   "/secondPage",
                //   arguments: _textController.text,
                // )
                //     .then(
                //   (response) {
                //     _callBackParams = response;
                //   },
                // );
                Navigator.of(context).pop();
                await Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (_) => SecondPage(
                      texto: _textController.text,
                    ),
                  ),
                )
                    .then(
                  (response) {
                    _callBackParams = response;
                  },
                );
              },
            ),
            RaisedButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
