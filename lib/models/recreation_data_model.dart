class RecreationDataModel {
  String? type;
  List<Features>? features;

  RecreationDataModel({this.type, this.features});

  RecreationDataModel.fromJson(Map<String, dynamic> json) {
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
  String? address;
  String? address2;
  String? suburb;
  int? postcode;
  String? phoneNumber;
  String? url;
  String? openingHours;
  double? lat;
  double? long;

  Properties(
      {this.objectid,
      this.name,
      this.address,
      this.address2,
      this.suburb,
      this.postcode,
      this.phoneNumber,
      this.url,
      this.openingHours,
      this.lat,
      this.long});

  Properties.fromJson(Map<String, dynamic> json) {
    if (json["OBJECTID"] is int) {
      objectid = json["OBJECTID"];
    }
    if (json["Name"] is String) {
      name = json["Name"];
    }
    if (json["Address"] is String) {
      address = json["Address"];
    }
    if (json["Address2"] is String) {
      address2 = json["Address2"];
    }
    if (json["Suburb"] is String) {
      suburb = json["Suburb"];
    }
    if (json["Postcode"] is int) {
      postcode = json["Postcode"];
    }
    if (json["PhoneNumber"] is String) {
      phoneNumber = json["PhoneNumber"];
    }
    if (json["URL"] is String) {
      url = json["URL"];
    }
    if (json["OpeningHours"] is String) {
      openingHours = json["OpeningHours"];
    }
    if (json["Lat"] is double) {
      lat = json["Lat"];
    }
    if (json["Long"] is double) {
      long = json["Long"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["OBJECTID"] = objectid;
    data["Name"] = name;
    data["Address"] = address;
    data["Address2"] = address2;
    data["Suburb"] = suburb;
    data["Postcode"] = postcode;
    data["PhoneNumber"] = phoneNumber;
    data["URL"] = url;
    data["OpeningHours"] = openingHours;
    data["Lat"] = lat;
    data["Long"] = long;
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
