import 'dart:convert';

class UsuariosResponse {
    final List<Usuario> data;
    final Meta meta;

    UsuariosResponse({
        required this.data,
        required this.meta,
    });

    factory UsuariosResponse.fromRawJson(String str) => UsuariosResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UsuariosResponse.fromJson(Map<String, dynamic> json) => UsuariosResponse(
        data: List<Usuario>.from(json["data"].map((x) => Usuario.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Usuario {
    final int id;
    final Attributes attributes;

    Usuario({
        required this.id,
        required this.attributes,
    });

    factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
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
    final String email;
    final String role;
    final DateTime createdAt;
    final DateTime updatedAt;
    final DateTime publishedAt;

    Attributes({
        required this.nombre,
        required this.email,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
    });

    factory Attributes.fromRawJson(String str) => Attributes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        nombre: json["nombre"],
        email: json["email"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "email": email,
        "role": role,
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
