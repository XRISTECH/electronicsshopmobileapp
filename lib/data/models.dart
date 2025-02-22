class ElectronicProduct {
  final String name;
  final String category;
  final String brand;
  final String description;
  final double price;
  final String color;
  final String img;
  final int likes;

  ElectronicProduct({
    required this.name,
    required this.category,
    required this.brand,
    required this.description,
    required this.price,
    required this.color,
    required this.img,
    required this.likes,
  });
}

final List<ElectronicProduct> smartphones = [
  ElectronicProduct(
      name: "Infinix Hot 50i",
      category: "SmartPhones",
      brand: "Infinix",
      description: "This is an Infinix Hot 50i 6.78 4GB RAM/128GB ROM Android 13- Black",
      price: 138730,
      color: "black",
      img: "assets/images/smartphones/infinixhot50.jpg",
      likes: 3
  ),
  ElectronicProduct(
      name: "Infinix Hot 50 Pro",
      category: "SmartPhones",
      brand: "Infinix",
      description: "This is an Infinix Hot 50 Pro+ 6.78 8GB RAM/128GB ROM Android 14- Titanium",
      price:  284431,
      color: "Silver",
      img: "assets/images/smartphones/infinixhot50pro.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "iPhone 11 PRO MAX",
      category: "SmartPhones",

      brand: "Apple",

      description: "This is an Apple iPhone 11 Pro Max-64GB/256GB Network Unlocked -Very Good Condition",
      price:  384431,

      color: "Gold",
      img: "assets/images/smartphones/iphone11.jpg",
      likes: 4
  ),
  ElectronicProduct(
      name: "iPhone 13 PRO MAX",
      category: "SmartPhones",

      brand: "Apple",

      description: "This is an Apple iPhone 13 Pro Max-64GB/256GB Network Unlocked -Very Good Condition",
      price:  584431,

      color: "black",
      img: "assets/images/smartphones/iphone13.jpg",
      likes: 4
  ),
  ElectronicProduct(
      name: "itelP55T 6.56″ HD",
      category: "SmartPhones",

      brand: "Itel",
      description: "This is an itel P55T 6.56″ HD +Hole 4GB RAM/128GB ROM Android 14 - Gold",
      price: 115000,
      color: "Gold",
      img: "assets/images/smartphones/itelP55t.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "itel S23",
      category: "SmartPhones",

      brand: "Itel",
      description: "This is an itel S23 + 6.78 FHD 8GB RAM/256GB ROM Android 12 - Cyan",

      price: 198000,
      color: "Cyan",
      img: "assets/images/smartphones/itelS23.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Samsung Galaxy AO6",
      category: "SmartPhones",
      brand: "Samsung",
      description: "This is a Samsung Galaxy A06 6.7 4GB RAM/64GB ROM Android 14",
      price: 144327,
      color: "black",
      img: "assets/images/smartphones/samsunggalaxya06.jpg",
      likes: 3
  ),
  ElectronicProduct(
      name: "Samsung Galaxy A16",

      category: "SmartPhones",

      brand: "Samsung",

      description: "This is a Samsung Galaxy A16 6.7 HD 4GB RAM/128GB ROM Android 14 5000mah",
      price: 224722,
      color: "Light Green",
      img: "assets/images/smartphones/samsunggalaxya16.jpg",
      likes: 4
  ),
  ElectronicProduct(
      name: "Tecno POP 8",
      category: "SmartPhones",

      brand: "Tecno",

      description: "This is a Tecno POP 8 (BG6) 6.6 HD+,2GB RAM + 64GB ROM 5000mAh, 8MP ",
      price: 105576,
      color: "black",
      img: "assets/images/smartphones/technopop8.jpg",
      likes: 3
  ),
  ElectronicProduct(
      name: "Tecno POP 9",
      category: "SmartPhones",

      brand: "Tecno",

      description: "This is a Tecno Pop 9 6.67 3GB RAM /64GB ROM Android 14",
      price: 124765,
      color: "white",
      img: "assets/images/smartphones/technopop9.jpg",
      likes: 2
  ),
];

