class PlaygroundDataModel {
  String? type;
  List<Features>? features;

  PlaygroundDataModel({required this.type, required this.features});

  PlaygroundDataModel.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["features"] is List) {
      features = (json["features"] == null
          ? null
          : (json["features"] as List)
              .map((e) => Features.fromJson(e))
              .toList())!;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    if (features != null) {
      data["features"] = features?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String? type;
  int? id;
  Geometry? geometry;
  Properties? properties;
  double? distance = 0.0;

  Features({this.type, this.id, this.geometry, this.properties});

  Features.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["geometry"] is Map) {
      geometry = (json["geometry"] == null
          ? null
          : Geometry.fromJson(json["geometry"]))!;
    }
    if (json["properties"] is Map) {
      properties = (json["properties"] == null
          ? null
          : Properties.fromJson(json["properties"]))!;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    data["id"] = id;
    if (geometry != null) {
      data["geometry"] = geometry?.toJson();
    }
    data["properties"] = properties?.toJson();
    return data;
  }
}

class Properties {
  int? objectid;
  String? name;
  String? type;

  Properties({required this.objectid, required this.name, required this.type});

  Properties.fromJson(Map<String, dynamic> json) {
    if (json["OBJECTID"] is int) {
      objectid = json["OBJECTID"];
    }
    if (json["Name"] is String) {
      name = json["Name"];
    }
    if (json["Type"] is String) {
      type = json["Type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["OBJECTID"] = objectid;
    data["Name"] = name;
    data["Type"] = type;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({required this.type, required this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["coordinates"] is List) {
      coordinates = (json["coordinates"] == null
          ? null
          : List<double>.from(json["coordinates"]))!;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    data["coordinates"] = coordinates;
    return data;
  }
}
