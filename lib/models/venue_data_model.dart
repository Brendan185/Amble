class VenueDataModel {
  String? type;
  List<Features>? features;

  VenueDataModel({this.type, this.features});

  VenueDataModel.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["features"] is List) {
      features = json["features"] == null
          ? null
          : (json["features"] as List)
              .map((e) => Features.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    if (features != null) {
      data["features"] = features!.map((e) => e.toJson()).toList();
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
      geometry =
          json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]);
    }
    if (json["properties"] is Map) {
      properties = json["properties"] == null
          ? null
          : Properties.fromJson(json["properties"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    data["id"] = id;
    if (geometry != null) {
      data["geometry"] = geometry!.toJson();
    }
    if (properties != null) {
      data["properties"] = properties!.toJson();
    }
    return data;
  }
}

class Properties {
  int? objectid;
  String? name;
  String? streetnumber;
  String? street;
  String? streetextra;
  String? suburb;
  int? postcode;

  Properties(
      {this.objectid,
      this.name,
      this.streetnumber,
      this.street,
      this.streetextra,
      this.suburb,
      this.postcode});

  Properties.fromJson(Map<String, dynamic> json) {
    if (json["OBJECTID"] is int) {
      objectid = json["OBJECTID"];
    }
    if (json["Name"] is String) {
      name = json["Name"];
    }
    if (json["Streetnumber"] is String) {
      streetnumber = json["Streetnumber"];
    }
    if (json["Street"] is String) {
      street = json["Street"];
    }
    if (json["Streetextra"] is String) {
      streetextra = json["Streetextra"];
    }
    if (json["Suburb"] is String) {
      suburb = json["Suburb"];
    }
    if (json["Postcode"] is int) {
      postcode = json["Postcode"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["OBJECTID"] = objectid;
    data["Name"] = name;
    data["Streetnumber"] = streetnumber;
    data["Street"] = street;
    data["Streetextra"] = streetextra;
    data["Suburb"] = suburb;
    data["Postcode"] = postcode;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["coordinates"] is List) {
      coordinates = json["coordinates"] == null
          ? null
          : List<double>.from(json["coordinates"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    if (coordinates != null) {
      data["coordinates"] = coordinates;
    }
    return data;
  }
}
