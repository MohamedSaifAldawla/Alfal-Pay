// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'dart:convert';

Transactions transactionsFromJson(String str) =>
    Transactions.fromJson(json.decode(str));

class Transactions {
  int statusCode;
  Data data;

  Transactions({
    required this.statusCode,
    required this.data,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        statusCode: json["status_code"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int currentPage;
  List<TransactionList> data;
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
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<TransactionList>.from(
            json["data"].map((x) => TransactionList.fromJson(x))),
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

class TransactionList {
  int id;
  String refNumber;
  String amount;
  String type;
  String typeLabel;
  String accountFromNumber;
  String accountToNumber;
  String receiverName;
  String senderName;
  String comment;
  bool isSuccess;
  bool isPositive;
  String createdAt;

  TransactionList({
    required this.id,
    required this.refNumber,
    required this.amount,
    required this.type,
    required this.typeLabel,
    required this.accountFromNumber,
    required this.accountToNumber,
    required this.receiverName,
    required this.senderName,
    required this.comment,
    required this.isSuccess,
    required this.isPositive,
    required this.createdAt,
  });

  factory TransactionList.fromJson(Map<String, dynamic> json) =>
      TransactionList(
        id: json["id"],
        refNumber: json["ref_number"],
        amount: json["amount"],
        type: json["type"],
        typeLabel: json["type_label"],
        accountFromNumber: json["account_from_number"] ?? "",
        accountToNumber: json["account_to_number"] ?? "",
        receiverName: json["receiver_name"] ?? "",
        senderName: json["sender_name"] ?? "",
        comment: json["comment"] ?? "",
        isSuccess: json["is_success"],
        isPositive: json["is_positive"],
        createdAt: json["created_at"],
      );
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );
}
