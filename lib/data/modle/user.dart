import 'dart:convert';

class User {
  final image;
  final String phone;
  final double lng;
  final double lat;
  final String postalCode;
  final String address;
  final String name;

  User({
    required this.image,
    required this.phone,
    required this.lng,
    required this.lat,
    required this.postalCode,
    required this.address,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'phone': phone,
      'lng': lng,
      'lat': lat,
      'postal_code': postalCode,
      'address': address,
      'name': name
    };
  }

  factory User.fromJson(String jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString);

    return User(
        address: map['address'],
        image: map['image'],
        lat: map['lat'],
        lng: map['lng'],
        name: map['name'],
        phone: map['phone'],
        postalCode: map['postal_code']);
  }
}
