
import 'package:electronicsshop_app/cores/app_exports.dart';


class BuildCircle extends StatelessWidget {
  final int currentIndex;
  final int length;
  const BuildCircle({super.key, required this.currentIndex, required this.length});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
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
    );
  }
}


class ProductImages extends StatefulWidget {
  final Function switchPage;
  final List<String> img;
  const ProductImages({super.key, required this.switchPage, required this.img});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView.builder(
          onPageChanged: (value) {
          widget.switchPage(value);
          },
          itemCount: widget.img.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.network(
                  widget.img[index],
                  height: 270,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ProductColors extends StatefulWidget {
  final List<Color> availableColors;
  final Function setColorIndex;
  final int selectedColorIndex;
  const ProductColors({super.key, required this.availableColors, required this.setColorIndex, required this.selectedColorIndex});

  @override
  State<ProductColors> createState() => _ProductColorsState();
}

class _ProductColorsState extends State<ProductColors> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: List.generate(
          widget.availableColors.length,
              (index) => Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: (){
              widget.setColorIndex(index);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: widget.selectedColorIndex == index ? Border.all(color: Colors.white) : null,
                    borderRadius: BorderRadius.circular(20),
                    color: widget.availableColors[index]
                ),

                child: widget.selectedColorIndex == index ? Icon(Icons.check, color: Colors.white,) : null,
              ),
            ),
          )
      ),
    );
  }
}
