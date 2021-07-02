import 'package:covid19/controllers/home_controller.dart';
import 'package:covid19/pages/splash_page.dart';
import 'package:covid19/pages/widgets/information_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final TextStyle whiteText = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: (controller.world != null && controller.country != null)
            ? _buildBody()
            : const SplashPage(),
        bottomNavigationBar: _buildBottomBar(),
      );
    });
  }

  Widget _buildBody() {
    return (controller.currentIndex == 0)
        ? _buildBodyWorld()
        : _buildBodyCountry();
  }

  Widget _buildBodyWorld() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBar(
            title: const Text("A COVID-19 NO MUNDO"),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          const SizedBox(height: 20.0),
          InformationCardWidget(
              color: Colors.blue,
              icon: Icons.flag,
              title: "Países Afetados",
              data: controller.world!.affectedCountries.toString()),
          const SizedBox(height: 16.0),
          InformationCardWidget(
              color: Colors.brown,
              icon: Icons.person_outline,
              title: "Total de Infectados",
              data: controller.world!.cases.toString()),
          const SizedBox(height: 16.0),
          InformationCardWidget(
              color: Colors.red,
              icon: Icons.person_pin,
              title: "Mortes",
              data: controller.world!.deaths.toString()),
          const SizedBox(height: 16.0),
          InformationCardWidget(
              color: Colors.green,
              icon: Icons.person_add,
              title: "Recuperados",
              data: controller.world!.recovered.toString()),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dados atualizados em ${controller.world!.updated!.day}/${controller.world!.updated!.month}/${controller.world!.updated!.year} às ${controller.world!.updated!.hour}:${controller.world!.updated!.minute}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBodyCountry() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBar(
            title: Text(controller.country!.country.toUpperCase()),
            centerTitle: true,
            backgroundColor: Colors.teal,
            actions: [
              IconButton(
                  onPressed: () {
                    _displayDialog(context);
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
          const SizedBox(height: 20.0),
          Center(
              child: Image.network(
            controller.country!.urlFlag,
            width: 200,
          )),
          const SizedBox(height: 20.0),
          InformationCardWidget(
              color: Colors.brown,
              icon: Icons.person_outline,
              title: "Total de Infectados",
              data: controller.country!.cases.toString()),
          const SizedBox(height: 16.0),
          InformationCardWidget(
              color: Colors.red,
              icon: Icons.person_pin,
              title: "Mortes",
              data: controller.country!.deaths.toString()),
          const SizedBox(height: 16.0),
          InformationCardWidget(
              color: Colors.green,
              icon: Icons.person_add,
              title: "Recuperados",
              data: controller.country!.recovered.toString()),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.grey.shade800,
      unselectedItemColor: Colors.grey,
      currentIndex: controller.currentIndex,
      onTap: controller.changePage,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.group_work),
          label: "Mundo",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag),
          label: "País",
        ),
      ],
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('MUDAR DE PAÍS'),
            content: TextField(
              controller: controller.textFieldController,
              decoration:
                  const InputDecoration(hintText: "Informe o nome em inglês"),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  controller.getCountryData(
                      countryName:
                          controller.textFieldController.text.toString());
                  Modular.to.pop();
                },
                child: const Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF1BC0C5))),
              ),
              TextButton(
                child: const Text('CANCELAR'),
                onPressed: () {
                  Modular.to.pop();
                },
              )
            ],
          );
        });
  }
}
