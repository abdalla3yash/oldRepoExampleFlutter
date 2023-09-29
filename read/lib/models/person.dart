class Person {
  int id;
  String name;
  String email;
  String avatar;
  String phone;
  String frequency;
  String favourite_book;
  String favourite_genres;
  Person(
      {this.id,
      this.name,
      this.avatar,
      this.email,
      this.phone,
      this.frequency,
      this.favourite_book,
      this.favourite_genres});

  Person.initial()
      : id = 0,
        name = '',
        avatar = '',
        email = '',
        phone = '',
        frequency = '',
        favourite_book = '',
        favourite_genres = '';

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    email = json['email'];
    phone = json['phone'];
    frequency = json['frequency'];
    favourite_book = json['favourite_book'];
    favourite_genres = json['favourite_genres'];
  }
}