final List<ElectronicProduct> fridge = [
  ElectronicProduct(
      name: "Haier Thermocool Freezer",
      category: "Fridge",
      brand: "Haier Thermacool",
      description: "This is a Haier Thermocool 146 Litres Chest Freezer (HTF-150) ",
      price: 344785,
      color: "Silver",
      img: "assets/images/fridge/freezer.jpg",
      likes: 3
  ),
  ElectronicProduct(
      name: "Haier Thermocool Freezer",
      category: "Fridge",
      brand: "Haier Thermacool",
      description: "This is a Haier Thermocool 429 Litres Inverter Series Chest Freezer (HTF-150) ",
      price: 1350500,
      color: "Silver",
      img: "assets/images/fridge/freezerone.jpg",
      likes: 3
      ),
  ElectronicProduct(
      name: "Hisense Freezer",
      category: "Fridge",
      brand: "Hisense",
      description: "This is a Hisense Fast Chilling Double Door Fridge",
      price: 387500,
      color: "white",
      img: "assets/images/fridge/thermacoolfridge.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Hisense Freezer",
      category: "Fridge",
      brand: "Hisense",

      description: "This is a Hisense 150 Litres Single Door Fridge",
      price: 239900,
      color: "Silver",
      img: "assets/images/fridge/fridgethree.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Scanfrost Freezer",
      category: "Fridge",

      brand: "Scanfrost",

      description: "This is a Scanfrost 150 Litres Double Door Fridge",

      price: 239900,

      color: "white",
      img: "assets/images/fridge/fridgesix.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Scanfrost Freezer",
      category: "Fridge",
      brand: "Scanfrost",


      description: "This is a Scanfrost 150 Litres Double Door Fridge",

      price: 239900,

      color: "white",

      img: "assets/images/fridge/fridgenexus.jpg",
      likes: 4
  ),
  ElectronicProduct(
      name: "Nexus Freezer",
      category: "Fridge",

      brand: "Nexus",
      description: "This is a Nexus 44 Liters Single Door No-Frost Refrigerator",
      price: 239900,

      color: "black",
      img: "assets/images/fridge/fridgefour.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Nexus Freezer",
      category: "Fridge",

      brand: "Nexus",

      description: "This is a Nexus 44 Liters Double Door No-Frost Refrigerator",

      price: 400000,
      color: "white",
      img: "assets/images/fridge/fridgefive.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Polystar Freezer",
      category: "Fridge",
      brand: "Polystar",
      description: "This is a Polystar 44 Liters Double Door No-Frost Refrigerator",

      price: 450000,
      color: "white",
      img: "assets/images/fridge/freezerfour.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Polystar Freezer",
      category: "Fridge",

      brand: "Polystar",
      description: "This is a Polystar 44 Liters Double Door No-Frost Refrigerator",

      price: 400000,
      color: "white",
      img: "assets/images/fridge/freezer9.jpg",
      likes: 2
  ),
];

final List<ElectronicProduct> ac = [
  ElectronicProduct(
      name: "Hisense Air Conditioner",
      category: "AC",
      brand: "Hisense",
      description: "This is Hisense 1.0HP Inverter Split Air Conditioner(GAC-S09R4I-E) + 12 Months Warranty & Installation Kit",
      price: 366676,
      color: "white",
      img: "assets/images/ac/airconditionone.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Hisense Air Conditioner",

      category: "AC",

      brand: "Hisense",

      description: "This is a Hisense 1HP Copper Coil Split Air Conditioner (AS09TG)",
      price: 314900,
      color: "white",

      img: "assets/images/ac/airconditiontwo.jpg",
      likes: 5,
  ),
  ElectronicProduct(
      name: "Haier Thermocool Air Conditioner",
      category: "AC",

      brand: "Haier Thermocool",
      description: "This is a Haier Thermocool 1HP Quantum Air Conditioner (HSU-09CFQE-QW01)",
      price: 360000,
      color: "white",
      img: "assets/images/ac/airconditionthree.jpg",
      likes: 3
  ),
  ElectronicProduct(
      name: "Haier Thermocool Air Conditioner",
      category: "AC",

      brand: "Haier Thermocool",

      description: "This is a Haier Thermocool 3hp Floor Standing Inverter Air Conditioner",
      price: 1380500,
      color: "white",
      img: "assets/images/ac/airconditionfour.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Samsung Air Conditioner",
      category: "AC",

      brand: "Samsung",

      description: "This is a Samsung 1hp Inverter Air Conditioner",
      price: 380500,
      color: "white",
      img: "assets/images/ac/airconditionfive.jpeg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Samsung Air Conditioner",
      category: "AC",

      brand: "Samsung",

      description: "This is a Samsung 1hp Inverter Air Conditioner",
      price: 380500,
      color: "white",
      img: "assets/images/ac/airconditionsix.jpeg",
      likes: 2
      ),
  ElectronicProduct(
      name: "Panasonic Air Conditioner",
      category: "AC",

      brand: "Panasonic",

      description: "This is a Panasonic 1hp Inverter Air Conditioner",
      price: 380500,
      color: "white",
      img: "assets/images/ac/airconditionseven.jpeg",
      likes: 2
      ),
  ElectronicProduct(
      name: "Panasonic Air Conditioner",
      category: "AC",

      brand: "Panasonic",

      description: "This is a Panasonic 1hp Inverter Air Conditioner",
      price: 380500,
      color: "white",
      img: "assets/images/ac/airconditioneight.jpg",
      likes: 2
      ),
  ElectronicProduct(
      name: "LG Air Conditioner",
      category: "AC",

      brand: "LG",

      description: "This is a LG 1hp Inverter Air Conditioner",
      price: 380500,
      color: "white",
      img: "assets/images/ac/airconditionnine.jpeg",
      likes: 2

     ),
  ElectronicProduct(
      name: "LG Air Conditioner",
      category: "AC",

      brand: "LG",

      description: "This is a LG 1hp Inverter Air Conditioner",
      price: 380500,
      color: "white",
      img: "assets/images/ac/airconditionten.jpeg",
      likes: 2
      ),
];

