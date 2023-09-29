class Location {
  final int id;
  final String name;
  final int defaults;
  final int user_id;
  final String country;
  final String city;
  final String address;
  final String pick_up_times;
  final String pick_up_days;

  Location({
    this.id,
    this.name,
    this.defaults,
    this.user_id,
    this.country,
    this.city,
    this.address,
    this.pick_up_times,
    this.pick_up_days,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        id: json['id'],
        name: json['name'],
        defaults: json['defaults'],
        user_id: json['user_id'],
        country: json['country'],
        city: json['city'],
        address: json['address'],
        pick_up_times: json['pick_up_times'],
        pick_up_days: json['pick_up_days']);
  }
}
