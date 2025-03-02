class ElectronicProduct {
  final int id;
  final String name;
  final String category;
  final String brand;
  final String description;
  final String price;
  final String color;
  final String img;
  final int likes;

  ElectronicProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.brand,
    required this.description,
    required this.price,
    required this.color,
    required this.img,
    required this.likes,
  });

  // Convert ElectronicProduct to a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'brand': brand,
      'description': description,
      'price': price,
      'color': color,
      'img': img,
      'likes': likes,
    };
  }

  // Convert JSON Map to ElectronicProduct instance
  factory ElectronicProduct.fromJson(Map<String, dynamic> json) {
    return ElectronicProduct(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      brand: json['brand'],
      description: json['description'],
      price: json['price'],
      color: json['color'],
      img: json['img'],
      likes: json['likes'],
    );
  }

  factory ElectronicProduct.empty(){
    return ElectronicProduct(
        id: 0,
        name: "",
        category: "",
        brand: "",
        description: "",
        price: "",
        color: "",
        img: "",
        likes: 0
    );

  }
}

class UserModel {
  final String uid;
  final String username;
  final String email;


  UserModel(
      {required this.username,
        required this.email,
        required this.uid
      });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      uid: json['_id'] ?? ''
  );

  UserModel copyWith(
      {
        String? username,
        String? email,
        String? uid,
      }) {
    return UserModel(
        username: username ?? this.username,
        email: email ?? this.email,
        uid: uid ?? this.uid);
  }
}


class ErrorModel {
  final String? error;
  final dynamic data;

  ErrorModel({required this.error, required this.data});
}

final List<ElectronicProduct> smartphones = [
  ElectronicProduct(
      id: 1,
      name: "Infinix Hot 50i",
      category: "SmartPhones",
      brand: "Infinix",
      description:
      "This is an Infinix Hot 50i 6.78 4GB RAM/128GB ROM Android 13- Black",
      price: "138730",
      color: "black",
      img: "assets/images/smartphones/infinixhot50-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 2,
      name: "Infinix Hot 50 Pro",
      category: "SmartPhones",
      brand: "Infinix",
      description:
      "This is an Infinix Hot 50 Pro+ 6.78 8GB RAM/128GB ROM Android 14- Titanium",
      price: "284431",
      color: "Silver",
      img:
      "assets/images/smartphones/Buy Vivo Y51 (4G 4GB 128GB Jazzy Blue) With Official Warranty at Best Price in Pakistan.png",
      likes: 2),
  ElectronicProduct(
      id: 3,
      name: "iPhone 11 PRO MAX",
      category: "SmartPhones",
      brand: "Apple",
      description:
      "This is an Apple iPhone 11 Pro Max-64GB/256GB Network Unlocked -Very Good Condition",
      price: "384431",
      color: "Gold",
      img: "assets/images/smartphones/iphone11-removebg-preview.png",
      likes: 4),
  ElectronicProduct(
      id: 4,
      name: "iPhone 13 PRO MAX",
      category: "SmartPhones",
      brand: "Apple",
      description:
      "This is an Apple iPhone 13 Pro Max-64GB/256GB Network Unlocked -Very Good Condition",
      price: "584431",
      color: "black",
      img: "assets/images/smartphones/iphone13-removebg-preview.png",
      likes: 4),
  ElectronicProduct(
      id: 5,
      name: "itelP55T 6.56″ HD",
      category: "SmartPhones",
      brand: "Itel",
      description:
      "This is an itel P55T 6.56″ HD +Hole 4GB RAM/128GB ROM Android 14 - Gold",
      price: "115000",
      color: "Gold",
      img: "assets/images/smartphones/itelP55t-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 6,
      name: "itel S23",
      category: "SmartPhones",
      brand: "Itel",
      description:
      "This is an itel S23 + 6.78 FHD 8GB RAM/256GB ROM Android 12 - Cyan",
      price: "198000",
      color: "Cyan",
      img: "assets/images/smartphones/itelS23-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 7,
      name: "Samsung Galaxy AO6",
      category: "SmartPhones",
      brand: "Samsung",
      description:
      "This is a Samsung Galaxy A06 6.7 4GB RAM/64GB ROM Android 14",
      price: "144327",
      color: "black",
      img: "assets/images/smartphones/samsunggalaxya06-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 8,
      name: "Samsung Galaxy A16",
      category: "SmartPhones",
      brand: "Samsung",
      description:
      "This is a Samsung Galaxy A16 6.7 HD 4GB RAM/128GB ROM Android 14 5000mah",
      price: "224722",
      color: "Light Green",
      img: "assets/images/smartphones/samsunggalaxya16-removebg-preview.png",
      likes: 4),
  ElectronicProduct(
      id: 9,
      name: "Tecno POP 8",
      category: "SmartPhones",
      brand: "Tecno",
      description:
      "This is a Tecno POP 8 (BG6) 6.6 HD+,2GB RAM + 64GB ROM 5000mAh, 8MP ",
      price: "105576",
      color: "black",
      img: "assets/images/smartphones/technopop8-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 10,
      name: "Tecno POP 9",
      category: "SmartPhones",
      brand: "Tecno",
      description: "This is a Tecno Pop 9 6.67 3GB RAM /64GB ROM Android 14",
      price: "124765",
      color: "white",
      img: "assets/images/smartphones/technopop9-removebg-preview.png",
      likes: 2),
];


