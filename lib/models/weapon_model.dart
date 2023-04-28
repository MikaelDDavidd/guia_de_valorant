class Weapon {
  final String uuid;
  final String displayName;
  final String category;
  final String defaultSkinUuid;
  final String displayIcon;
  final String killStreamIcon;
  final String assetPath;

  Weapon({
    required this.uuid,
    required this.displayName,
    required this.category,
    required this.defaultSkinUuid,
    required this.displayIcon,
    required this.killStreamIcon,
    required this.assetPath,
  });

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
      uuid: json['uuid'],
      displayName: json['displayName'],
      category: json['category'],
      defaultSkinUuid: json['defaultSkinUuid'],
      displayIcon: json['displayIcon'],
      killStreamIcon: json['killStreamIcon'],
      assetPath: json['assetPath'],
    );
  }
}
