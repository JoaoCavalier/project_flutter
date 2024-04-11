import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/services/authentication.service.dart';
import 'package:projeto_flutter/telas/despesas.dart';
import 'package:projeto_flutter/telas/receitas.dart';
import 'package:projeto_flutter/_common/my_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Inicial"),
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
      // body: new charts.LineChart(seriesList()),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.attach_money_sharp),
              title: const Text("Receitas"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReceitasScreen()));
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 500,
            height: 500,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 60,
                sections: [
                  PieChartSectionData(
                      value: 30, color: Colors.red, title: 'Despesas'),
                  PieChartSectionData(
                      value: 70, color: Colors.green, title: 'Receitas')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
