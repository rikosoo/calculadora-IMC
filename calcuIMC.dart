import 'package:flutter/material.dart';

class ImcCalculator extends StatefulWidget {
  @override
  _ImcCalculatorState createState() => _ImcCalculatorState();
}

class _ImcCalculatorState extends State<ImcCalculator> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double _imc = 0.0;
  String _category = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (m)',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calculateImc,
                child: Text('Calcular IMC'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Seu IMC é $_imc',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Categoria: $_category',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateImc() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text);
    double imc = weight / (height * height);

    setState(() {
      _imc = imc;

      if (imc < 16.0) {
        _category = 'Magreza grave';
      } else if (imc < 17.0) {
        _category = 'Magreza moderada';
      } else if (imc < 18.5) {
        _category = 'Magreza leve';
      } else if (imc < 25.0) {
        _category = 'Saudável';
      } else if (imc < 30.0) {
        _category = 'Sobrepeso';
      } else if (imc < 35.0) {
        _category = 'Obesidade grau 1';
      } else if (imc < 40.0) {
        _category = 'Obesidade grau 2';
      } else {
        _category = 'Obesidade grau 3';
      }
    });
  }
}
