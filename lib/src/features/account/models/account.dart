class Account {
  final int? id;
  final String? name;
  final String? surname;
  final String? email;
  final String? username;
  final String? type;
  final String? logo;
  final String? banner;
  final String? shopTitle;
  final String? slogan;
  final int? isInstagram;

  const Account({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.username,
    this.type,
    this.logo,
    this.banner,
    this.shopTitle,
    this.slogan,
    this.isInstagram,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        username: json["username"],
        type: json["type"],
        logo: json["logo"],
        banner: json["banner"],
        shopTitle: json["shop_title"],
        slogan: json["slogan"],
        isInstagram: json["is_instagram"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "username": username,
        "type": type,
        "logo": logo,
        "banner": banner,
        "shop_title": shopTitle,
        "slogan": slogan,
        "is_instagram": isInstagram,
      };
}
