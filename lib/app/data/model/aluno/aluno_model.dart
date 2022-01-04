
import 'dart:convert';

StudantModel studantModelFromJson(String str) => StudantModel.fromJson(json.decode(str));

String studantModelToJson(StudantModel data) => json.encode(data.toJson());

class StudantModel {
  StudantModel({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  List<Content> content;
  Pageable pageable;
  bool last;
  int totalPages;
  int totalElements;
  int size;
  int number;
  Sort sort;
  bool first;
  int numberOfElements;
  bool empty;

  factory StudantModel.fromJson(Map<String, dynamic> json) => StudantModel(
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    pageable: Pageable.fromJson(json["pageable"]),
    last: json["last"],
    totalPages: json["totalPages"],
    totalElements: json["totalElements"],
    size: json["size"],
    number: json["number"],
    sort: Sort.fromJson(json["sort"]),
    first: json["first"],
    numberOfElements: json["numberOfElements"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
    "pageable": pageable.toJson(),
    "last": last,
    "totalPages": totalPages,
    "totalElements": totalElements,
    "size": size,
    "number": number,
    "sort": sort.toJson(),
    "first": first,
    "numberOfElements": numberOfElements,
    "empty": empty,
  };
}

class Content {
  Content({
    required this.id,
    required this.name,
    required this.lastName,
    required this.dataNanscimento,
    required this.email,
    required this.teleFone,
    required this.teleFoneCelular,
    required this.photo,
    required this.enabled,
    required this.genero,
    required this.estadoCivil,
    required this.nacionalidade,
    required this.links,
  });

  String id;
  String name;
  String lastName;
  DateTime dataNanscimento;
  String email;
  String teleFone;
  String teleFoneCelular;
  String photo;
  bool enabled;
  String genero;
  String estadoCivil;
  String nacionalidade;
  List<Link> links;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    name: json["name"],
    lastName: json["lastName"],
    dataNanscimento: DateTime.parse(json["dataNanscimento"]),
    email: json["email"],
    teleFone: json["teleFone"],
    teleFoneCelular: json["teleFoneCelular"],
    photo: json["photo"],
    enabled: json["enabled"],
    genero: json["genero"],
    estadoCivil: json["estadoCivil"],
    nacionalidade: json["nacionalidade"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastName": lastName,
    "dataNanscimento": dataNanscimento.toIso8601String(),
    "email": email,
    "teleFone": teleFone,
    "teleFoneCelular": teleFoneCelular,
    "photo": photo,
    "enabled": enabled,
    "genero": genero,
    "estadoCivil": estadoCivil,
    "nacionalidade": nacionalidade,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
  };
}

class Link {
  Link({
    required this.rel,
    required this.href,
  });

  String rel;
  String href;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    rel: json["rel"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "rel": rel,
    "href": href,
  };
}

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageSize,
    required this.pageNumber,
    required this.unpaged,
    required this.paged,
  });

  Sort sort;
  int offset;
  int pageSize;
  int pageNumber;
  bool unpaged;
  bool paged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
    sort: Sort.fromJson(json["sort"]),
    offset: json["offset"],
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    unpaged: json["unpaged"],
    paged: json["paged"],
  );

  Map<String, dynamic> toJson() => {
    "sort": sort.toJson(),
    "offset": offset,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "unpaged": unpaged,
    "paged": paged,
  };
}

class Sort {
  Sort({
    required this.sorted,
    required this.unsorted,
    required this.empty,
  });

  bool sorted;
  bool unsorted;
  bool empty;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    sorted: json["sorted"],
    unsorted: json["unsorted"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "sorted": sorted,
    "unsorted": unsorted,
    "empty": empty,
  };
}
