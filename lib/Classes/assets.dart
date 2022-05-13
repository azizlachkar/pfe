// To parse this JSON data, do
//
//     final assets = assetsFromJson(jsonString);

import 'dart:convert';

Assets assetsFromJson(String str) => Assets.fromJson(json.decode(str));

String assetsToJson(Assets data) => json.encode(data.toJson());

class Assets {
  Assets({
    required this.assetMboSet,
  });

  AssetMboSet assetMboSet;

  factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        assetMboSet: AssetMboSet.fromJson(json["ASSETMboSet"]),
      );

  Map<String, dynamic> toJson() => {
        "ASSETMboSet": assetMboSet.toJson(),
      };
}

class AssetMboSet {
  AssetMboSet({
    required this.rsStart,
    required this.rsCount,
    required this.asset,
  });

  int rsStart;
  int rsCount;
  List<Asset> asset;

  factory AssetMboSet.fromJson(Map<String, dynamic> json) => AssetMboSet(
        rsStart: json["rsStart"],
        rsCount: json["rsCount"],
        asset: List<Asset>.from(json["ASSET"].map((x) => Asset.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rsStart": rsStart,
        "rsCount": rsCount,
        "ASSET": List<dynamic>.from(asset.map((x) => x.toJson())),
      };
}

class Asset {
  Asset({
    required this.rowstamp,
    required this.attributes,
  });

  String rowstamp;
  Attributes attributes;

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
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
    required this.assetnum,
    required this.parent,
    required this.location,
    required this.description,
    required this.purchaseprice,
    required this.replacecost,
    required this.totalcost,
    required this.ytdcost,
    required this.budgetcost,
    required this.isrunning,
    required this.unchargedcost,
    required this.totunchargedcost,
    required this.totdowntime,
    required this.statusdate,
    required this.changedate,
    required this.changeby,
    required this.invcost,
    required this.children,
    required this.disabled,
    required this.siteid,
    required this.orgid,
    required this.autowogen,
    required this.itemsetid,
    required this.addtostore,
    required this.movedate,
    required this.movedby,
    required this.newparent,
    required this.newsite,
    required this.newlocation,
    required this.assettype,
    required this.status,
    required this.mainthierchy,
    required this.assetid,
    required this.moved,
    required this.newassetnum,
    required this.assetuid,
    required this.newstatus,
    required this.haschildren,
    required this.hasparent,
    required this.objectname,
    required this.langcode,
    required this.ancestor,
    required this.replaceassetsite,
    required this.hasld,
    required this.islinear,
    required this.statusiface,
    required this.asofdate,
    required this.frommeasure,
    required this.tomeasure,
    required this.rolltoallchildren,
    required this.removefromactiveroutes,
    required this.removefromactivesp,
    required this.changepmstatus,
    required this.neworgid,
    required this.returnedtovendor,
    required this.relationshipfilterby,
    required this.expectedlife,
    required this.tloampartition,
    required this.plusciscontam,
    required this.pluscisinhousecal,
    required this.pluscismte,
    required this.pluscpmextdate,
    required this.pluscsolution,
    required this.iscalibration,
    required this.showfromdate,
    required this.triCtglobal,
    required this.groupname,
  });

