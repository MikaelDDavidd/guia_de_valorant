import 'dart:async';

import 'package:valorant_guide/data/sharedpref/shared_preference_helper.dart';
import 'package:valorant_guide/models/agents/agent.dart';
import 'package:valorant_guide/models/maps/map.dart';
import 'package:valorant_guide/models/weapons/weapon.dart';

import 'package:sembast/sembast.dart';

import 'local/constants/db_constants.dart';
import 'network/apis/posts/post_api.dart';

class Repository {
  // data source object

  // api objects
  final PostApi _postApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(
    this._postApi,
    this._sharedPrefsHelper,
  );

  // Agents: ---------------------------------------------------------------------
  Future<Agent> getAgents() async {
    // check to see if agents are present in database, then fetch from database
    // else make a network call to get all agents, store them into database for
    // later use
    return await _postApi.getAgents().then((agentList) {
      return agentList;
    }).catchError((error) => throw error);
  }

  // Weapons: ---------------------------------------------------------------------
  Future<Weapons> getWeapons() async {
    // check to see if weapons are present in database, then fetch from database
    // else make a network call to get all weapons, store them into database for
    // later use
    return await _postApi.getWeapons().then((weaponList) {
      return weaponList;
    }).catchError((error) => throw error);
  }

  // Maps: ---------------------------------------------------------------------
  Future<Maps> getMaps() async {
    // check to see if maps are present in database, then fetch from database
    // else make a network call to get all maps, store them into database for
    // later use
    return await _postApi.getMaps().then((mapList) {
      return mapList;
    }).catchError((error) => throw error);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> login(String email, String password) async {
    return await Future.delayed(Duration(seconds: 2), () => true);
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}
