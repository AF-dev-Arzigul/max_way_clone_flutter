import 'dart:convert';

MaxWay maxWayFromJson(String str) => MaxWay.fromJson(json.decode(str));
String maxWayToJson(MaxWay data) => json.encode(data.toJson());

class MaxWay {
  MaxWay({
    required this.pageProps,
    required this.nSsp,
  });

  PageProps pageProps;
  bool nSsp;

  factory MaxWay.fromJson(Map<String, dynamic> json) => MaxWay(
    pageProps: PageProps.fromJson(json["pageProps"]),
    nSsp: json["__N_SSP"],
  );

  Map<String, dynamic> toJson() => {
    "pageProps": pageProps.toJson(),
    "__N_SSP": nSsp,
  };
}

class PageProps {
  PageProps({
    required this.banners,
    required this.categories,
    this.popups,
    required this.lang,
    required this.namespaces,
  });

  List<Bannerr> banners;
  List<Category> categories;
  dynamic popups;
  String lang;
  Namespaces namespaces;

  factory PageProps.fromJson(Map<String, dynamic> json) => PageProps(
    banners: List<Bannerr>.from(json["banners"].map((x) => Bannerr.fromJson(x))),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    popups: json["popups"],
    lang: json["__lang"],
    namespaces: Namespaces.fromJson(json["__namespaces"]),
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "popups": popups,
    "__lang": lang,
    "__namespaces": namespaces.toJson(),
  };
}

class Bannerr {
  Bannerr({
    required this.id,
    required this.title,
    required this.position,
    required this.image,
    required this.url,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.shipperId,
    required this.about,
  });

  String id;
  Title title;
  String position;
  String image;
  String url;
  bool active;
  String createdAt;
  String updatedAt;
  String shipperId;
  String about;

  factory Bannerr.fromJson(Map<String, dynamic> json) => Bannerr(
    id: json["id"],
    title: Title.fromJson(json["title"]),
    position: json["position"],
    image: json["image"],
    url: json["url"],
    active: json["active"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    shipperId: json["shipper_id"],
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title.toJson(),
    "position": position,
    "image": image,
    "url": url,
    "active": active,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "shipper_id": shipperId,
    "about": about,
  };
}

class Title {
  Title({
    required this.uz,
    required this.ru,
    required this.en,
  });

  String uz;
  String ru;
  String en;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    uz: json["uz"],
    ru: json["ru"],
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "uz": uz,
    "ru": ru,
    "en": en,
  };
}

class Category {
  Category({
    required this.id,
    required this.slug,
    required this.parentId,
    required this.image,
    required this.description,
    required this.title,
    required this.orderNo,
    required this.active,
    required this.products,
    this.childCategories,
  });

  String id;
  String slug;
  String parentId;
  String image;
  Title description;
  Title title;
  String orderNo;
  bool active;
  List<Product> products;
  dynamic childCategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    slug: json["slug"],
    parentId: json["parent_id"],
    image: json["image"],
    description: Title.fromJson(json["description"]),
    title: Title.fromJson(json["title"]),
    orderNo: json["order_no"],
    active: json["active"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    childCategories: json["child_categories"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "parent_id": parentId,
    "image": image,
    "description": description.toJson(),
    "title": title.toJson(),
    "order_no": orderNo,
    "active": active,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "child_categories": childCategories,
  };
}

class Product {
  Product({
    required this.id,
    required this.outPrice,
    required this.currency,
    required this.string,
    required this.type,
    required this.categories,
    required this.brandId,
    required this.rateId,
    required this.image,
    required this.activeInMenu,
    required this.hasModifier,
    required this.fromTime,
    required this.toTime,
    required this.offAlways,
    this.gallery,
    required this.title,
    required this.description,
    required this.active,
    required this.iikoId,
    required this.jowiId,
  });

  String id;
  int outPrice;
  Currency currency;
  String string;
  Type type;
  List<String> categories;
  String brandId;
  String rateId;
  String image;
  bool activeInMenu;
  bool hasModifier;
  String fromTime;
  String toTime;
  bool offAlways;
  dynamic gallery;
  Title title;
  Title description;
  bool active;
  String iikoId;
  String jowiId;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    outPrice: json["out_price"],
    currency: currencyValues.map[json["currency"]]!,
    string: json["string"],
    type: typeValues.map[json["type"]]!,
    categories: List<String>.from(json["categories"].map((x) => x)),
    brandId: json["brand_id"],
    rateId: json["rate_id"],
    image: json["image"],
    activeInMenu: json["active_in_menu"],
    hasModifier: json["has_modifier"],
    fromTime: json["from_time"],
    toTime: json["to_time"],
    offAlways: json["off_always"],
    gallery: json["gallery"],
    title: Title.fromJson(json["title"]),
    description: Title.fromJson(json["description"]),
    active: json["active"],
    iikoId: json["iiko_id"],
    jowiId: json["jowi_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "out_price": outPrice,
    "currency": currencyValues.reverse[currency],
    "string": string,
    "type": typeValues.reverse[type],
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "brand_id": brandId,
    "rate_id": rateId,
    "image": image,
    "active_in_menu": activeInMenu,
    "has_modifier": hasModifier,
    "from_time": fromTime,
    "to_time": toTime,
    "off_always": offAlways,
    "gallery": gallery,
    "title": title.toJson(),
    "description": description.toJson(),
    "active": active,
    "iiko_id": iikoId,
    "jowi_id": jowiId,
  };
}

enum Currency { UZS }

final currencyValues = EnumValues({
  "UZS": Currency.UZS
});

enum Type { SIMPLE, ORIGIN }

final typeValues = EnumValues({
  "origin": Type.ORIGIN,
  "simple": Type.SIMPLE
});

class Namespaces {
  Namespaces({
    required this.common,
  });

  Map<String, String> common;

  factory Namespaces.fromJson(Map<String, dynamic> json) => Namespaces(
    common: Map.from(json["common"]).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "common": Map.from(common).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
