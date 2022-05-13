// To parse this JSON data, do
//
//     final aziz = azizFromJson(jsonString);

import 'dart:convert';

Demandes azizFromJson(String str) => Demandes.fromJson(json.decode(str));

String azizToJson(Demandes data) => json.encode(data.toJson());

class Demandes {
  Demandes({
    required this.srMboSet,
  });

  SrMboSet srMboSet;

  factory Demandes.fromJson(Map<String, dynamic> json) => Demandes(
        srMboSet: SrMboSet.fromJson(json["SRMboSet"]),
      );

  Map<String, dynamic> toJson() => {
        "SRMboSet": srMboSet.toJson(),
      };
}

class SrMboSet {
  SrMboSet({
    required this.rsStart,
    required this.rsCount,
    required this.sr,
  });

  int rsStart;
  int rsCount;
  List<Sr> sr;

  factory SrMboSet.fromJson(Map<String, dynamic> json) => SrMboSet(
        rsStart: json["rsStart"],
        rsCount: json["rsCount"],
        sr: List<Sr>.from(json["SR"].map((x) => Sr.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rsStart": rsStart,
        "rsCount": rsCount,
        "SR": List<dynamic>.from(sr.map((x) => x.toJson())),
      };
}

class Sr {
  Sr({
    required this.rowstamp,
    required this.attributes,
  });

  String rowstamp;
  Attributes attributes;

  factory Sr.fromJson(Map<String, dynamic> json) => Sr(
        rowstamp: json["rowstamp"],
        attributes: Attributes.fromJson(json["Attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "rowstamp": rowstamp,
        "Attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.ticketid,
    required this.attributesClass,
    required this.status,
    required this.statusdate,
    required this.reportedby,
    required this.description,
    required this.assetsiteid,
    required this.assetnum,
    required this.location,
    required this.DESCRIPTION_LONGDESCRIPTION,
    required this.ticketuid,
  });

  Class ticketid;
  Class attributesClass;
  Class status;
  Class statusdate;
  Class reportedby;
  Class? description;
  Class? assetnum;
  Class? assetsiteid;
  Class? location;
  Class? DESCRIPTION_LONGDESCRIPTION;
  Ticketuid ticketuid;
  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        ticketid: Class.fromJson(json["TICKETID"]),
        attributesClass: Class.fromJson(json["CLASS"]),
        status: Class.fromJson(json["STATUS"]),
        statusdate: Class.fromJson(json["STATUSDATE"]),
        reportedby: Class.fromJson(json["REPORTEDBY"]),
        description: json["DESCRIPTION"] == null
            ? null
            : Class.fromJson(json["DESCRIPTION"]),
        assetsiteid: json["ASSETSITEID"] == null
            ? null
            : Class.fromJson(json["ASSETSITEID"]),
        assetnum:
            json["ASSETNUM"] == null ? null : Class.fromJson(json["ASSETNUM"]),
        location:
            json["LOCATION"] == null ? null : Class.fromJson(json["LOCATION"]),
        DESCRIPTION_LONGDESCRIPTION: json["DESCRIPTION_LONGDESCRIPTION"] == null
            ? null
            : Class.fromJson(json["DESCRIPTION_LONGDESCRIPTION"]),
        ticketuid: Ticketuid.fromJson(json["TICKETUID"]),
      );

  Map<String, dynamic> toJson() => {
        "TICKETID": ticketid.toJson(),
        "CLASS": attributesClass.toJson(),
        "STATUS": status.toJson(),
        "STATUSDATE": statusdate.toJson(),
        "REPORTEDBY": reportedby.toJson(),
        "DESCRIPTION": description == null ? null : description!.toJson(),
        "ASSETSITEID": assetsiteid == null ? null : assetsiteid!.toJson(),
        "ASSETNUM": assetnum == null ? null : assetnum!.toJson(),
        "LOCATION": location == null ? null : location!.toJson(),
        "DESCRIPTION_LONGDESCRIPTION": DESCRIPTION_LONGDESCRIPTION == null
            ? null
            : DESCRIPTION_LONGDESCRIPTION!.toJson(),
        "TICKETUID": ticketuid.toJson(),
      };

  contains(String text) {}
}

class Class {
  Class({
    required this.content,
  });

  String content;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}

class Ticketuid {
  Ticketuid({
    required this.content,
    required this.resourceid,
  });

  int content;
  bool resourceid;

  factory Ticketuid.fromJson(Map<String, dynamic> json) => Ticketuid(
        content: json["content"],
        resourceid: json["resourceid"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "resourceid": resourceid,
      };
}
