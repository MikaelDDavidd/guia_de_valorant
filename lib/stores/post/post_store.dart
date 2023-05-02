import 'package:valorant_guide/data/repository.dart';
import 'package:valorant_guide/models/agents/agent.dart';
import 'package:valorant_guide/models/weapons/weapon.dart';
import 'package:valorant_guide/models/maps/map.dart';
import 'package:valorant_guide/stores/error/error_store.dart';
import 'package:valorant_guide/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _PostStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<Agent?> emptyAgentResponse =
      ObservableFuture.value(null);
  static ObservableFuture<Weapons?> emptyWeaponsResponse =
      ObservableFuture.value(null);
  static ObservableFuture<Maps?> emptyMapsResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<Agent?> fetchAgentsFuture =
      ObservableFuture<Agent?>(emptyAgentResponse);

  @observable
  ObservableFuture<Weapons?> fetchWeaponsFuture =
      ObservableFuture<Weapons?>(emptyWeaponsResponse);

  @observable
  ObservableFuture<Maps?> fetchMapsFuture =
      ObservableFuture<Maps?>(emptyMapsResponse);

  @observable
  Agent? agentList;

  @observable
  Weapons? weaponList;

  @observable
  Maps? mapList;

  @observable
  bool success = false;

  @computed
  bool get loading =>
      fetchAgentsFuture.status == FutureStatus.pending ||
      fetchWeaponsFuture.status == FutureStatus.pending ||
      fetchMapsFuture.status == FutureStatus.pending;

  @action
  Future<void> getAgents() async {
    final future = _repository.getAgents();
    fetchAgentsFuture = ObservableFuture(future);

    future.then((response) {
      this.agentList = response;
      print(agentList);
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future<void> getWeapons() async {
    final future = _repository.getWeapons();
    fetchWeaponsFuture = ObservableFuture(future);

    future.then((response) {
      this.weaponList = response;
      print(weaponList);
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future<void> getMaps() async {
    final future = _repository.getMaps();
    fetchMapsFuture = ObservableFuture(future);

    future.then((response) {
      this.mapList = response;
      print(mapList);
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
