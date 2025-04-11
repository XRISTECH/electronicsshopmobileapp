import 'dart:convert';
class ProductState {
  final bool isLoading;
  final List<ProductModel> products;

  ProductState({required this.isLoading, required this.products});

  ProductState copyWith({
    bool? isLoading,
    List<ProductModel>? products,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
    );
  }
}

class UserModel {
  final String uid;
  final String username;
  final String profilePic;
  final String email;


  UserModel(
      {required this.username,
        required this.email,
        required this.profilePic,
        required this.uid
      });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'profilePic': profilePic
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] ?? '',
      profilePic: json['profilePic'] ?? '',
      email: json['email'] ?? '',
      uid: json['_id'] ?? ''
  );

  UserModel copyWith(
      {
        String? username,
        String? email,
        String? profilePic,
        String? uid,
      }) {
    return UserModel(
        username: username ?? this.username,
        email: email ?? this.email,
        profilePic: profilePic ?? this.profilePic,
        uid: uid ?? this.uid);
  }
}


class ErrorModel {
  final String? error;
  final dynamic data;

  ErrorModel({required this.error, required this.data});
}


class ProductModel{
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final int quantity;
  final String color;
  final List<String> colors;
  final List<double> ratings;
  final List<String> likes;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.quantity,
    required this.color,
    required this.colors,
    required this.ratings,
    required this.likes,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });


  // Factory constructor to create an instance from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      brand: json['brand'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
      color: json['color'] ?? '',
      colors: List<String>.from(json['colors'] ?? []),
      ratings: List<double>.from((json['ratings'] ?? []).map((r) => (r as num).toDouble())),
      likes: List<String>.from(json['likes']?.map((l) => l.toString()) ?? []),
      images: List<String>.from(json['images'] ?? []),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }


  // Convert a JSON string into a ProductModel
  static ProductModel fromJsonString(String jsonString) {
    return ProductModel.fromJson(jsonDecode(jsonString));
  }

  // Convert a list of JSON objects into a list of ProductModels
  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }
}

class Category {
  final String name;
  final String image;

  Category({
    required this.name,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    name: "SmartPhones",
    image: "assets/images/31217926-7524-4c61-841b-5c7d12ef0416.png",
  ),
  Category(
    name: "Fridge",
    image:
        "assets/images/Samsung Family Hub™️ _ Samsung US _ undefined undefined.png",
  ),
  Category(
    name: "AC",
    image: "assets/images/Air-Conditioner.png",
  ),
  Category(
    name: "SmartWatch",
    image:
        "assets/images/Apple Watch Repair Service in Dubai Abu Dhabi Sharjah UAE.png",
  ),
  Category(
    name: "HeadPhone",
    image:
        "assets/images/Sennheiser Headphone PNG Images (Transparent HD Photo Clipart).png",
  ),
  Category(
    name: "Laptop",
    image:
        "assets/images/Download Dell Laptop Png Images Background png - Free PNG Images.png",
  ),
  Category(
    name: "Television",
    image: "assets/images/tv-removebg-preview.png",
  ),
];


final List<String> filterCategory = [
  "Filter",
  "Ratings",
  "Color",
  "Price",
  "Brand",
];
