import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:projeto_flutter/_common/my_colors.dart';
import 'package:projeto_flutter/components/decoration_field_authentication.dart';
import 'package:projeto_flutter/services/authentication.service.dart';
import 'package:projeto_flutter/telas/despesas.dart';
import 'package:projeto_flutter/telas/home.dart';

class ReceitasScreen extends StatefulWidget {
  const ReceitasScreen({super.key});

  @override
  State<ReceitasScreen> createState() => _ReceitasScreenState();
}

class _ReceitasScreenState extends State<ReceitasScreen> {
  final TextEditingController _receitasNomeController = TextEditingController();
  final TextEditingController _receitasValorController = TextEditingController();
  final TextEditingController _receitasCategoriaController = TextEditingController();

  final List<Map<String, String>> _enteredValues = [];

  bool _isExpanded = false;
  String _selectedCategory = 'Categorias';

  String formatCurrency(String value) {
    final formatCurrency = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    value = value.replaceAll("R\$", "").replaceAll(",", ".");
    double parsedValue = double.parse(value);
    String formattedValue = formatCurrency.format(parsedValue);
    return formattedValue;

  }

  void _handleExpansion(bool isExpanded) {
    setState(() {
      _isExpanded = isExpanded;
    });
  }

  void _addValue() {
    setState(
      () {
        _enteredValues.add({
          'nome': _receitasNomeController.text,
          'valor': _receitasValorController.text,
          'categoria': _receitasCategoriaController.text,
        });
        _receitasNomeController.clear();
        _receitasValorController.clear();
        _receitasCategoriaController.clear();
      },
    );
  }

  void _removeValue(int index) {
    setState(() {
      _enteredValues.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receitas"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                MyColors.greenBottomGradient,
                MyColors.blackTopGradient
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.money_off),
              title: const Text("Despesas"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DespesasScreen()));
              },
            ),
            const Divider(color: MyColors.blackTopGradient),
            ListTile(
              iconColor: Colors.red,
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                AuthenticationService().logout();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: getAuthenticationInputDecoration("Nome"),
                    controller: _receitasNomeController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: getAuthenticationInputDecoration("Valor"),
                    controller: _receitasValorController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (newValue.text.isEmpty) {
                          return newValue.copyWith(text: '');
                        }
                        final number =
                            int.tryParse(newValue.text.replaceAll('.', ''));
                        if (number == null) {
                          return oldValue;
                        }
                        final formattedNumber = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(number / 100);
                        return newValue.copyWith(
                          text: formattedNumber,
                          selection: TextSelection.collapsed(
                              offset: formattedNumber.length),
                        );
                      }),
                    ],
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um valor.';
                      }
                      if (value.contains(RegExp(r'[A-Z,a-z]'))) {
                        return 'Por favor, insira apenas números.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ExpansionPanelList(
                      elevation: 0,
                      expansionCallback: (int index, bool isExpanded) {
                        _handleExpansion(isExpanded);
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(_selectedCategory),
                            );
                          },
                          body: Column(
                            children: <Widget>[
                              _buildCategoryItem("Investimento"),
                              _buildCategoryItem("Salário"),
                            ],
                          ),
                          isExpanded: _isExpanded,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _addValue,
                    child: const Text('Adicionar à Lista'),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                      _enteredValues.length,
                      (index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.green,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _enteredValues[index]["nome"]!,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          _enteredValues[index]["valor"]!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          _enteredValues[index]["categoria"]!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(255, 4, 77, 7),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  _removeValue(index);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String categoryName) {
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: 4), // Espaçamento vertical menor
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(width: 1.0, color: Colors.black),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        onTap: () {
          _receitasCategoriaController.text = categoryName;
          _selectedCategory = categoryName;
          _handleExpansion(false);
        },
      ),
    );
  }
}
