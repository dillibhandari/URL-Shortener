// To parse this JSON data, do
//
//     final urlShorterResponseModel = urlShorterResponseModelFromJson(jsonString);

import 'dart:convert';

List<UrlShorterResponseModel> urlShorterResponseModelFromJson(String str) => List<UrlShorterResponseModel>.from(json.decode(str).map((x) => UrlShorterResponseModel.fromJson(x)));

String urlShorterResponseModelToJson(List<UrlShorterResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UrlShorterResponseModel {
    String id;
    String title;
    String slashtag;
    String destination;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic expiredAt;
    String status;
    List<dynamic> tags;
    String linkType;
    int clicks;
    bool isPublic;
    String shortUrl;
    String domainId;
    String domainName;
    Domain domain;
    bool https;
    bool favourite;
    Creator creator;
    bool integrated;

    UrlShorterResponseModel({
        required this.id,
        required this.title,
        required this.slashtag,
        required this.destination,
        required this.createdAt,
        required this.updatedAt,
        required this.expiredAt,
        required this.status,
        required this.tags,
        required this.linkType,
        required this.clicks,
        required this.isPublic,
        required this.shortUrl,
        required this.domainId,
        required this.domainName,
        required this.domain,
        required this.https,
        required this.favourite,
        required this.creator,
        required this.integrated,
    });

    factory UrlShorterResponseModel.fromJson(Map<String, dynamic> json) => UrlShorterResponseModel(
        id: json["id"],
        title: json["title"],
        slashtag: json["slashtag"],
        destination: json["destination"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        expiredAt: json["expiredAt"],
        status: json["status"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        linkType: json["linkType"],
        clicks: json["clicks"],
        isPublic: json["isPublic"],
        shortUrl: json["shortUrl"],
        domainId: json["domainId"],
        domainName: json["domainName"],
        domain: Domain.fromJson(json["domain"]),
        https: json["https"],
        favourite: json["favourite"],
        creator: Creator.fromJson(json["creator"]),
        integrated: json["integrated"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slashtag": slashtag,
        "destination": destination,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "expiredAt": expiredAt,
        "status": status,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "linkType": linkType,
        "clicks": clicks,
        "isPublic": isPublic,
        "shortUrl": shortUrl,
        "domainId": domainId,
        "domainName": domainName,
        "domain": domain.toJson(),
        "https": https,
        "favourite": favourite,
        "creator": creator.toJson(),
        "integrated": integrated,
    };
}

class Creator {
    String id;
    String fullName;
    String avatarUrl;

    Creator({
        required this.id,
        required this.fullName,
        required this.avatarUrl,
    });

    factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json["id"],
        fullName: json["fullName"],
        avatarUrl: json["avatarUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "avatarUrl": avatarUrl,
    };
}

class Domain {
    String id;
    String ref;
    String fullName;
    Sharing sharing;
    bool active;

    Domain({
        required this.id,
        required this.ref,
        required this.fullName,
        required this.sharing,
        required this.active,
    });

    factory Domain.fromJson(Map<String, dynamic> json) => Domain(
        id: json["id"],
        ref: json["ref"],
        fullName: json["fullName"],
        sharing: Sharing.fromJson(json["sharing"]),
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ref": ref,
        "fullName": fullName,
        "sharing": sharing.toJson(),
        "active": active,
    };
}

class Sharing {
    Protocol protocol;

    Sharing({
        required this.protocol,
    });

    factory Sharing.fromJson(Map<String, dynamic> json) => Sharing(
        protocol: Protocol.fromJson(json["protocol"]),
    );

    Map<String, dynamic> toJson() => {
        "protocol": protocol.toJson(),
    };
}

class Protocol {
    List<String> allowed;
    String protocolDefault;

    Protocol({
        required this.allowed,
        required this.protocolDefault,
    });

    factory Protocol.fromJson(Map<String, dynamic> json) => Protocol(
        allowed: List<String>.from(json["allowed"].map((x) => x)),
        protocolDefault: json["default"],
    );

    Map<String, dynamic> toJson() => {
        "allowed": List<dynamic>.from(allowed.map((x) => x)),
        "default": protocolDefault,
    };
}
