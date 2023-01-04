// To parse this JSON data, do
//
//     final pagination = paginationFromJson(jsonString);


import 'dart:convert';

Pagination paginationFromJson(String str) => Pagination.fromJson(json.decode(str));

String paginationToJson(Pagination data) => json.encode(data.toJson());

class Pagination {
    Pagination({
        required this.data,
        required this.rows,
        required this.pages,
        required this.isNext,
        required this.nextPage,
    });

    List<Producto> data;
    int rows;
    int pages;
    bool isNext;
    int nextPage;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        data: List<Producto>.from(json['data'].map((x) => Producto.fromJson(x))),
        rows: json['rows'],
        pages: json['pages'],
        isNext: json['isNext'],
        nextPage: json['nextPage'],
    );

    Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'rows': rows,
        'pages': pages,
        'isNext': isNext,
        'nextPage': nextPage,
    };
}

class Producto {
    Producto({
        required this.codigo,
        required this.orden,
        required this.producto,
        required this.valor,
        required this.images,
        required this.ruta,
        required this.uso,
        required this.descuento,
        required this.agotado,
        required this.promo,
        required this.category,
        required this.invima,
        required this.intro,
        required this.video,
        required this.imgtabla,
        required this.arte,
        required this.title,
        required this.description,
        required this.ingredientes,
        required this.presentation,
        required this.imageswebp,
        required this.tablasjpg,
        required this.html,
    });

    int codigo;
    int orden;
    String producto;
    int valor;
    Images images;
    String ruta;
    String uso;
    int descuento;
    bool agotado;
    bool promo;
    String category;
    String invima;
    String intro;
    String video;
    String imgtabla;
    String? arte;
    String title;
    String description;
    String ingredientes;
    String presentation;
    Images imageswebp;
    Images tablasjpg;
    String? html;

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        codigo: json['codigo'],
        orden: json['orden'],
        producto: json['producto'],
        valor: json['valor'],
        images: Images.fromJson(json['images']),
        ruta: json['ruta'],
        uso: json['uso'],
        descuento: json['descuento'],
        agotado: json['agotado'],
        promo: json['promo'],
        category: json['category'],
        invima: json['invima'],
        intro: json['intro'],
        video: json['video'],
        imgtabla: json['imgtabla'],
        arte: json['arte'] ?? '',
        title: json['title'],
        description: json['description'],
        ingredientes: json['ingredientes'],
        presentation: json['presentation'],
        imageswebp: Images.fromJson(json['imageswebp']),
        tablasjpg: Images.fromJson(json['tablasjpg']),
        html: json['html'] ?? '',
    );

    Map<String, dynamic> toJson() => {
        'codigo': codigo,
        'orden': orden,
        'producto': producto,
        'valor': valor,
        'images': images.toJson(),
        'ruta': ruta,
        'uso': uso,
        'descuento': descuento,
        'agotado': agotado,
        'promo': promo,
        'category': category,
        'invima': invima,
        'intro': intro,
        'video': video,
        'imgtabla': imgtabla,
        'arte': arte,
        'title': title,
        'description': description,
        'ingredientes': ingredientes,
        'presentation': presentation,
        'imageswebp': imageswebp.toJson(),
        'tablasjpg': tablasjpg.toJson(),
        'html': html,
    };
}

class Images {
    Images({
        required this.lazyload,
        required this.small,
        required this.medium,
        required this.big,
        required this.bigger,
        required this.seo,
    });

    String lazyload;
    String small;
    String medium;
    String big;
    String bigger;
    String seo;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        lazyload: json['lazyload'] == null ? null : json['lazyload'],
        small: json['small'],
        medium: json['medium'],
        big: json['big'],
        bigger: json['bigger'],
        seo: json['seo'],
    );

    Map<String, dynamic> toJson() => {
        'lazyload': lazyload == null ? null : lazyload,
        'small': small,
        'medium': medium,
        'big': big,
        'bigger': bigger,
        'seo': seo,
    };
}
