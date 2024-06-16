import 'dart:convert';

class AsistenciasResponse {
    final List<Asistencia> data;
    final Meta meta;

    AsistenciasResponse({
        required this.data,
        required this.meta,
    });

    factory AsistenciasResponse.fromRawJson(String str) => AsistenciasResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AsistenciasResponse.fromJson(Map<String, dynamic> json) => AsistenciasResponse(
        data: List<Asistencia>.from(json["data"].map((x) => Asistencia.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Asistencia {
    final int id;
    final Attributes attributes;

    Asistencia({
        required this.id,
        required this.attributes,
    });

    factory Asistencia.fromRawJson(String str) => Asistencia.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Asistencia.fromJson(Map<String, dynamic> json) => Asistencia(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    final DateTime fecha;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;
    final DateTime publishedAt;

    Attributes({
        required this.fecha,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
    });

    factory Attributes.fromRawJson(String str) => Attributes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        fecha: DateTime.parse(json["fecha"]),
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "status": status,
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
