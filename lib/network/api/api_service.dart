import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> getAgents() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
      return json.decode(response.body)['data'];
    } catch (error) {
      throw Exception("Failed to load agents");
    }
  }

  Future<List<dynamic>> getMaps() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://valorant-api.com/v1/maps"));
      return json.decode(response.body)['data'];
    } catch (error) {
      throw Exception("Failed to load maps");
    }
  }

  Future<List<dynamic>> getWeapons() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://valorant-api.com/v1/weapons"));
      return json.decode(response.body)['data'];
    } catch (error) {
      throw Exception("Failed to load weapons");
    }
  }

  Future<List<dynamic>> getWeaponSkins(String weaponName) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://valorant-api.com/v1/weapons/skins?weaponName=$weaponName"));
      return json.decode(response.body)['data'];
    } catch (error) {
      throw Exception("Failed to load weapon skins");
    }
  }
}
