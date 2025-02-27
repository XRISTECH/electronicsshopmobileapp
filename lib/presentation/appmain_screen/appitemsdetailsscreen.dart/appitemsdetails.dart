import 'package:electronicsshop_app/cores/app_exports.dart';
import 'package:flutter/material.dart';

class AppItemsDetails extends StatefulWidget {
  const AppItemsDetails({super.key});

  @override
  State<AppItemsDetails> createState() => _AppItemsDetailsState();
}

class _AppItemsDetailsState extends State<AppItemsDetails> {
  int currentIndex = 0;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  final List<Color> availableColors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple];
  final List<String> availableSizes = ["S", "M", "L", "XL", "XXL"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Details Product",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.shopping_bag_rounded,
                size: 28,
                color: Colors.white,
              ),
              Positioned(
                right: -3,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          // Product Image Slider
          Container(
            color: Colors.black,
            height: 308,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      ImageConstants.smartwatchImage, // Ensure this exists
                      height: 270,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                            (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 4),
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == currentIndex
                                ? Colors.pink
                                : Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 19),

          // Product Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SmartWatch", style: TextStyle(color: Colors.white)),
                  Text("Apple", style: TextStyle(color: Colors.white)),
                  Text("N 1,200,000", style: TextStyle(color: Colors.white)),
                ],
              ),
              Icon(Icons.favorite, color: Colors.white),
            ],
          ),

          const SizedBox(height: 10),

          // Product Description
          const Text(
            "Hello my friend. This is a wristwatch A1 Bluetooth Smart Watch with SIM and Camera.",
            style: TextStyle(color: Colors.white),
          ),

          const SizedBox(height: 20),

          // Colors Selection
          const Text("Select Color", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: List.generate(
              availableColors.length,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColorIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedColorIndex == index ? Colors.pink : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: availableColors[index],
                    radius: 15,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Sizes Selection
          const Text("Select Size", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: List.generate(
              availableSizes.length,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSizeIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedSizeIndex == index ? Colors.pink : Colors.grey.shade800,
                    border: Border.all(color: Colors.white),
                  ),
                  child: Text(
                    availableSizes[index],
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),

      // Fixed Overflow in Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  side: const BorderSide(color: Colors.white),
                ),
                label: const Text("BUY NOW", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  side: const BorderSide(color: Colors.black),
                ),
                icon: const Icon(Icons.shopping_bag_rounded, color: Colors.white),
                label: const Text("ADD TO CART", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