final List<ElectronicProduct> fridges = [
  ElectronicProduct(
      id: 11,
      name: "Haier Thermocool Freezer",
      category: "Fridge",
      brand: "Haier Thermacool",
      description:
      "This is a Haier Thermocool 146 Litres Chest Freezer (HTF-150) ",
      price: "344785",
      color: "Silver",
      img: "assets/images/fridge/freezerone-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 12,
      name: "Haier Thermocool Freezer",
      category: "Fridge",
      brand: "Haier Thermacool",
      description:
      "This is a Haier Thermocool 429 Litres Inverter Series Chest Freezer (HTF-150) ",
      price: "1350500",
      color: "Silver",
      img: "assets/images/fridge/freezer-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 13,
      name: "Hisense Freezer",
      category: "Fridge",
      brand: "Hisense",
      description: "This is a Hisense Fast Chilling Double Door Fridge",
      price: "387500",
      color: "white",
      img: "assets/images/fridge/thermacoolfridge-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 14,
      name: "Hisense Freezer",
      category: "Fridge",
      brand: "Hisense",
      description: "This is a Hisense 150 Litres Single Door Fridge",
      price: "239900",
      color: "Silver",
      img: "assets/images/fridge/fridgethree-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 15,
      name: "Scanfrost Freezer",
      category: "Fridge",
      brand: "Scanfrost",
      description: "This is a Scanfrost 150 Litres Double Door Fridge",
      price: "239900",
      color: "white",
      img: "assets/images/fridge/myfreezer-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 16,
      name: "Scanfrost Freezer",
      category: "Fridge",
      brand: "Scanfrost",
      description: "This is a Scanfrost 150 Litres Double Door Fridge",
      price: "239900",
      color: "white",
      img: "assets/images/fridge/freezer9-removebg-preview.png",
      likes: 4),
  ElectronicProduct(
      id: 17,
      name: "Nexus Freezer",
      category: "Fridge",
      brand: "Nexus",
      description:
      "This is a Nexus 44 Liters Single Door No-Frost Refrigerator",
      price: "239900",
      color: "black",
      img: "assets/images/fridge/fridgefour-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 18,
      name: "Nexus Freezer",
      category: "Fridge",
      brand: "Nexus",
      description:
      "This is a Nexus 44 Liters Double Door No-Frost Refrigerator",
      price: "400000",
      color: "white",
      img: "assets/images/fridge/fridgefive-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 19,
      name: "Polystar Freezer",
      category: "Fridge",
      brand: "Polystar",
      description:
      "This is a Polystar 44 Liters Double Door No-Frost Refrigerator",
      price: "450000",
      color: "white",
      img: "assets/images/fridge/freezerfour-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 20,
      name: "Polystar Freezer",
      category: "Fridge",
      brand: "Polystar",
      description:
      "This is a Polystar 44 Liters Double Door No-Frost Refrigerator",
      price: "400000",
      color: "white",
      img: "assets/images/fridge/fridgesix-removebg-preview.png",
      likes: 2),
];

