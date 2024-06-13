// To parse this JSON data, do
//
//     final asistenciasResponse = asistenciasResponseFromJson(jsonString);

import 'dart:convert';

AsistenciasResponse asistenciasResponseFromJson(String str) => AsistenciasResponse.fromJson(json.decode(str));

String asistenciasResponseToJson(AsistenciasResponse data) => json.encode(data.toJson());

class AsistenciasResponse {
    List<Datum> data;
    Meta meta;

    AsistenciasResponse({
        required this.data,
        required this.meta,
    });

    factory AsistenciasResponse.fromJson(Map<String, dynamic> json) => AsistenciasResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Datum {
    int id;
    Attributes attributes;

    Datum({
        required this.id,
        required this.attributes,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    String usuario;
    String curso;
    String fecha;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;

    Attributes({
        required this.usuario,
        required this.curso,
        required this.fecha,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
    });

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        usuario: json["Usuario"],
        curso: json["curso"],
        fecha: json["fecha"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "Usuario": usuario,
        "curso": curso,
        "fecha": fecha,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
    };
}

class Meta {
    Pagination pagination;

    Meta({
        required this.pagination,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    int page;
    int pageSize;
    int pageCount;
    int total;

    Pagination({
        required this.page,
        required this.pageSize,
        required this.pageCount,
        required this.total,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
    };
}
