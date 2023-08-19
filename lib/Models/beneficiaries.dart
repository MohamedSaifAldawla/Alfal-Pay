// To parse this JSON data, do
//
//     final beneficiariesList = beneficiariesListFromJson(jsonString);

import 'dart:convert';

BeneficiariesList beneficiariesListFromJson(String str) =>
    BeneficiariesList.fromJson(json.decode(str));

class BeneficiariesList {
  int statusCode;
  Data? data;

  BeneficiariesList({
    required this.statusCode,
    required this.data,
  });

  factory BeneficiariesList.fromJson(Map<String, dynamic> json) =>
      BeneficiariesList(
        statusCode: json["status_code"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int currentPage;
  List<Beneficiaries> data;
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
        data: List<Beneficiaries>.from(
            json["data"].map((x) => Beneficiaries.fromJson(x))),
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

class Beneficiaries {
  int id;
  String name;
  String nickName;
  String accountNumber;
  String customerId;
  DateTime createdAt;
  DateTime updatedAt;

  Beneficiaries({
    required this.id,
    required this.name,
    required this.nickName,
    required this.accountNumber,
    required this.customerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Beneficiaries.fromJson(Map<String, dynamic> json) => Beneficiaries(
        id: json["id"],
        name: json["name"],
        nickName: json["nick_name"],
        accountNumber: json["account_number"],
        customerId: json["customer_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