final List<ElectronicProduct> airConditioners = [
  ElectronicProduct(
      id: 21,
      name: "Hisense Air Conditioner",
      category: "AC",
      brand: "Hisense",
      description:
          "This is Hisense 1.0HP Inverter Split Air Conditioner(GAC-S09R4I-E) + 12 Months Warranty & Installation Kit",
      price: "366676",
      color: "white",
      img: "assets/images/ac/airconditionone-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
    id: 22,
    name: "Hisense Air Conditioner",
    category: "AC",
    brand: "Hisense",
    description:
        "This is a Hisense 1HP Copper Coil Split Air Conditioner (AS09TG)",
    price: "314900",
    color: "white",
    img: "assets/images/ac/airconditiontwo-removebg-preview.png",
    likes: 5,
  ),
  ElectronicProduct(
      id: 23,
      name: "Haier Thermocool Air Conditioner",
      category: "AC",
      brand: "Haier Thermocool",
      description:
          "This is a Haier Thermocool 1HP Quantum Air Conditioner (HSU-09CFQE-QW01)",
      price: "360000",
      color: "white",
      img: "assets/images/ac/airconditionthree-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 24,
      name: "Haier Thermocool Air Conditioner",
      category: "AC",
      brand: "Haier Thermocool",
      description:
          "This is a Haier Thermocool 3hp Floor Standing Inverter Air Conditioner",
      price: "1380500",
      color: "white",
      img: "assets/images/ac/airconditionfour-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 25,
      name: "Samsung Air Conditioner",
      category: "AC",
      brand: "Samsung",
      description: "This is a Samsung 1hp Inverter Air Conditioner",
      price: "380500",
      color: "white",
      img: "assets/images/ac/airconditionfive-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 26,
      name: "Samsung Air Conditioner",
      category: "AC",
      brand: "Samsung",
      description: "This is a Samsung 1hp Inverter Air Conditioner",
      price: "380500",
      color: "white",
      img: "assets/images/ac/airconditionsix-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 27,
      name: "Panasonic Air Conditioner",
      category: "AC",
      brand: "Panasonic",
      description: "This is a Panasonic 1hp Inverter Air Conditioner",
      price: "380500",
      color: "white",
      img: "assets/images/ac/airconditionseven-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 28,
      name: "Panasonic Air Conditioner",
      category: "AC",
      brand: "Panasonic",
      description: "This is a Panasonic 1hp Inverter Air Conditioner",
      price: "380500",
      color: "white",
      img: "assets/images/ac/airconditioneight-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 29,
      name: "LG Air Conditioner",
      category: "AC",
      brand: "LG",
      description: "This is a LG 1hp Inverter Air Conditioner",
      price: "380500",
      color: "white",
      img: "assets/images/ac/airconditionnine-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 30,
      name: "LG Air Conditioner",
      category: "AC",
      brand: "LG",
      description: "This is a LG 1hp Inverter Air Conditioner",
      price: "380500",
      color: "white",
      img: "assets/images/ac/airconditionten-removebg-preview.png",
      likes: 2),
];

final List<ElectronicProduct> smartwatches = [
  ElectronicProduct(
      id: 31,
      name: "Bluetooth SmartWatch",
      category: "SmartWatch",
      brand: "Apple",
      description:
          "This is a wristWatch A1 Bluetooth Smart Watch With SIM Camera",
      price: "18965",
      color: "black",
      img: 'assets/images/smartwatch/watch-removebg-preview.png',
      likes: 2),
  ElectronicProduct(
      id: 32,
      name: "U8 Mobile Phone Watch",
      category: "SmartWatch",
      brand: "Oraimo",
      description:
          "This is a U8 Mobile Phone Watch With SIM And Memory Card Port Smart Watch",
      price: "27000",
      color: "black",
      img: "assets/images/smartwatch/watchtwoi-removebg-preview.png",
      likes: 5),
  ElectronicProduct(
      id: 33,
      name: "Z93 Pro Amoled Round Smart Watch",
      category: "SmartWatch",
      brand: "Oraimo",
      description:
          "This is a Z93 Pro Amoled Round Smart Watch For Android And iOS devices",
      price: "30000",
      color: "black",
      img: "assets/images/smartwatch/watchthree_jpeg-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 34,
      name: "Series 8 Smartwatch ",
      category: "SmartWatch",
      brand: "Rolex",
      description:
          "This is a Series 8 Smartwatch For Bluetooth Calls/Messages (RoundHead)",
      price: "25850",
      color: "black",
      img: "assets/images/smartwatch/watchfour-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 35,
      name: "Oraimo Nova V 2.01 HD Video Watch",
      category: "SmartWatch",
      brand: "Oraimo",
      description: "Oraimo Nova V 2.01 HD Video Watch Faces Smart Watch ",
      price: "980000",
      color: "black",
      img: "assets/images/smartwatch/watchfive-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 36,
      name: " T91 SmartWatch ",
      category: "SmartWatch",
      brand: "Apple",
      description:
          "This is an Oraimo Nova V 2.01 HD Video Watch Faces Smart Watch",
      price: "980000",
      color: "black",
      img: "assets/images/smartwatch/watchsix-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 37,
      name: "Series 8 Smartwatch",
      category: "SmartWatch",
      brand: "Rolex",
      description:
          "This is a  Series 8 Smartwatch Use For Bluetooth Calls/Messages",
      price: "980000",
      color: "black",
      img: "assets/images/smartwatch/watchseven-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 38,
      name: "Huawei Watch Buds Smartwatch",
      category: "SmartWatch",
      brand: "Huawei",
      description:
          "This is a Huawei Watch Buds Smartwatch With Wireless Earphones - Black ₦ 600,000",
      price: "45000",
      color: "black",
      img: "assets/images/smartwatch/watcheight-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 39,
      name: "Oraimo Watch Nova AM 2.01",
      category: "SmartWatch",
      brand: "Oraimo",
      description:
          "Oraimo Watch Nova AM 2.01 AMOLED Screen Curved Cover Smart Watch",
      price: "65000",
      color: "black",
      img: "assets/images/smartwatch/watchnine-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 40,
      name: "Oraimo BT Call, Health Monitor watch",
      category: "SmartWatch",
      brand: "Oraimo",
      description:
          "This is an Oraimo BT Call, Health Monitor watch 4Plus SMART WATCH",
      price: "60000",
      color: "black",
      img: "assets/images/smartwatch/watchten-removebg-preview.png",
      likes: 2),
];

