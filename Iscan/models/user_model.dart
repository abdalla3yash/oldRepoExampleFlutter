class User{
  String name;
  String email;
  String avatar;
  String location;
  String distance;

  User({this.avatar, this.name, this.email, this.location, this.distance});

  @override
  String toString() => 'User { name: $name, email: $email}';
}
