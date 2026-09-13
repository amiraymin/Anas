import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/screens/main_screens/catalog_screens.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      child: Column(
        children: [
          const Text(
            'Find Products',
            style: TextStyle(
              color: Color(0xff181725),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 22),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SearchScreen()),
            ),
            child: SizedBox(
              height: 52,
              child: IgnorePointer(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF2F3F2),
                    hintText: 'Search Store',
                    hintStyle: const TextStyle(
                      color: Color(0xff7C7C7C),
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xff7C7C7C),
                      size: 22,
                    ),
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff53B175)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 18),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.96,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: category.title == 'Beverages'
                      ? () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const BeveragesScreen()),
                          )
                      : null,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
                    decoration: BoxDecoration(
                      color: category.color,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: category.borderColor),
                    ),
                    child: Column(
                      children: [
                        Expanded(child: Image.asset(category.image, fit: BoxFit.contain)),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 34,
                          child: Center(
                            child: Text(
                              category.title,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xff181725),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                height: 1.25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
List<CategoryModel> categories = [
  CategoryModel(
    image: 'assets/imges/explore1.png',
    title: 'Fresh Fruits\n& Vegetable',
    color: const Color(0xffEEF8F2),
    borderColor: const Color(0xffA7DFC0),
  ),
  CategoryModel(
    image: 'assets/imges/explore2 .png',
    title: 'Cooking Oil\n& Ghee',
    color: const Color(0xffFFF4EA),
    borderColor: const Color(0xffF9C28D),
  ),
  CategoryModel(
    image: 'assets/imges/explore3.png',
    title: 'Meat & Fish',
    color: const Color(0xffFDE9E6),
    borderColor: const Color(0xffF1AAA1),
  ),
  CategoryModel(
    image: 'assets/imges/explore4.png',
    title: 'Bakery & Snacks',
    color: const Color(0xffF6EEF9),
    borderColor: const Color(0xffD8B8E1),
  ),
  CategoryModel(
    image: 'assets/imges/explore5.png',
    title: 'Dairy & Eggs',
    color: const Color(0xffFFF8E5),
    borderColor: const Color(0xffF2D88E),
  ),
  CategoryModel(
    image: 'assets/imges/explore6.png',
    title: 'Beverages',
    color: const Color(0xffEAF6FC),
    borderColor: const Color(0xffB9DBED),
  ),
];
