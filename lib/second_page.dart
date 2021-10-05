import 'package:flutter/material.dart';
import 'package:imc_app/custom_dialog.dart';

import 'pessoa_imc.dart';

class SecondPage extends StatelessWidget {
  final List<PessoaImc> values;
  const SecondPage({Key? key, required this.values}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imcs'),
      ),
      body: ListView.builder(
          itemCount: values.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(values[index].peso.toString()),
                subtitle: Text(values[index].altura.toString()),
                leading: Icon(Icons.accessibility),
                trailing: Icon(Icons.ac_unit),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    side: BorderSide(width: 5, color: Colors.green)),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AdvanceCustomAlert(
                          title:
                              'Imc: ' + values[index].calculaImc().toString(),
                          message: values[index].indicaSituacao(),
                        );
                      });
                },
              ),
            );
          }),
    );
  }
}
