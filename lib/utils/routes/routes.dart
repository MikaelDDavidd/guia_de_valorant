import 'package:flutter/material.dart';
import 'package:guia_de_valorant/pages/agents_screen.dart';
import 'package:guia_de_valorant/pages/aim_assistant_screen.dart';
import 'package:guia_de_valorant/pages/home_page.dart';
import 'package:guia_de_valorant/pages/maps_screen.dart';
import 'package:guia_de_valorant/pages/skins_screen.dart';
import 'package:guia_de_valorant/pages/splash_screen.dart';
import 'package:guia_de_valorant/pages/weapons_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String home = '/home';
  static const String splash = '/splash';
  static const String agents = '/agents';
  static const String weapons = '/weapons';
  static const String maps = '/maps';
  static const String skins = '/skins';
  static const String aim = '/aim';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomePage(),
    splash: (BuildContext context) => const SplashScreen(),
    agents: (BuildContext context) => AgentsScreen(),
    weapons: (BuildContext context) => const WeaponsPage(),
    maps: (BuildContext context) => const MapsPage(),
    skins: (BuildContext context) => const SkinsPage(),
    aim: (BuildContext context) => const AimPage(),
  };
}
