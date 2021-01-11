import 'package:flutter/material.dart';
import 'package:naiban/models/Category.dart';
import 'package:naiban/themes/color_app.dart';
import 'package:naiban/views/detail/category/components/CategoryDetial.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> category;

  const CategoryScreen({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 2,
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 2))
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
            category.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailCategoryScreen(
                              category: category[index],
                            ))),
                child: Container(
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.center,
                    width: 270,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(category[index].image),
                          fit: BoxFit.contain,
                        )),
                    child: Container(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            category[index].category,
                            style: textStyleFontHead,
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
