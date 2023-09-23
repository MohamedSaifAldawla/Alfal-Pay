// To parse this JSON data, do
//
//     final hewalaList = hewalaListFromJson(jsonString);

import 'dart:convert';

HewalaList hewalaListFromJson(String str) =>
    HewalaList.fromJson(json.decode(str));

class HewalaList {
  int statusCode;
  Data data;

  HewalaList({
    required this.statusCode,
    required this.data,
  });

  factory HewalaList.fromJson(Map<String, dynamic> json) => HewalaList(
        statusCode: json["status_code"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int currentPage;
  List<Hewalas> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Hewalas>.from(json["data"].map((x) => Hewalas.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );
}

class Hewalas {
  int id;
  String amount;
  String comment;
  bool hasBeenDelivered;
  String createdAt;
  String serialNumber;
  String receiverName;
  String receiverPhone;

  Hewalas({
    required this.id,
    required this.amount,
    required this.comment,
    required this.hasBeenDelivered,
    required this.createdAt,
    required this.serialNumber,
    required this.receiverName,
    required this.receiverPhone,
  });

  factory Hewalas.fromJson(Map<String, dynamic> json) => Hewalas(
        id: json["id"],
        amount: json["amount"],
        comment: json["comment"],
        hasBeenDelivered: json["has_been_delivered"],
        createdAt: json["created_at"],
        serialNumber: json["serial_number"],
        receiverName: json["receiver_name"],
        receiverPhone: json["receiver_phone"],
      );
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );
}