final List<ElectronicProduct> headphones = [
  ElectronicProduct(
      id: 41,
      name: "Headphone",
      category: "Headphone",
      brand: "Sennheiser",
      description: "This is a Sennheiser Headphone",
      price: "30000",
      color: "Black",
      img: "assets/images/headphones/h1.png",
      likes: 5),
  ElectronicProduct(
      id: 42,
      name: "Headphone",
      category: "Headphone",
      brand: "XTrust",
      description: "This is a XTrust Headphone",
      price: "20000",
      color: "Black",
      img: "assets/images/headphones/h2.png",
      likes: 2),
  ElectronicProduct(
      id: 43,
      name: "Headphone",
      category: "Headphone",
      brand: "Fiver",
      description: "This is a Fiver Headphone",
      price: "30000",
      color: "White",
      img: "assets/images/headphones/h3-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 44,
      name: "Headphone",
      category: "Headphone",
      brand: "Beat By Dre",
      description: "This is a Beat By Dre Headphone",
      price: "40000",
      color: "White",
      img: "assets/images/headphones/h4-removebg-preview.png",
      likes: 5),
  ElectronicProduct(
      id: 45,
      name: "Headphone",
      category: "Headphone",
      brand: "Beat By Dre",
      description: "This is a Beat By Dre Headphone",
      price: "40000",
      color: "White",
      img: "assets/images/headphones/h5-removebg-preview.png",
      likes: 4),
  ElectronicProduct(
      id: 46,
      name: "Headphone",
      category: "Headphone",
      brand: "Beat By Dre",
      description: "This is a Beat By Dre Headphone",
      price: "40000",
      color: "White",
      img: "assets/images/headphones/h6-removebg-preview.png",
      likes: 6),
  ElectronicProduct(
      id: 47,
      name: "Headphone",
      category: "Headphone",
      brand: "Beat By Dre",
      description: "This is a Beat By Dre Headphone",
      price: "40000",
      color: "Red",
      img: "assets/images/headphones/h7-removebg-preview.png",
      likes: 8),
  ElectronicProduct(
      id: 48,
      name: "Headphone",
      category: "Headphone",
      brand: "Beat By Dre",
      description: "This is a Beat By Dre Headphone",
      price: "40000",
      color: "Red",
      img: "assets/images/headphones/h8-removebg-preview.png",
      likes: 5),
  ElectronicProduct(
      id: 49,
      name: "Headphone",
      category: "Headphone",
      brand: "Beat By Dre",
      description: "This is a Beat By Dre Headphone",
      price: "40000",
      color: "Deep Black",
      img: "assets/images/headphones/h9.png",
      likes: 12),
  ElectronicProduct(
      id: 50,
      name: "Headphone",
      category: "Headphone",
      brand: "Beat By Dre",
      description: "This is a Beat By Dre Headphone",
      price: "40000",
      color: "Deep Black",
      img: "assets/images/headphones/h10-removebg-preview.png",
      likes: 15),
];

