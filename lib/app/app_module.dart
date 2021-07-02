import 'package:covid19/controllers/home_controller.dart';
import 'package:covid19/pages/home_page.dart';
import 'package:covid19/pages/splash_page.dart';
import 'package:covid19/repositories/covid_api_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => CovidApiRepository()),
        Bind.singleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const SplashPage()),
        ChildRoute("/home", child: (_, args) => const HomePage()),
      ];
}
