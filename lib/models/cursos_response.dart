import 'dart:convert';

class CursosResponse {
    final List<Curso> data;
    final Meta meta;

    CursosResponse({
        required this.data,
        required this.meta,
    });

    factory CursosResponse.fromRawJson(String str) => CursosResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CursosResponse.fromJson(Map<String, dynamic> json) => CursosResponse(
        data: List<Curso>.from(json["data"].map((x) => Curso.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Curso {
    final int id;
    final Attributes attributes;

    Curso({
        required this.id,
        required this.attributes,
    });

    factory Curso.fromRawJson(String str) => Curso.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    final String nombre;
    final String descripcion;
    final String fecha;
    final String instructor;
    final int capacidad;
    final DateTime createdAt;
    final DateTime updatedAt;
    final DateTime publishedAt;

    Attributes({
        required this.nombre,
        required this.descripcion,
        required this.fecha,
        required this.instructor,
        required this.capacidad,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
    });

    factory Attributes.fromRawJson(String str) => Attributes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        fecha: json["fecha"],
        instructor: json["instructor"],
        capacidad: json["capacidad"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "fecha": fecha,
        "instructor": instructor,
        "capacidad": capacidad,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
    };
}

class Meta {
    final Pagination pagination;

    Meta({
        required this.pagination,
    });

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    final int page;
    final int pageSize;
    final int pageCount;
    final int total;

    Pagination({
        required this.page,
        required this.pageSize,
        required this.pageCount,
        required this.total,
    });

    factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
