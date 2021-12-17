import 'package:flutter/material.dart';
import 'package:news_app_back_on_track/CategoriesFragments/Category.dart';

class CategoryItem extends StatelessWidget {
  Function onCategoryButtonClick;
  Category category;
  CategoryItem(this.category,this.onCategoryButtonClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCategoryButtonClick(category.id);
      },
      child: category.rightSided?
      Container(
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8),bottomRight: Radius.circular(8)),
          color: category.backgroundColor, ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(category.imagePath),
            Text(category.title),
          ],
        ),
      )
          :
      Container(
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8),bottomLeft: Radius.circular(8)),
          color: category.backgroundColor,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(category.imagePath),
            Text(category.title),
          ],
        ),
      ),
    );
  }
}