final List<ElectronicProduct> laptops = [
  ElectronicProduct(
      id: 51,
      name: "laptop",
      category: "Laptop",
      brand: "Hp",
      description: "This is a laptop",
      price: "100000",
      color: "White",
      img: "assets/images/laptops/laptop1-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 52,
      name: "laptop",
      category: "Laptop",
      brand: "Samsung",
      description: "This is a laptop",
      price: "200000",
      color: "Black",
      img: "assets/images/laptops/laptop2-removebg-preview.png",
      likes: 1),
  ElectronicProduct(
      id: 53,
      name: "laptop",
      category: "Laptop",
      brand: "Hp",
      description: "This is a laptop",
      price: "100000",
      color: "Black",
      img: "assets/images/laptops/laptop3-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 54,
      name: "laptop",
      category: "Laptop",
      brand: "Hp",
      description: "This is a laptop",
      price: "100000",
      color: "Grey",
      img: "assets/images/laptops/laptop4-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 55,
      name: "laptop",
      category: "Laptop",
      brand: "Hp",
      description: "This is a laptop",
      price: "300000",
      color: "Gold",
      img: "assets/images/laptops/laptop5-removebg-preview.png",
      likes: 4),
  ElectronicProduct(
      id: 56,
      name: "laptop",
      category: "Laptop",
      brand: "Dell",
      description: "This is a laptop",
      price: "100000",
      color: "Black",
      img: "assets/images/laptops/laptop6-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 57,
      name: "laptop",
      category: "Laptop",
      brand: "Acer",
      description: "This is a laptop",
      price: "100000",
      color: "Black",
      img: "assets/images/laptops/laptop7-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 58,
      name: "laptop",
      category: "Laptop",
      brand: "Macbook",
      description: "This is a laptop",
      price: "100000",
      color: "White",
      img: "assets/images/laptops/laptop8.png",
      likes: 3),
  ElectronicProduct(
      id: 59,
      name: "laptop",
      category: "Laptop",
      brand: "Macbook",
      description: "This is a laptop",
      price: "300000",
      color: "Grey",
      img: "assets/images/laptops/laptop9-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 60,
      name: "laptop",
      category: "Laptop",
      brand: "Macbook",
      description: "This is a laptop",
      price: "100000",
      color: "White",
      img: "assets/images/laptops/laptop10-removebg-preview.png",
      likes: 3),
];

final List<ElectronicProduct> televisions = [
  ElectronicProduct(
      id: 61,
      name: "Hisense 43''Smart TV",
      category: "Television",
      brand: "Hisense",
      description:
          "This is a Hisense 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: "450000",
      color: "black",
      img: "assets/images/televisions/hisensetv-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 62,
      name: "Polystar 43''Smart TV",
      category: "Television",
      brand: "Polystar",
      description:
          "This is a Polystar 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: "700000",
      color: "black",
      img: "assets/images/televisions/Polystar-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 63,
      name: "Samsung 43''Smart TV",
      category: "Television",
      brand: "Samsung",
      description:
          "This is a Samsung 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: "700000",
      color: "black",
      img: "assets/images/televisions/samsungtv-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 64,
      name: "Nexus 43''Smart TV",
      category: "Television",
      brand: "Nexus",
      description:
          "This is a Nexus 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: "400000",
      color: "black",
      img: "assets/images/televisions/Nexustv-removebg-preview.png",
      likes: 4),
  ElectronicProduct(
      id: 65,
      name: "Royal 43''Smart TV",
      category: "Television",
      brand: "Royal",
      description:
          "This is a Royal 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: "500000",
      color: "black",
      img: "assets/images/televisions/royaltv-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 66,
      name: "Hisense 43''Smart TV",
      category: "Television",
      brand: "Hisense",
      description:
          "This is a Hisense 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: "450000",
      color: "black",
      img: "assets/images/televisions/Amanitv-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 67,
      name: "Polystar 43''Smart TV",
      category: "Television",
      brand: "Polystar",
      description:
          "This is a Polystar 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: "700000",
      color: "black",
      img: "assets/images/televisions/Hikerstv-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      id: 68,
      name: "Samsung 43''Smart TV",
      category: "Television",
      brand: "Samsung",
      description:
          "This is a Samsung 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: "700000",
      color: "black",
      img: "assets/images/televisions/infinitytv-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      id: 69,
      name: "Nexus 43''Smart TV",
      category: "Television",
      brand: "Nexus",
      description:
          "This is a Nexus 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: "400000",
      color: "black",
      img: "assets/images/televisions/sonixtv-removebg-preview.png",
      likes: 4),
  ElectronicProduct(
      id: 70,
      name: "Royal 43''Smart TV",
      category: "Television",
      brand: "Royal",
      description:
          "This is a Royal 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: "500000",
      color: "black",
      img: "assets/images/televisions/ufctv-removebg-preview.png",
      likes: 2),
];

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
  "Size",
  "Color",
  "Price",
  "Brand",
];
