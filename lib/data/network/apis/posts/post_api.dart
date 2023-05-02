import 'dart:async';

import 'package:valorant_guide/data/network/constants/endpoints.dart';
import 'package:valorant_guide/data/network/dio_client.dart';
import 'package:valorant_guide/data/network/rest_client.dart';
import 'package:valorant_guide/models/agents/agent.dart';
import '../../../../models/maps/map.dart';
import '../../../../models/weapons/weapon.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  PostApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<Agent> getAgents() async {
    try {
      final res = await _dioClient.get(Endpoints.agents);
      return Agent.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<Maps> getMaps() async {
    try {
      final res = await _dioClient.get(Endpoints.maps);
      return Maps.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<Weapons> getWeapons() async {
    try {
      final res = await _dioClient.get(Endpoints.weapons);
      return Weapons.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }
}
