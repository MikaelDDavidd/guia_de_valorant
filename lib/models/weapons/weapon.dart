class Weapons {
  Weapons({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<WeaponsData> data;

  Weapons.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => WeaponsData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class WeaponsData {
  WeaponsData({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
  });
  late final String uuid;
  late final String displayName;
  late final String coordinates;

  WeaponsData.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    coordinates = json['coordinates '];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['displayName'] = displayName;
    _data['coordinates '] = coordinates;
    return _data;
  }
}