final List<ElectronicProduct> smartwatch = [
  ElectronicProduct(
      name: "Bluetooth SmartWatch",
      category: "SmartWatch",
      brand: "Apple",
      description:
          "This is a wristWatch A1 Bluetooth Smart Watch With SIM Camera",
      price: 18965,
      color: "black",
      img: 'assets/images/smartwatch/watch-removebg-preview.png',
      likes: 2),
  ElectronicProduct(
      name: "U8 Mobile Phone Watch",
      category: "SmartWatch",
      brand: "Oraimo",
      description:
          "This is a U8 Mobile Phone Watch With SIM And Memory Card Port Smart Watch",
      price: 27000,
      color: "black",
      img: "assets/images/smartwatch/watchtwo-removebg-preview.png",
      likes: 5),
  ElectronicProduct(
      name: "Z93 Pro Amoled Round Smart Watch",
      category: "SmartWatch",
      brand: "Oraimo",
      description:
          "This is a Z93 Pro Amoled Round Smart Watch For Android And iOS devices",
      price: 30000,
      color: "black",
      img: "assets/images/smartwatch/watchthree_jpeg-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      name: "Series 8 Smartwatch ",
      category: "SmartWatch",
      brand: "Rolex",
      description:
          "This is a Series 8 Smartwatch For Bluetooth Calls/Messages (RoundHead)",
      price: 25850,
      color: "black",
      img: "assets/images/smartwatch/watchfour-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      name: "Oraimo Nova V 2.01 HD Video Watch",
      category: "SmartWatch",
      brand: "Oraimo",
      description: "Oraimo Nova V 2.01 HD Video Watch Faces Smart Watch ",
      price: 980000,
      color: "black",
      img: "assets/images/smartwatch/watchfive-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      name: " T91 SmartWatch ",
      category: "SmartWatch",
      brand: "Apple",
      description:
          "This is an Oraimo Nova V 2.01 HD Video Watch Faces Smart Watch",
      price: 980000,
      color: "black",
      img: "assets/images/smartwatch/watchsix-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      name: "Series 8 Smartwatch",
      category: "SmartWatch",
      brand: "Rolex",
      description:
          "This is a  Series 8 Smartwatch Use For Bluetooth Calls/Messages",
      price: 980000,
      color: "black",
      img: "assets/images/smartwatch/watchseven-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      name: "Huawei Watch Buds Smartwatch",
      category: "SmartWatch",
      brand: "Huawei",
      description:
          "This is a Huawei Watch Buds Smartwatch With Wireless Earphones - Black ₦ 600,000",
      price: 45000,
      color: "black",
      img: "assets/images/smartwatch/watcheight-removebg-preview.png",
      likes: 3),
  ElectronicProduct(
      name: "Oraimo Watch Nova AM 2.01",
      category: "SmartWatch",
      brand: "Oraimo",
      description:
          "Oraimo Watch Nova AM 2.01 AMOLED Screen Curved Cover Smart Watch",
      price: 65000,
      color: "black",
      img: "assets/images/smartwatch/watchnine-removebg-preview.png",
      likes: 2),
  ElectronicProduct(
      name: "Oraimo BT Call, Health Monitor watch",
      category: "SmartWatch",
      brand: "Oraimo",
      description:
          "This is an Oraimo BT Call, Health Monitor watch 4Plus SMART WATCH",
      price: 60000,
      color: "black",
      img: "assets/images/smartwatch/watchten-removebg-preview.png",
      likes: 2),
];

