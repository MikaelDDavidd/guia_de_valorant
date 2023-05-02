class Maps {
  Maps({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<MapsData> data;

  Maps.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => MapsData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class MapsData {
  MapsData({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
    required this.displayIcon,
  });
  late final String uuid;
  late final String displayName;
  late final String coordinates;
  late final String displayIcon;

  MapsData.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    coordinates = json['coordinates '];
    displayIcon = json['dispayIcon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['displayName'] = displayName;
    _data['coordinates '] = coordinates;
    _data['displayIcon '] = displayIcon;
    return _data;
  }
}
