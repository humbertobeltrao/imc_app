import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_app/second_page.dart';

import 'pessoa_imc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          })),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _imc = 0;
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  List<PessoaImc> valores = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                              color: Colors.amber, style: BorderStyle.solid)),
                      hintText: 'Nome'),
                  controller: controllerNome,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                              color: Colors.amber, style: BorderStyle.solid)),
                      hintText: 'Peso'),
                  controller: controllerPeso,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                              color: Colors.amber, style: BorderStyle.solid)),
                      hintText: 'Altura'),
                  controller: controllerAltura,
                  style: TextStyle(fontSize: 20.0),
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  PessoaImc p = PessoaImc(
                      peso: double.parse(controllerPeso.text),
                      altura: double.parse(controllerAltura.text),
                      nome: controllerNome.text);
                  valores.add(p);
                  controllerNome.text = "";
                  controllerPeso.text = "";
                  controllerAltura.text = "";
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondPage(values: valores)));
        },
        child: Icon(Icons.navigate_next_outlined),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
