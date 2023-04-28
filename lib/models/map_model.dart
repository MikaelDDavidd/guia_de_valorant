class Maps {
  final String uuid;
  final String displayName;
  final String filename;
  final String splash;

  Maps({
    required this.uuid,
    required this.displayName,
    required this.filename,
    required this.splash,
  });

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      uuid: json['uuid'],
      displayName: json['displayName'],
      filename: json['filename'],
      splash: json['splash'],
    );
  }
}
