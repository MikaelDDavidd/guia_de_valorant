class Skin {
  final String uuid;
  final String displayName;
  final String displayIcon;
  final String assetPath;
  final String chromas;

  Skin({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
    required this.assetPath,
    required this.chromas,
  });

  factory Skin.fromJson(Map<String, dynamic> json) {
    return Skin(
      uuid: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
      assetPath: json['assetPath'],
      chromas: json['chromas'],
    );
  }
}
