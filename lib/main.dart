import 'package:flutter/material.dart';

void main() => runApp(const CalcularMedia());

class CalcularMedia extends StatelessWidget {
  const CalcularMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora de Média Notas',
      home: CalMedia(),
    );
  }
}

class CalMedia extends StatefulWidget {
  const CalMedia({Key? key}) : super(key: key);

  @override
  createState() => _CalMediaState();
}

class _CalMediaState extends State<CalMedia> {
  var media = "";

  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nota_1 = TextEditingController();
  TextEditingController nota_2 = TextEditingController();
  TextEditingController nota_3 = TextEditingController();

  @override
  Widget build(BuildContext formContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcular Média Notas"),
      ),
      body: Column(
        children: <Widget>[
          txtField(nome, "Nome", "Digite o Nome", TextInputType.name),
          txtField(email, "Email", "Digite o Email", TextInputType.emailAddress),
          notas(),
          btnCalcular(),
          resultados(nome.text, email.text, nota_1.text + " - " + nota_2.text + " - " + nota_3.text, media),
          btnLimparCampos(),
        ],
      ),
    );
  }

  /// Calcula a média dos notas
  String calculaMedia() {
    double soma = 0.0;
    double media = 0.0;
    double nota1 = double.parse(nota_1.text);
    double nota2 = double.parse(nota_2.text);
    double nota3 = double.parse(nota_3.text);

    soma = nota1 + nota2 + nota3;

    if (soma > 0) {
      media = soma / 3;
    }
    return media.toStringAsFixed(1);
  }

  Widget txtField(TextEditingController controller, String titulo, String hint,
      TextInputType tiType) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: titulo,
          hintText: hint,
          labelStyle: Theme.of(context).textTheme.bodyText2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        keyboardType: tiType,
      ),
    );
  }

  /// Campos para receber as notas
  Widget notas() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: Row(
        children: <Widget>[

          Expanded(
            child: TextField(
              controller: nota_1,
              decoration: InputDecoration(
                labelText: 'Nota 1',
                labelStyle: Theme.of(context).textTheme.bodyText2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(width: 8),

          Expanded(
            child: TextField(
              controller: nota_2,
              decoration: InputDecoration(
                labelText: 'Nota 2',
                hintText: 'Nota 2',
                labelStyle: Theme.of(context).textTheme.bodyText2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(width: 8),

          Expanded(
            child: TextField(
              controller: nota_3,
              decoration: InputDecoration(
                labelText: 'Nota 3',
                hintText: 'Nota 3',
                labelStyle: Theme.of(context).textTheme.bodyText2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  /// Botão Calcular Média
  Widget btnCalcular() {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: const Text(
                "Calcula Média",
                textScaleFactor: 1.25,
              ),
              onPressed: () {
                setState(
                  () {
                    media = calculaMedia();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Botão Limpar Campos
  Widget btnLimparCampos() {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: const Text(
                "Limpar informações",
                textScaleFactor: 1.25,
              ),
              onPressed: () {
                nome.text = '';
                email.text = '';
                nota_1.text = '';
                nota_2.text = '';
                nota_3.text = '';
                setState(
                  () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Resultados
  Widget resultados(String nome, String email, String notas, String media) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          linhaRes("Resultados: ", ""),
          linhaRes("Nome: ", nome),
          linhaRes("E-mail: ", email),
          linhaRes("Notas: ", notas),
          linhaRes("Média: ", media),
        ],
      ),
    );
  }

  Widget linhaRes(String item, String valor) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(children: <Widget>[
        Expanded(child: Text(item)),
        Flexible(child: Text(valor)),
      ]),
    );
  }
}
