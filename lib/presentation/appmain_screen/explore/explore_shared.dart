import 'package:electronicsshop_app/cores/app_exports.dart';

class FilterWays extends StatelessWidget {
  const FilterWays({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filterCategory.length,
          itemBuilder: (context, index) {
            String filterTxt = filterCategory[index];
            bool isFilter = filterTxt == 'Filter';
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[100]!)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(filterTxt, style: TextStyle(color: Colors.white),),
                      Icon(
                       isFilter ? Icons.filter_list : Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

