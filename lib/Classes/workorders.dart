// To parse this JSON data, do
//
//     final assets = assetsFromJson(jsonString);

import 'dart:convert';

Workorders assetsFromJson(String str) => Workorders.fromJson(json.decode(str));

String assetsToJson(Workorders data) => json.encode(data.toJson());

class Workorders {
  Workorders({
    required this.workorderMboSet,
  });

  WorkorderMboSet workorderMboSet;

  factory Workorders.fromJson(Map<String, dynamic> json) => Workorders(
        workorderMboSet: WorkorderMboSet.fromJson(json["WORKORDERMboSet"]),
      );

  Map<String, dynamic> toJson() => {
        "WORKORDERMboSet": workorderMboSet.toJson(),
      };
}

class WorkorderMboSet {
  WorkorderMboSet({
    required this.rsStart,
    required this.rsCount,
    required this.workorder,
  });

  int rsStart;
  int rsCount;
  List<Workorder> workorder;

  factory WorkorderMboSet.fromJson(Map<String, dynamic> json) =>
      WorkorderMboSet(
        rsStart: json["rsStart"],
        rsCount: json["rsCount"],
        workorder: List<Workorder>.from(
            json["WORKORDER"].map((x) => Workorder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rsStart": rsStart,
        "rsCount": rsCount,
        "WORKORDER": List<dynamic>.from(workorder.map((x) => x.toJson())),
      };
}

class Workorder {
  Workorder({
    required this.rowstamp,
    required this.attributes,
  });

  String rowstamp;
  Attributes attributes;

  factory Workorder.fromJson(Map<String, dynamic> json) => Workorder(
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
    required this.status,
    required this.wonum,
    required this.statusdate,
    required this.worktype,
    required this.assetnum,
    required this.location,
    required this.changeby,
    required this.changedate,
    required this.estdur,
    required this.estlabhrs,
    required this.estmatcost,
    required this.estlabcost,
    required this.esttoolcost,
    required this.actlabhrs,
    required this.actmatcost,
    required this.actlabcost,
    required this.acttoolcost,
    required this.haschildren,
    required this.outlabcost,
    required this.outmatcost,
    required this.outtoolcost,
    required this.historyflag,
    required this.reportedby,
    required this.reportdate,
    required this.downtime,
    required this.chargestore,
    required this.estservcost,
    required this.actservcost,
    required this.disabled,
    required this.estatapprlabhrs,
    required this.estatapprlabcost,
    required this.estatapprmatcost,
    required this.estatapprtoolcost,
    required this.estatapprservcost,
    required this.hasfollowupwork,
    required this.orgid,
    required this.siteid,
    required this.istask,
    required this.displaywonum,
    required this.locwarrantynotice,
    required this.assetwarrantynotice,
    required this.acttotalcost,
    required this.estatapprtotalcost,
    required this.esttotalcost,
    required this.woclass,
    required this.dupflag,
    required this.woacceptscharges,
    required this.parentchgsstatus,
    required this.workorderid,
    required this.objectname,
    required this.hasparent,
    required this.jpassets,
    required this.spassets,
    required this.splocations,
    required this.langcode,
    required this.warrantyexist,
    required this.interruptible,
    required this.wogroup,
    required this.safetyplanLookupListType,
    required this.slaapplied,
    required this.reportedbyid,
    required this.reportedbyname,
    required this.hasld,
    required this.assetfilterby,
    required this.statusiface,
    required this.jpclass,
    required this.jpincludeclassless,
    required this.woisswap,
    required this.newchildclass,
    required this.suspendflow,
    required this.flowcontrolled,
    required this.flowactionassist,
    required this.changebyparent,
    required this.haslinear,
    required this.firstapprstatus,
    required this.ignoresrmavail,
    required this.ignorediavail,
    required this.estintlabcost,
    required this.estintlabhrs,
    required this.estoutlabhrs,
    required this.estoutlabcost,
    required this.actintlabcost,
    required this.actintlabhrs,
    required this.actoutlabhrs,
    required this.actoutlabcost,
    required this.estatapprintlabcost,
    required this.estatapprintlabhrs,
    required this.estatapproutlabhrs,
    required this.estatapproutlabcost,
    required this.lastcopylinkdate,
    required this.nestedjpinprocess,
    required this.pluscismobile,
    required this.pluscloop,
    required this.usembodata,
    required this.djpapplied,
    required this.inctasksinsched,
    required this.reqasstdwntime,
    required this.apptrequired,
    required this.aos,
    required this.ams,
    required this.los,
    required this.lms,
    required this.repairlocflag,
    required this.worklog,
    required this.filterbyworkzone,
    required this.validationerror,
    required this.validationwarn,
    required this.milestone,
    required this.triCttotal,
    required this.description,
    required this.targstartdate,
    required this.schedstart,
    required this.triNbragentestime,
    required this.actstart,
    required this.actfinish,
    required this.wopriority,
    required this.respondby,
    required this.calcpriority,
    required this.onbehalfof,
    required this.origrecordclass,
    required this.origrecordid,
    required this.onbehalfofid,
    required this.onbehalfofname,
    required this.assetcust,
    required this.assetuser,
    required this.triSymptome,
    required this.schedfinish,
    required this.vendor,
    required this.rvNmaint,
    required this.pmnum,
    required this.targcompdate,
    required this.pmduedate,
    required this.route,
    required this.pluscfrequency,
    required this.pluscfrequnit,
    required this.descriptionLongdescription,
    required this.ownergroup,
    required this.assignedownergroup,
    required this.owner,
    required this.parent,
    required this.taskid,
    required this.displaytaskid,
    required this.triEstduration,
    required this.wosequence,
    required this.jpnum,
    required this.pmnextduedate,
    required this.pluscjprevnum,
    required this.jobtaskid,
    required this.routestopid,
    required this.sneconstraint,
    required this.fnlconstraint,
    required this.classstructureid,
  });

  Assetfilterby wonum;
  Assetfilterby status;
  Assetfilterby statusdate;
  Assetfilterby? worktype;
  Assetfilterby? assetnum;
  Assetfilterby? location;
  Assetfilterby changeby;
  Assetfilterby changedate;
  Actintlabcost estdur;
  Actintlabcost estlabhrs;
  Actintlabcost estmatcost;
  Actintlabcost estlabcost;
  Actintlabcost esttoolcost;
  Actintlabcost actlabhrs;
  Actintlabcost actmatcost;
  Actintlabcost actlabcost;
  Actintlabcost acttoolcost;
  Ams haschildren;
  Actintlabcost outlabcost;
  Actintlabcost outmatcost;
  Actintlabcost outtoolcost;
  Ams historyflag;
  Assetfilterby reportedby;
  Assetfilterby reportdate;
  Ams downtime;
  Ams chargestore;
  Actintlabcost estservcost;
  Actintlabcost actservcost;
  Ams disabled;
  Actintlabcost estatapprlabhrs;
  Actintlabcost estatapprlabcost;
  Actintlabcost estatapprmatcost;
  Actintlabcost estatapprtoolcost;
  Actintlabcost estatapprservcost;
  Ams hasfollowupwork;
  Assetfilterby orgid;
  Assetfilterby siteid;
  Ams istask;
  Assetfilterby displaywonum;
  Ams locwarrantynotice;
  Ams assetwarrantynotice;
  Actintlabcost acttotalcost;
  Actintlabcost estatapprtotalcost;
  Actintlabcost esttotalcost;
  Assetfilterby woclass;
  Assetfilterby dupflag;
  Ams woacceptscharges;
  Ams parentchgsstatus;
  Workorderid workorderid;
  Assetfilterby objectname;
  Ams hasparent;
  Ams jpassets;
  Ams spassets;
  Ams splocations;
  Assetfilterby langcode;
  Ams warrantyexist;
  Ams interruptible;
  Assetfilterby wogroup;
  Assetfilterby safetyplanLookupListType;
  Ams slaapplied;
  Assetfilterby reportedbyid;
  Assetfilterby reportedbyname;
  Ams hasld;
  Assetfilterby assetfilterby;
  Ams statusiface;
  Assetfilterby jpclass;
  Ams jpincludeclassless;
  Ams woisswap;
  Assetfilterby newchildclass;
  Ams suspendflow;
  Ams flowcontrolled;
  Ams flowactionassist;
  Ams changebyparent;
  Ams haslinear;
  Assetfilterby? firstapprstatus;
  Ams ignoresrmavail;
  Ams ignorediavail;
  Actintlabcost estintlabcost;
  Actintlabcost estintlabhrs;
  Actintlabcost estoutlabhrs;
  Actintlabcost estoutlabcost;
  Actintlabcost actintlabcost;
  Actintlabcost actintlabhrs;
  Actintlabcost actoutlabhrs;
  Actintlabcost actoutlabcost;
  Actintlabcost estatapprintlabcost;
  Actintlabcost estatapprintlabhrs;
  Actintlabcost estatapproutlabhrs;
  Actintlabcost estatapproutlabcost;
  Assetfilterby? lastcopylinkdate;
  Ams nestedjpinprocess;
  Ams pluscismobile;
  Ams pluscloop;
  Ams usembodata;
  Assetfilterby djpapplied;
  Ams inctasksinsched;
  Ams reqasstdwntime;
  Ams apptrequired;
  Ams aos;
  Ams ams;
  Ams los;
  Ams lms;
  Ams repairlocflag;
  Ams worklog;
  Ams filterbyworkzone;
  Ams validationerror;
  Ams validationwarn;
  Ams milestone;
  Actintlabcost? triCttotal;
  Assetfilterby? description;
  Assetfilterby? targstartdate;
  Assetfilterby? schedstart;
  Actintlabcost? triNbragentestime;
  Assetfilterby? actstart;
  Assetfilterby? actfinish;
  Actintlabcost? wopriority;
  Assetfilterby? respondby;
  Actintlabcost? calcpriority;
  Assetfilterby? onbehalfof;
  Assetfilterby? origrecordclass;
  Assetfilterby? origrecordid;
  Assetfilterby? onbehalfofid;
  Assetfilterby? onbehalfofname;
  Assetfilterby? assetcust;
  Assetfilterby? assetuser;
  Assetfilterby? triSymptome;
  Assetfilterby? schedfinish;
  Assetfilterby? vendor;
  Assetfilterby? rvNmaint;
  Assetfilterby? pmnum;
  Assetfilterby? targcompdate;
  Assetfilterby? pmduedate;
  Assetfilterby? route;
  Actintlabcost? pluscfrequency;
  Assetfilterby? pluscfrequnit;
  Assetfilterby? descriptionLongdescription;
  Assetfilterby? ownergroup;
  Assetfilterby? assignedownergroup;
  Assetfilterby? owner;
  Assetfilterby? parent;
  Actintlabcost? taskid;
  Actintlabcost? displaytaskid;
  Actintlabcost? triEstduration;
  Actintlabcost? wosequence;
  Assetfilterby? jpnum;
  Assetfilterby? pmnextduedate;
  Actintlabcost? pluscjprevnum;
  Actintlabcost? jobtaskid;
  Actintlabcost? routestopid;
  Assetfilterby? sneconstraint;
  Assetfilterby? fnlconstraint;
  Assetfilterby? classstructureid;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        wonum: Assetfilterby.fromJson(json["WONUM"]),
        status: Assetfilterby.fromJson(json["STATUS"]),
        statusdate: Assetfilterby.fromJson(json["STATUSDATE"]),
        worktype: json["WORKTYPE"] == null
            ? null
            : Assetfilterby.fromJson(json["WORKTYPE"]),
        assetnum: json["ASSETNUM"] == null
            ? null
            : Assetfilterby.fromJson(json["ASSETNUM"]),
        location: json["LOCATION"] == null
            ? null
            : Assetfilterby.fromJson(json["LOCATION"]),
        changeby: Assetfilterby.fromJson(json["CHANGEBY"]),
        changedate: Assetfilterby.fromJson(json["CHANGEDATE"]),
        estdur: Actintlabcost.fromJson(json["ESTDUR"]),
        estlabhrs: Actintlabcost.fromJson(json["ESTLABHRS"]),
        estmatcost: Actintlabcost.fromJson(json["ESTMATCOST"]),
        estlabcost: Actintlabcost.fromJson(json["ESTLABCOST"]),
        esttoolcost: Actintlabcost.fromJson(json["ESTTOOLCOST"]),
        actlabhrs: Actintlabcost.fromJson(json["ACTLABHRS"]),
        actmatcost: Actintlabcost.fromJson(json["ACTMATCOST"]),
        actlabcost: Actintlabcost.fromJson(json["ACTLABCOST"]),
        acttoolcost: Actintlabcost.fromJson(json["ACTTOOLCOST"]),
        haschildren: Ams.fromJson(json["HASCHILDREN"]),
        outlabcost: Actintlabcost.fromJson(json["OUTLABCOST"]),
        outmatcost: Actintlabcost.fromJson(json["OUTMATCOST"]),
        outtoolcost: Actintlabcost.fromJson(json["OUTTOOLCOST"]),
        historyflag: Ams.fromJson(json["HISTORYFLAG"]),
        reportedby: Assetfilterby.fromJson(json["REPORTEDBY"]),
        reportdate: Assetfilterby.fromJson(json["REPORTDATE"]),
        downtime: Ams.fromJson(json["DOWNTIME"]),
        chargestore: Ams.fromJson(json["CHARGESTORE"]),
        estservcost: Actintlabcost.fromJson(json["ESTSERVCOST"]),
        actservcost: Actintlabcost.fromJson(json["ACTSERVCOST"]),
        disabled: Ams.fromJson(json["DISABLED"]),
        estatapprlabhrs: Actintlabcost.fromJson(json["ESTATAPPRLABHRS"]),
        estatapprlabcost: Actintlabcost.fromJson(json["ESTATAPPRLABCOST"]),
        estatapprmatcost: Actintlabcost.fromJson(json["ESTATAPPRMATCOST"]),
        estatapprtoolcost: Actintlabcost.fromJson(json["ESTATAPPRTOOLCOST"]),
        estatapprservcost: Actintlabcost.fromJson(json["ESTATAPPRSERVCOST"]),
        hasfollowupwork: Ams.fromJson(json["HASFOLLOWUPWORK"]),
        orgid: Assetfilterby.fromJson(json["ORGID"]),
        siteid: Assetfilterby.fromJson(json["SITEID"]),
        istask: Ams.fromJson(json["ISTASK"]),
        displaywonum: Assetfilterby.fromJson(json["DISPLAYWONUM"]),
        locwarrantynotice: Ams.fromJson(json["LOCWARRANTYNOTICE"]),
        assetwarrantynotice: Ams.fromJson(json["ASSETWARRANTYNOTICE"]),
        acttotalcost: Actintlabcost.fromJson(json["ACTTOTALCOST"]),
        estatapprtotalcost: Actintlabcost.fromJson(json["ESTATAPPRTOTALCOST"]),
        esttotalcost: Actintlabcost.fromJson(json["ESTTOTALCOST"]),
        woclass: Assetfilterby.fromJson(json["WOCLASS"]),
        dupflag: Assetfilterby.fromJson(json["DUPFLAG"]),
        woacceptscharges: Ams.fromJson(json["WOACCEPTSCHARGES"]),
        parentchgsstatus: Ams.fromJson(json["PARENTCHGSSTATUS"]),
        workorderid: Workorderid.fromJson(json["WORKORDERID"]),
        objectname: Assetfilterby.fromJson(json["OBJECTNAME"]),
        hasparent: Ams.fromJson(json["HASPARENT"]),
        jpassets: Ams.fromJson(json["JPASSETS"]),
        spassets: Ams.fromJson(json["SPASSETS"]),
        splocations: Ams.fromJson(json["SPLOCATIONS"]),
        langcode: Assetfilterby.fromJson(json["LANGCODE"]),
        warrantyexist: Ams.fromJson(json["WARRANTYEXIST"]),
        interruptible: Ams.fromJson(json["INTERRUPTIBLE"]),
        wogroup: Assetfilterby.fromJson(json["WOGROUP"]),
        safetyplanLookupListType:
            Assetfilterby.fromJson(json["SAFETYPLAN_LOOKUP_LIST_TYPE"]),
        slaapplied: Ams.fromJson(json["SLAAPPLIED"]),
        reportedbyid: Assetfilterby.fromJson(json["REPORTEDBYID"]),
        reportedbyname: Assetfilterby.fromJson(json["REPORTEDBYNAME"]),
        hasld: Ams.fromJson(json["HASLD"]),
        assetfilterby: Assetfilterby.fromJson(json["ASSETFILTERBY"]),
        statusiface: Ams.fromJson(json["STATUSIFACE"]),
        jpclass: Assetfilterby.fromJson(json["JPCLASS"]),
        jpincludeclassless: Ams.fromJson(json["JPINCLUDECLASSLESS"]),
        woisswap: Ams.fromJson(json["WOISSWAP"]),
        newchildclass: Assetfilterby.fromJson(json["NEWCHILDCLASS"]),
        suspendflow: Ams.fromJson(json["SUSPENDFLOW"]),
        flowcontrolled: Ams.fromJson(json["FLOWCONTROLLED"]),
        flowactionassist: Ams.fromJson(json["FLOWACTIONASSIST"]),
        changebyparent: Ams.fromJson(json["CHANGEBYPARENT"]),
        haslinear: Ams.fromJson(json["HASLINEAR"]),
        firstapprstatus: json["FIRSTAPPRSTATUS"] == null
            ? null
            : Assetfilterby.fromJson(json["FIRSTAPPRSTATUS"]),
        ignoresrmavail: Ams.fromJson(json["IGNORESRMAVAIL"]),
        ignorediavail: Ams.fromJson(json["IGNOREDIAVAIL"]),
        estintlabcost: Actintlabcost.fromJson(json["ESTINTLABCOST"]),
        estintlabhrs: Actintlabcost.fromJson(json["ESTINTLABHRS"]),
        estoutlabhrs: Actintlabcost.fromJson(json["ESTOUTLABHRS"]),
        estoutlabcost: Actintlabcost.fromJson(json["ESTOUTLABCOST"]),
        actintlabcost: Actintlabcost.fromJson(json["ACTINTLABCOST"]),
        actintlabhrs: Actintlabcost.fromJson(json["ACTINTLABHRS"]),
        actoutlabhrs: Actintlabcost.fromJson(json["ACTOUTLABHRS"]),
        actoutlabcost: Actintlabcost.fromJson(json["ACTOUTLABCOST"]),
        estatapprintlabcost:
            Actintlabcost.fromJson(json["ESTATAPPRINTLABCOST"]),
        estatapprintlabhrs: Actintlabcost.fromJson(json["ESTATAPPRINTLABHRS"]),
        estatapproutlabhrs: Actintlabcost.fromJson(json["ESTATAPPROUTLABHRS"]),
        estatapproutlabcost:
            Actintlabcost.fromJson(json["ESTATAPPROUTLABCOST"]),
        lastcopylinkdate: json["LASTCOPYLINKDATE"] == null
            ? null
            : Assetfilterby.fromJson(json["LASTCOPYLINKDATE"]),
        nestedjpinprocess: Ams.fromJson(json["NESTEDJPINPROCESS"]),
        pluscismobile: Ams.fromJson(json["PLUSCISMOBILE"]),
        pluscloop: Ams.fromJson(json["PLUSCLOOP"]),
        usembodata: Ams.fromJson(json["USEMBODATA"]),
        djpapplied: Assetfilterby.fromJson(json["DJPAPPLIED"]),
        inctasksinsched: Ams.fromJson(json["INCTASKSINSCHED"]),
        reqasstdwntime: Ams.fromJson(json["REQASSTDWNTIME"]),
        apptrequired: Ams.fromJson(json["APPTREQUIRED"]),
        aos: Ams.fromJson(json["AOS"]),
        ams: Ams.fromJson(json["AMS"]),
        los: Ams.fromJson(json["LOS"]),
        lms: Ams.fromJson(json["LMS"]),
        repairlocflag: Ams.fromJson(json["REPAIRLOCFLAG"]),
        worklog: Ams.fromJson(json["WORKLOG"]),
        filterbyworkzone: Ams.fromJson(json["FILTERBYWORKZONE"]),
        validationerror: Ams.fromJson(json["VALIDATIONERROR"]),
        validationwarn: Ams.fromJson(json["VALIDATIONWARN"]),
        milestone: Ams.fromJson(json["MILESTONE"]),
        triCttotal: json["TRI_CTTOTAL"] == null
            ? null
            : Actintlabcost.fromJson(json["TRI_CTTOTAL"]),
        description: json["DESCRIPTION"] == null
            ? null
            : Assetfilterby.fromJson(json["DESCRIPTION"]),
        targstartdate: json["TARGSTARTDATE"] == null
            ? null
            : Assetfilterby.fromJson(json["TARGSTARTDATE"]),
        schedstart: json["SCHEDSTART"] == null
            ? null
            : Assetfilterby.fromJson(json["SCHEDSTART"]),
        triNbragentestime: json["TRI_NBRAGENTESTIME"] == null
            ? null
            : Actintlabcost.fromJson(json["TRI_NBRAGENTESTIME"]),
        actstart: json["ACTSTART"] == null
            ? null
            : Assetfilterby.fromJson(json["ACTSTART"]),
        actfinish: json["ACTFINISH"] == null
            ? null
            : Assetfilterby.fromJson(json["ACTFINISH"]),
        wopriority: json["WOPRIORITY"] == null
            ? null
            : Actintlabcost.fromJson(json["WOPRIORITY"]),
        respondby: json["RESPONDBY"] == null
            ? null
            : Assetfilterby.fromJson(json["RESPONDBY"]),
        calcpriority: json["CALCPRIORITY"] == null
            ? null
            : Actintlabcost.fromJson(json["CALCPRIORITY"]),
        onbehalfof: json["ONBEHALFOF"] == null
            ? null
            : Assetfilterby.fromJson(json["ONBEHALFOF"]),
        origrecordclass: json["ORIGRECORDCLASS"] == null
            ? null
            : Assetfilterby.fromJson(json["ORIGRECORDCLASS"]),
        origrecordid: json["ORIGRECORDID"] == null
            ? null
            : Assetfilterby.fromJson(json["ORIGRECORDID"]),
        onbehalfofid: json["ONBEHALFOFID"] == null
            ? null
            : Assetfilterby.fromJson(json["ONBEHALFOFID"]),
        onbehalfofname: json["ONBEHALFOFNAME"] == null
            ? null
            : Assetfilterby.fromJson(json["ONBEHALFOFNAME"]),
        assetcust: json["ASSETCUST"] == null
            ? null
            : Assetfilterby.fromJson(json["ASSETCUST"]),
        assetuser: json["ASSETUSER"] == null
            ? null
            : Assetfilterby.fromJson(json["ASSETUSER"]),
        triSymptome: json["TRI_SYMPTOME"] == null
            ? null
            : Assetfilterby.fromJson(json["TRI_SYMPTOME"]),
        schedfinish: json["SCHEDFINISH"] == null
            ? null
            : Assetfilterby.fromJson(json["SCHEDFINISH"]),
        vendor: json["VENDOR"] == null
            ? null
            : Assetfilterby.fromJson(json["VENDOR"]),
        rvNmaint: json["RV_NMAINT"] == null
            ? null
            : Assetfilterby.fromJson(json["RV_NMAINT"]),
        pmnum: json["PMNUM"] == null
            ? null
            : Assetfilterby.fromJson(json["PMNUM"]),
        targcompdate: json["TARGCOMPDATE"] == null
            ? null
            : Assetfilterby.fromJson(json["TARGCOMPDATE"]),
        pmduedate: json["PMDUEDATE"] == null
            ? null
            : Assetfilterby.fromJson(json["PMDUEDATE"]),
        route: json["ROUTE"] == null
            ? null
            : Assetfilterby.fromJson(json["ROUTE"]),
        pluscfrequency: json["PLUSCFREQUENCY"] == null
            ? null
            : Actintlabcost.fromJson(json["PLUSCFREQUENCY"]),
        pluscfrequnit: json["PLUSCFREQUNIT"] == null
            ? null
            : Assetfilterby.fromJson(json["PLUSCFREQUNIT"]),
        descriptionLongdescription: json["DESCRIPTION_LONGDESCRIPTION"] == null
            ? null
            : Assetfilterby.fromJson(json["DESCRIPTION_LONGDESCRIPTION"]),
        ownergroup: json["OWNERGROUP"] == null
            ? null
            : Assetfilterby.fromJson(json["OWNERGROUP"]),
        assignedownergroup: json["ASSIGNEDOWNERGROUP"] == null
            ? null
            : Assetfilterby.fromJson(json["ASSIGNEDOWNERGROUP"]),
        owner: json["OWNER"] == null
            ? null
            : Assetfilterby.fromJson(json["OWNER"]),
        parent: json["PARENT"] == null
            ? null
            : Assetfilterby.fromJson(json["PARENT"]),
        taskid: json["TASKID"] == null
            ? null
            : Actintlabcost.fromJson(json["TASKID"]),
        displaytaskid: json["DISPLAYTASKID"] == null
            ? null
            : Actintlabcost.fromJson(json["DISPLAYTASKID"]),
        triEstduration: json["TRI_ESTDURATION"] == null
            ? null
            : Actintlabcost.fromJson(json["TRI_ESTDURATION"]),
        wosequence: json["WOSEQUENCE"] == null
            ? null
            : Actintlabcost.fromJson(json["WOSEQUENCE"]),
        jpnum: json["JPNUM"] == null
            ? null
            : Assetfilterby.fromJson(json["JPNUM"]),
        pmnextduedate: json["PMNEXTDUEDATE"] == null
            ? null
            : Assetfilterby.fromJson(json["PMNEXTDUEDATE"]),
        pluscjprevnum: json["PLUSCJPREVNUM"] == null
            ? null
            : Actintlabcost.fromJson(json["PLUSCJPREVNUM"]),
        jobtaskid: json["JOBTASKID"] == null
            ? null
            : Actintlabcost.fromJson(json["JOBTASKID"]),
        routestopid: json["ROUTESTOPID"] == null
            ? null
            : Actintlabcost.fromJson(json["ROUTESTOPID"]),
        sneconstraint: json["SNECONSTRAINT"] == null
            ? null
            : Assetfilterby.fromJson(json["SNECONSTRAINT"]),
        fnlconstraint: json["FNLCONSTRAINT"] == null
            ? null
            : Assetfilterby.fromJson(json["FNLCONSTRAINT"]),
        classstructureid: json["CLASSSTRUCTUREID"] == null
            ? null
            : Assetfilterby.fromJson(json["CLASSSTRUCTUREID"]),
      );

