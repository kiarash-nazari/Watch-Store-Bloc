class Product {
  int id;
  String title;
  int price;
  int discount;
  String specialExpiration;
  int discountPrice;
  int productCount;
  String category;
  String brand;
  String image;

  Product({
    required this.brand,
    required this.category,
    required this.discount,
    required this.discountPrice,
    required this.id,
    required this.image,
    required this.price,
    required this.productCount,
    required this.specialExpiration,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        discount: json['discount'],
        specialExpiration: json['special_expiration'],
        discountPrice: json['discount_price'],
        productCount: json['product_count'],
        category: json['category'],
        brand: json['brand'],
        image: json['image']);
  }
}



//  {
//         "id": 10,
//         "title": "ساعت مچی عقربه ای مردانه سیکو SRQ015J1",
//         "price": 90000000,
//         "discount": 51,
//         "special_expiration": "2024-06-13 00:00:00",
//         "discount_price": 44100000,
//         "product_count": 2,
//         "category": "ساعت اسپورت",
//         "brand": "سیکو",
//         "image": "https://watchstore.sasansafari.com/public/images/product/small/1654350887.png"
//       },