final List<ElectronicProduct> headphone = [
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
];

final List<ElectronicProduct> laptop = [
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
  ElectronicProduct(
      name: name,
      category: category,
      brand: brand,
      description: description,
      price: price,
      color: color,
      img: img,
      likes: likes),
];

final List<ElectronicProduct> television = [
  ElectronicProduct(
      name: "Hisense 43''Smart TV",
      category: "Television",
      brand: "Hisense",
      description: "This is a Hisense 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: 450000,
      color: "black",
      img: "assets/images/televisions/hisensetv.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Polystar 43''Smart TV",
      category: "Television",
      brand: "Polystar",


      description: "This is a Polystar 43''Smart TV With Bluetooth,Netflix,Youtube",

      price: 700000,
      color: "black",

      img: "assets/images/televisions/Polystar.jpg",
      likes:  3
  ),
  ElectronicProduct(
      name: "Samsung 43''Smart TV",
      category: "Television",

      brand: "Samsung",

      description: "This is a Samsung 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: 700000,

      color: "black",

      img: "assets/images/televisions/samsungtv.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Nexus 43''Smart TV",

      category: "Television",

      brand: "Nexus",
      description: "This is a Nexus 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: 400000,
      color: "black",
      img: "assets/images/televisions/Nexustv.jpg",
      likes: 4
  ),
  ElectronicProduct(
      name: "Royal 43''Smart TV",

      category: "Television",

      brand: "Royal",
      description: "This is a Royal 43''Smart TV With Bluetooth,Netflix,Youtube",

      price: 500000,
      color: "black",
      img: "assets/images/televisions/royaltv.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Hisense 43''Smart TV",
      category: "Television",
      brand: "Hisense",
      description: "This is a Hisense 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: 450000,
      color: "black",
      img: "assets/images/televisions/Amanitv.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Polystar 43''Smart TV",
      category: "Television",
      brand: "Polystar",


      description: "This is a Polystar 43''Smart TV With Bluetooth,Netflix,Youtube",

      price: 700000,
      color: "black",

      img: "assets/images/televisions/Hikerstv.jpg",
      likes:  3
  ),
  ElectronicProduct(
      name: "Samsung 43''Smart TV",
      category: "Television",

      brand: "Samsung",

      description: "This is a Samsung 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: 700000,

      color: "black",

      img: "assets/images/televisions/infinitytv.jpg",
      likes: 2
  ),
  ElectronicProduct(
      name: "Nexus 43''Smart TV",

      category: "Television",

      brand: "Nexus",
      description: "This is a Nexus 43''Smart TV With Bluetooth,Netflix,Youtube",
      price: 400000,
      color: "black",
      img: "assets/images/televisions/sonixtv.jpg",
      likes: 4
  ),
  ElectronicProduct(
      name: "Royal 43''Smart TV",

      category: "Television",

      brand: "Royal",
      description: "This is a Royal 43''Smart TV With Bluetooth,Netflix,Youtube",

      price: 500000,
      color: "black",
      img: "assets/images/televisions/ufctv.jpg",
      likes: 2
  ),
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
    image: "images/31217926-7524-4c61-841b-5c7d12ef0416.png",
  ),
  Category(
    name: "Fridge",
    image: "images/Samsung Family Hub™️ _ Samsung US _ undefined undefined.png",
  ),
  Category(
    name: "AC",
    image: "images/Air Conditioner (2).png",
  ),
  Category(
    name: "SmartWatch",
    image:
        "images/Apple Watch Repair Service in Dubai Abu Dhabi Sharjah UAE.png",
  ),
  Category(
    name: "HeadPhone",
    image:
        "images/Sennheiser Headphone PNG Images (Transparent HD Photo Clipart).png",
  ),
  Category(
    name: "Laptop",
    image:
        "images/Download Dell Laptop Png Images Background png - Free PNG Images.png",
  ),
  Category(
    name: "Television",
    image: "images/tv-removebg-preview.png",
  ),
];