  get workorder => null;

  Map<String, dynamic> toJson() => {
        "WONUM": wonum.toJson(),
        "STATUS": status.toJson(),
        "STATUSDATE": statusdate.toJson(),
        "WORKTYPE": worktype == null ? null : worktype!.toJson(),
        "ASSETNUM": assetnum == null ? null : assetnum!.toJson(),
        "LOCATION": location == null ? null : location!.toJson(),
        "CHANGEBY": changeby.toJson(),
        "CHANGEDATE": changedate.toJson(),
        "ESTDUR": estdur.toJson(),
        "ESTLABHRS": estlabhrs.toJson(),
        "ESTMATCOST": estmatcost.toJson(),
        "ESTLABCOST": estlabcost.toJson(),
        "ESTTOOLCOST": esttoolcost.toJson(),
        "ACTLABHRS": actlabhrs.toJson(),
        "ACTMATCOST": actmatcost.toJson(),
        "ACTLABCOST": actlabcost.toJson(),
        "ACTTOOLCOST": acttoolcost.toJson(),
        "HASCHILDREN": haschildren.toJson(),
        "OUTLABCOST": outlabcost.toJson(),
        "OUTMATCOST": outmatcost.toJson(),
        "OUTTOOLCOST": outtoolcost.toJson(),
        "HISTORYFLAG": historyflag.toJson(),
        "REPORTEDBY": reportedby.toJson(),
        "REPORTDATE": reportdate.toJson(),
        "DOWNTIME": downtime.toJson(),
        "CHARGESTORE": chargestore.toJson(),
        "ESTSERVCOST": estservcost.toJson(),
        "ACTSERVCOST": actservcost.toJson(),
        "DISABLED": disabled.toJson(),
        "ESTATAPPRLABHRS": estatapprlabhrs.toJson(),
        "ESTATAPPRLABCOST": estatapprlabcost.toJson(),
        "ESTATAPPRMATCOST": estatapprmatcost.toJson(),
        "ESTATAPPRTOOLCOST": estatapprtoolcost.toJson(),
        "ESTATAPPRSERVCOST": estatapprservcost.toJson(),
        "HASFOLLOWUPWORK": hasfollowupwork.toJson(),
        "ORGID": orgid.toJson(),
        "SITEID": siteid.toJson(),
        "ISTASK": istask.toJson(),
        "DISPLAYWONUM": displaywonum.toJson(),
        "LOCWARRANTYNOTICE": locwarrantynotice.toJson(),
        "ASSETWARRANTYNOTICE": assetwarrantynotice.toJson(),
        "ACTTOTALCOST": acttotalcost.toJson(),
        "ESTATAPPRTOTALCOST": estatapprtotalcost.toJson(),
        "ESTTOTALCOST": esttotalcost.toJson(),
        "WOCLASS": woclass.toJson(),
        "DUPFLAG": dupflag.toJson(),
        "WOACCEPTSCHARGES": woacceptscharges.toJson(),
        "PARENTCHGSSTATUS": parentchgsstatus.toJson(),
        "WORKORDERID": workorderid.toJson(),
        "OBJECTNAME": objectname.toJson(),
        "HASPARENT": hasparent.toJson(),
        "JPASSETS": jpassets.toJson(),
        "SPASSETS": spassets.toJson(),
        "SPLOCATIONS": splocations.toJson(),
        "LANGCODE": langcode.toJson(),
        "WARRANTYEXIST": warrantyexist.toJson(),
        "INTERRUPTIBLE": interruptible.toJson(),
        "WOGROUP": wogroup.toJson(),
        "SAFETYPLAN_LOOKUP_LIST_TYPE": safetyplanLookupListType.toJson(),
        "SLAAPPLIED": slaapplied.toJson(),
        "REPORTEDBYID": reportedbyid.toJson(),
        "REPORTEDBYNAME": reportedbyname.toJson(),
        "HASLD": hasld.toJson(),
        "ASSETFILTERBY": assetfilterby.toJson(),
        "STATUSIFACE": statusiface.toJson(),
        "JPCLASS": jpclass.toJson(),
        "JPINCLUDECLASSLESS": jpincludeclassless.toJson(),
        "WOISSWAP": woisswap.toJson(),
        "NEWCHILDCLASS": newchildclass.toJson(),
        "SUSPENDFLOW": suspendflow.toJson(),
        "FLOWCONTROLLED": flowcontrolled.toJson(),
        "FLOWACTIONASSIST": flowactionassist.toJson(),
        "CHANGEBYPARENT": changebyparent.toJson(),
        "HASLINEAR": haslinear.toJson(),
        "FIRSTAPPRSTATUS":
            firstapprstatus == null ? null : firstapprstatus!.toJson(),
        "IGNORESRMAVAIL": ignoresrmavail.toJson(),
        "IGNOREDIAVAIL": ignorediavail.toJson(),
        "ESTINTLABCOST": estintlabcost.toJson(),
        "ESTINTLABHRS": estintlabhrs.toJson(),
        "ESTOUTLABHRS": estoutlabhrs.toJson(),
        "ESTOUTLABCOST": estoutlabcost.toJson(),
        "ACTINTLABCOST": actintlabcost.toJson(),
        "ACTINTLABHRS": actintlabhrs.toJson(),
        "ACTOUTLABHRS": actoutlabhrs.toJson(),
        "ACTOUTLABCOST": actoutlabcost.toJson(),
        "ESTATAPPRINTLABCOST": estatapprintlabcost.toJson(),
        "ESTATAPPRINTLABHRS": estatapprintlabhrs.toJson(),
        "ESTATAPPROUTLABHRS": estatapproutlabhrs.toJson(),
        "ESTATAPPROUTLABCOST": estatapproutlabcost.toJson(),
        "LASTCOPYLINKDATE":
            lastcopylinkdate == null ? null : lastcopylinkdate!.toJson(),
        "NESTEDJPINPROCESS": nestedjpinprocess.toJson(),
        "PLUSCISMOBILE": pluscismobile.toJson(),
        "PLUSCLOOP": pluscloop.toJson(),
        "USEMBODATA": usembodata.toJson(),
        "DJPAPPLIED": djpapplied.toJson(),
        "INCTASKSINSCHED": inctasksinsched.toJson(),
        "REQASSTDWNTIME": reqasstdwntime.toJson(),
        "APPTREQUIRED": apptrequired.toJson(),
        "AOS": aos.toJson(),
        "AMS": ams.toJson(),
        "LOS": los.toJson(),
        "LMS": lms.toJson(),
        "REPAIRLOCFLAG": repairlocflag.toJson(),
        "WORKLOG": worklog.toJson(),
        "FILTERBYWORKZONE": filterbyworkzone.toJson(),
        "VALIDATIONERROR": validationerror.toJson(),
        "VALIDATIONWARN": validationwarn.toJson(),
        "MILESTONE": milestone.toJson(),
        "TRI_CTTOTAL": triCttotal == null ? null : triCttotal!.toJson(),
        "DESCRIPTION": description == null ? null : description!.toJson(),
        "TARGSTARTDATE": targstartdate == null ? null : targstartdate!.toJson(),
        "SCHEDSTART": schedstart == null ? null : schedstart!.toJson(),
        "TRI_NBRAGENTESTIME":
            triNbragentestime == null ? null : triNbragentestime!.toJson(),
        "ACTSTART": actstart == null ? null : actstart!.toJson(),
        "ACTFINISH": actfinish == null ? null : actfinish!.toJson(),
        "WOPRIORITY": wopriority == null ? null : wopriority!.toJson(),
        "RESPONDBY": respondby == null ? null : respondby!.toJson(),
        "CALCPRIORITY": calcpriority == null ? null : calcpriority!.toJson(),
        "ONBEHALFOF": onbehalfof == null ? null : onbehalfof!.toJson(),
        "ORIGRECORDCLASS":
            origrecordclass == null ? null : origrecordclass!.toJson(),
        "ORIGRECORDID": origrecordid == null ? null : origrecordid!.toJson(),
        "ONBEHALFOFID": onbehalfofid == null ? null : onbehalfofid!.toJson(),
        "ONBEHALFOFNAME":
            onbehalfofname == null ? null : onbehalfofname!.toJson(),
        "ASSETCUST": assetcust == null ? null : assetcust!.toJson(),
        "ASSETUSER": assetuser == null ? null : assetuser!.toJson(),
        "TRI_SYMPTOME": triSymptome == null ? null : triSymptome!.toJson(),
        "SCHEDFINISH": schedfinish == null ? null : schedfinish!.toJson(),
        "VENDOR": vendor == null ? null : vendor!.toJson(),
        "RV_NMAINT": rvNmaint == null ? null : rvNmaint!.toJson(),
        "PMNUM": pmnum == null ? null : pmnum!.toJson(),
        "TARGCOMPDATE": targcompdate == null ? null : targcompdate!.toJson(),
        "PMDUEDATE": pmduedate == null ? null : pmduedate!.toJson(),
        "ROUTE": route == null ? null : route!.toJson(),
        "PLUSCFREQUENCY":
            pluscfrequency == null ? null : pluscfrequency!.toJson(),
        "PLUSCFREQUNIT": pluscfrequnit == null ? null : pluscfrequnit!.toJson(),
        "DESCRIPTION_LONGDESCRIPTION": descriptionLongdescription == null
            ? null
            : descriptionLongdescription!.toJson(),
        "OWNERGROUP": ownergroup == null ? null : ownergroup!.toJson(),
        "ASSIGNEDOWNERGROUP":
            assignedownergroup == null ? null : assignedownergroup!.toJson(),
        "OWNER": owner == null ? null : owner!.toJson(),
        "PARENT": parent == null ? null : parent!.toJson(),
        "TASKID": taskid == null ? null : taskid!.toJson(),
        "DISPLAYTASKID": displaytaskid == null ? null : displaytaskid!.toJson(),
        "TRI_ESTDURATION":
            triEstduration == null ? null : triEstduration!.toJson(),
        "WOSEQUENCE": wosequence == null ? null : wosequence!.toJson(),
        "JPNUM": jpnum == null ? null : jpnum!.toJson(),
        "PMNEXTDUEDATE": pmnextduedate == null ? null : pmnextduedate!.toJson(),
        "PLUSCJPREVNUM": pluscjprevnum == null ? null : pluscjprevnum!.toJson(),
        "JOBTASKID": jobtaskid == null ? null : jobtaskid!.toJson(),
        "ROUTESTOPID": routestopid == null ? null : routestopid!.toJson(),
        "SNECONSTRAINT": sneconstraint == null ? null : sneconstraint!.toJson(),
        "FNLCONSTRAINT": fnlconstraint == null ? null : fnlconstraint!.toJson(),
        "CLASSSTRUCTUREID":
            classstructureid == null ? null : classstructureid!.toJson(),
      };
}

class Assetfilterby {
  Assetfilterby({
    required this.content,
  });

  String content;

  factory Assetfilterby.fromJson(Map<String, dynamic> json) => Assetfilterby(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}

class Actintlabcost {
  Actintlabcost({
    required this.content,
  });

  double content;

  factory Actintlabcost.fromJson(Map<String, dynamic> json) => Actintlabcost(
        content: json["content"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}

class Ams {
  Ams({
    required this.content,
  });

  bool content;

  factory Ams.fromJson(Map<String, dynamic> json) => Ams(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}

class Workorderid {
  Workorderid({
    required this.content,
    required this.resourceid,
  });

  int content;
  bool resourceid;

  factory Workorderid.fromJson(Map<String, dynamic> json) => Workorderid(
        content: json["content"],
        resourceid: json["resourceid"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "resourceid": resourceid,
      };
}
