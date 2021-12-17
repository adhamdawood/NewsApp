import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_back_on_track/CategoriesFragments/CategoryItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Category.dart';

class CategoriesFragment extends StatefulWidget {
  Function onCategoryButtonClick;
  CategoriesFragment(this.onCategoryButtonClick);
  @override
  _CategoriesFragmentState createState() => _CategoriesFragmentState();
}

class _CategoriesFragmentState extends State<CategoriesFragment> {
 List<Category> categoryList=[];

  @override
  Widget build(BuildContext context) {
    fillList();
    return Container(
      padding: EdgeInsets.only(right: 8,left: 8,bottom: 0,top: 10),
      child: Column(
        children: [
          Text(AppLocalizations.of(context).pickYourCategoryOfInterest,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8),
              itemBuilder: (_, index) => CategoryItem(categoryList[index],widget.onCategoryButtonClick),
              itemCount: 6,
            ),
          )
        ],
      ),
    );
  }

  void fillList(){
    categoryList.add(new Category(AppLocalizations.of(context).sports,"sports", "assets/sports.png", Color(0xffC91C22), false));
    categoryList.add(new Category(AppLocalizations.of(context).politics,"general", "assets/Politics.png", Color(0xff003E90), true));
    categoryList.add(new Category(AppLocalizations.of(context).health,"health", "assets/health.png", Color(0xffED1E79), false));
    categoryList.add(new Category(AppLocalizations.of(context).science,"science", "assets/science.png",Color(0xffF2D352), true));
    categoryList.add(new Category(AppLocalizations.of(context).business,"business", "assets/bussines.png",Color(0xffCF7E48), false));
    categoryList.add(new Category(AppLocalizations.of(context).environment,"entertainment", "assets/environment.png", Color(0xff4882CF), true));
  }
}