  Asofdate assetnum;
  Asofdate? parent;
  Asofdate? location;
  Asofdate? description;
  Assetid purchaseprice;
  Assetid replacecost;
  Assetid totalcost;
  Assetid ytdcost;
  Assetid budgetcost;
  Addtostore isrunning;
  Assetid unchargedcost;
  Assetid totunchargedcost;
  Assetid totdowntime;
  Asofdate statusdate;
  Asofdate changedate;
  Asofdate changeby;
  Assetid invcost;
  Addtostore children;
  Addtostore disabled;
  Asofdate siteid;
  Asofdate orgid;
  Addtostore autowogen;
  Asofdate? itemsetid;
  Addtostore addtostore;
  Asofdate movedate;
  Asofdate movedby;
  Asofdate? newparent;
  Asofdate newsite;
  Asofdate? newlocation;
  Asofdate? assettype;
  Asofdate status;
  Addtostore mainthierchy;
  Assetid assetid;
  Addtostore moved;
  Asofdate newassetnum;
  Assetuid assetuid;
  Asofdate newstatus;
  Addtostore haschildren;
  Addtostore hasparent;
  Asofdate objectname;
  Asofdate langcode;
  Asofdate? ancestor;
  Asofdate replaceassetsite;
  Addtostore hasld;
  Addtostore islinear;
  Addtostore statusiface;
  Asofdate asofdate;
  Assetid frommeasure;
  Assetid tomeasure;
  Addtostore rolltoallchildren;
  Addtostore removefromactiveroutes;
  Addtostore removefromactivesp;
  Addtostore changepmstatus;
  Asofdate neworgid;
  Addtostore returnedtovendor;
  Asofdate relationshipfilterby;
  Assetid expectedlife;
  Addtostore tloampartition;
  Addtostore plusciscontam;
  Addtostore pluscisinhousecal;
  Addtostore pluscismte;
  Addtostore pluscpmextdate;
  Addtostore pluscsolution;
  Addtostore iscalibration;
  Asofdate showfromdate;
  Assetid? triCtglobal;
  Asofdate? groupname;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        assetnum: Asofdate.fromJson(json["ASSETNUM"]),
        parent:
            json["PARENT"] == null ? null : Asofdate.fromJson(json["PARENT"]),
        location: json["LOCATION"] == null
            ? null
            : Asofdate.fromJson(json["LOCATION"]),
        description: json["DESCRIPTION"] == null
            ? null
            : Asofdate.fromJson(json["DESCRIPTION"]),
        purchaseprice: Assetid.fromJson(json["PURCHASEPRICE"]),
        replacecost: Assetid.fromJson(json["REPLACECOST"]),
        totalcost: Assetid.fromJson(json["TOTALCOST"]),
        ytdcost: Assetid.fromJson(json["YTDCOST"]),
        budgetcost: Assetid.fromJson(json["BUDGETCOST"]),
        isrunning: Addtostore.fromJson(json["ISRUNNING"]),
        unchargedcost: Assetid.fromJson(json["UNCHARGEDCOST"]),
        totunchargedcost: Assetid.fromJson(json["TOTUNCHARGEDCOST"]),
        totdowntime: Assetid.fromJson(json["TOTDOWNTIME"]),
        statusdate: Asofdate.fromJson(json["STATUSDATE"]),
        changedate: Asofdate.fromJson(json["CHANGEDATE"]),
        changeby: Asofdate.fromJson(json["CHANGEBY"]),
        invcost: Assetid.fromJson(json["INVCOST"]),
        children: Addtostore.fromJson(json["CHILDREN"]),
        disabled: Addtostore.fromJson(json["DISABLED"]),
        siteid: Asofdate.fromJson(json["SITEID"]),
        orgid: Asofdate.fromJson(json["ORGID"]),
        autowogen: Addtostore.fromJson(json["AUTOWOGEN"]),
        itemsetid: json["ITEMSETID"] == null
            ? null
            : Asofdate.fromJson(json["ITEMSETID"]),
        addtostore: Addtostore.fromJson(json["ADDTOSTORE"]),
        movedate: Asofdate.fromJson(json["MOVEDATE"]),
        movedby: Asofdate.fromJson(json["MOVEDBY"]),
        newparent: json["NEWPARENT"] == null
            ? null
            : Asofdate.fromJson(json["NEWPARENT"]),
        newsite: Asofdate.fromJson(json["NEWSITE"]),
        newlocation: json["NEWLOCATION"] == null
            ? null
            : Asofdate.fromJson(json["NEWLOCATION"]),
        assettype: json["ASSETTYPE"] == null
            ? null
            : Asofdate.fromJson(json["ASSETTYPE"]),
        status: Asofdate.fromJson(json["STATUS"]),
        mainthierchy: Addtostore.fromJson(json["MAINTHIERCHY"]),
        assetid: Assetid.fromJson(json["ASSETID"]),
        moved: Addtostore.fromJson(json["MOVED"]),
        newassetnum: Asofdate.fromJson(json["NEWASSETNUM"]),
        assetuid: Assetuid.fromJson(json["ASSETUID"]),
        newstatus: Asofdate.fromJson(json["NEWSTATUS"]),
        haschildren: Addtostore.fromJson(json["HASCHILDREN"]),
        hasparent: Addtostore.fromJson(json["HASPARENT"]),
        objectname: Asofdate.fromJson(json["OBJECTNAME"]),
        langcode: Asofdate.fromJson(json["LANGCODE"]),
        ancestor: json["ANCESTOR"] == null
            ? null
            : Asofdate.fromJson(json["ANCESTOR"]),
        replaceassetsite: Asofdate.fromJson(json["REPLACEASSETSITE"]),
        hasld: Addtostore.fromJson(json["HASLD"]),
        islinear: Addtostore.fromJson(json["ISLINEAR"]),
        statusiface: Addtostore.fromJson(json["STATUSIFACE"]),
        asofdate: Asofdate.fromJson(json["ASOFDATE"]),
        frommeasure: Assetid.fromJson(json["FROMMEASURE"]),
        tomeasure: Assetid.fromJson(json["TOMEASURE"]),
        rolltoallchildren: Addtostore.fromJson(json["ROLLTOALLCHILDREN"]),
        removefromactiveroutes:
            Addtostore.fromJson(json["REMOVEFROMACTIVEROUTES"]),
        removefromactivesp: Addtostore.fromJson(json["REMOVEFROMACTIVESP"]),
        changepmstatus: Addtostore.fromJson(json["CHANGEPMSTATUS"]),
        neworgid: Asofdate.fromJson(json["NEWORGID"]),
        returnedtovendor: Addtostore.fromJson(json["RETURNEDTOVENDOR"]),
        relationshipfilterby: Asofdate.fromJson(json["RELATIONSHIPFILTERBY"]),
        expectedlife: Assetid.fromJson(json["EXPECTEDLIFE"]),
        tloampartition: Addtostore.fromJson(json["TLOAMPARTITION"]),
        plusciscontam: Addtostore.fromJson(json["PLUSCISCONTAM"]),
        pluscisinhousecal: Addtostore.fromJson(json["PLUSCISINHOUSECAL"]),
        pluscismte: Addtostore.fromJson(json["PLUSCISMTE"]),
        pluscpmextdate: Addtostore.fromJson(json["PLUSCPMEXTDATE"]),
        pluscsolution: Addtostore.fromJson(json["PLUSCSOLUTION"]),
        iscalibration: Addtostore.fromJson(json["ISCALIBRATION"]),
        showfromdate: Asofdate.fromJson(json["SHOWFROMDATE"]),
        triCtglobal: json["TRI_CTGLOBAL"] == null
            ? null
            : Assetid.fromJson(json["TRI_CTGLOBAL"]),
        groupname: json["GROUPNAME"] == null
            ? null
            : Asofdate.fromJson(json["GROUPNAME"]),
      );

  Map<String, dynamic> toJson() => {
        "ASSETNUM": assetnum.toJson(),
        "PARENT": parent == null ? null : parent!.toJson(),
        "LOCATION": location == null ? null : location!.toJson(),
        "DESCRIPTION": description == null ? null : description!.toJson(),
        "PURCHASEPRICE": purchaseprice.toJson(),
        "REPLACECOST": replacecost.toJson(),
        "TOTALCOST": totalcost.toJson(),
        "YTDCOST": ytdcost.toJson(),
        "BUDGETCOST": budgetcost.toJson(),
        "ISRUNNING": isrunning.toJson(),
        "UNCHARGEDCOST": unchargedcost.toJson(),
        "TOTUNCHARGEDCOST": totunchargedcost.toJson(),
        "TOTDOWNTIME": totdowntime.toJson(),
        "STATUSDATE": statusdate.toJson(),
        "CHANGEDATE": changedate.toJson(),
        "CHANGEBY": changeby.toJson(),
        "INVCOST": invcost.toJson(),
        "CHILDREN": children.toJson(),
        "DISABLED": disabled.toJson(),
        "SITEID": siteid.toJson(),
        "ORGID": orgid.toJson(),
        "AUTOWOGEN": autowogen.toJson(),
        "ITEMSETID": itemsetid == null ? null : itemsetid!.toJson(),
        "ADDTOSTORE": addtostore.toJson(),
        "MOVEDATE": movedate.toJson(),
        "MOVEDBY": movedby.toJson(),
        "NEWPARENT": newparent == null ? null : newparent!.toJson(),
        "NEWSITE": newsite.toJson(),
        "NEWLOCATION": newlocation == null ? null : newlocation!.toJson(),
        "ASSETTYPE": assettype == null ? null : assettype!.toJson(),
        "STATUS": status.toJson(),
        "MAINTHIERCHY": mainthierchy.toJson(),
        "ASSETID": assetid.toJson(),
        "MOVED": moved.toJson(),
        "NEWASSETNUM": newassetnum.toJson(),
        "ASSETUID": assetuid.toJson(),
        "NEWSTATUS": newstatus.toJson(),
        "HASCHILDREN": haschildren.toJson(),
        "HASPARENT": hasparent.toJson(),
        "OBJECTNAME": objectname.toJson(),
        "LANGCODE": langcode.toJson(),
        "ANCESTOR": ancestor == null ? null : ancestor!.toJson(),
        "REPLACEASSETSITE": replaceassetsite.toJson(),
        "HASLD": hasld.toJson(),
        "ISLINEAR": islinear.toJson(),
        "STATUSIFACE": statusiface.toJson(),
        "ASOFDATE": asofdate.toJson(),
        "FROMMEASURE": frommeasure.toJson(),
        "TOMEASURE": tomeasure.toJson(),
        "ROLLTOALLCHILDREN": rolltoallchildren.toJson(),
        "REMOVEFROMACTIVEROUTES": removefromactiveroutes.toJson(),
        "REMOVEFROMACTIVESP": removefromactivesp.toJson(),
        "CHANGEPMSTATUS": changepmstatus.toJson(),
        "NEWORGID": neworgid.toJson(),
        "RETURNEDTOVENDOR": returnedtovendor.toJson(),
        "RELATIONSHIPFILTERBY": relationshipfilterby.toJson(),
        "EXPECTEDLIFE": expectedlife.toJson(),
        "TLOAMPARTITION": tloampartition.toJson(),
        "PLUSCISCONTAM": plusciscontam.toJson(),
        "PLUSCISINHOUSECAL": pluscisinhousecal.toJson(),
        "PLUSCISMTE": pluscismte.toJson(),
        "PLUSCPMEXTDATE": pluscpmextdate.toJson(),
        "PLUSCSOLUTION": pluscsolution.toJson(),
        "ISCALIBRATION": iscalibration.toJson(),
        "SHOWFROMDATE": showfromdate.toJson(),
        "TRI_CTGLOBAL": triCtglobal == null ? null : triCtglobal!.toJson(),
        "GROUPNAME": groupname == null ? null : groupname!.toJson(),
      };
}

class Addtostore {
  Addtostore({
    required this.content,
  });

  bool content;

  factory Addtostore.fromJson(Map<String, dynamic> json) => Addtostore(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}

class Asofdate {
  Asofdate({
    required this.content,
  });

  String content;

  factory Asofdate.fromJson(Map<String, dynamic> json) => Asofdate(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}

class Assetid {
  Assetid({
    required this.content,
  });

  int content;

  factory Assetid.fromJson(Map<String, dynamic> json) => Assetid(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}

class Assetuid {
  Assetuid({
    required this.content,
    required this.resourceid,
  });

  int content;
  bool resourceid;

  factory Assetuid.fromJson(Map<String, dynamic> json) => Assetuid(
        content: json["content"],
        resourceid: json["resourceid"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "resourceid": resourceid,
      };
}
