import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double imc = 0.00;
  String valorImc = '';
  double altura = 0.00;
  double peso = 0.00;

  String classifica = '';
  TextEditingController controlaPeso = TextEditingController();
  TextEditingController controlaAltura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 224, 255),
        appBar: AppBar(
          title: const Center(
              child: Text(
            '   Calculadora de IMC\nIndice de massa corporal',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          )),
          backgroundColor: const Color.fromRGBO(102, 80, 163, 1.0),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    '--> INFORME SEUS DADOS <-- \n   PARA CALCULAR O SEU IMC',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(102, 80, 163, 1.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: controlaPeso,
                  decoration: InputDecoration(
                    labelText: 'Peso:',
                    helperText: 'peso em kg - Ex: 75.500',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controlaAltura,
                  decoration: InputDecoration(
                    labelText: 'Altura:',
                    helperText: 'altura em metros - Ex: 1.80',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          if (controlaPeso.text.isNotEmpty) {
                            peso = double.parse(controlaPeso.text);
                          }
                          if (controlaAltura.text.isNotEmpty) {
                            altura = double.parse(controlaAltura.text);
                          }
                          imc = peso / (altura * altura);
                          valorImc = imc.toStringAsFixed(2);

                          //CLASSIFICAÇÃO
                          if (imc < 18.5) {
                            classifica = 'ABAIXO DO PESO';
                          } else if (imc >= 18.5 && imc < 25) {
                            classifica = 'PESO NORMAL';
                          } else if (imc >= 25 && imc < 30) {
                            classifica = 'SOBREPESO';
                          } else if (imc >= 30 && imc < 35) {
                            classifica = 'OBESIDADE GRAU I';
                          } else if (imc >= 35 && imc < 40) {
                            classifica = 'OBESIDADE GRAU II';
                          } else if (imc >= 40) {
                            classifica = 'OBESIDADE GRAU III';
                          } else {
                            classifica = 'ERRO AO CALCULAR!';
                          }
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(102, 80, 163, 1.0),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Calcular'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          controlaAltura.text = '';
                          controlaPeso.text = '';
                          imc = 0.00;
                          valorImc = '';
                          altura = 0.00;
                          peso = 0.00;
                          classifica = '';
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(102, 80, 163, 1.0),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Limpar'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.0,
                        color: const Color.fromRGBO(102, 80, 163, 1.0)),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'IMC:',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(valorImc,
                            style: const TextStyle(
                              color: Color.fromRGBO(102, 80, 163, 1.0),
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              backgroundColor:
                                  Color.fromRGBO(102, 80, 163, 0.2),
                            )),
                        const Text(
                          '-------------------------------------',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              const Text(
                                'CLASSIFICAÇÃO:',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                classifica,
                                style: const TextStyle(
                                  color: Color.fromRGBO(102, 80, 163, 1.0),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor:
                                      Color.fromRGBO(102, 80, 163, 0.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
