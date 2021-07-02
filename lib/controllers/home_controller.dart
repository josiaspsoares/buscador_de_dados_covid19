import 'package:covid19/models/country_model.dart';
import 'package:covid19/models/world_model.dart';
import 'package:covid19/repositories/covid_api_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Modular.get<CovidApiRepository>();

  _HomeControllerBase() {
    getWorldData();
    getCountryData();
  }

  @observable
  int currentIndex = 0;

  @observable
  TextEditingController textFieldController = TextEditingController();

  @observable
  WorldModel? world;

  @observable
  CountryModel? country;

  @action
  getWorldData() async {
    world = await api.getWorldData();
  }

  @action
  getCountryData({String countryName = 'brazil'}) async {
    country = await api.getCountryData(country: countryName);
  }

  @action
  changePage(int index) {
    currentIndex = index;
  }
}
