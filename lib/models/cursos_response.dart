// To parse this JSON data, do
//
//     final cursosResponse = cursosResponseFromJson(jsonString);

import 'dart:convert';

CursosResponse cursosResponseFromJson(String str) => CursosResponse.fromJson(json.decode(str));

String cursosResponseToJson(CursosResponse data) => json.encode(data.toJson());

class CursosResponse {
    List<Datum> data;
    Meta meta;

    CursosResponse({
        required this.data,
        required this.meta,
    });

    factory CursosResponse.fromJson(Map<String, dynamic> json) => CursosResponse(
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
    String nombre;
    String descripcion;
    String capacidad;
    String fechaInicio;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;

    Attributes({
        required this.nombre,
        required this.descripcion,
        required this.capacidad,
        required this.fechaInicio,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
    });

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        capacidad: json["capacidad"],
        fechaInicio: json["fechaInicio"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "capacidad": capacidad,
        "fechaInicio": fechaInicio,
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
