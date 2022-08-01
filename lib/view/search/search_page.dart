import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/search_controller.dart';
import 'package:flutter_fyp/view/search/searched_product.dart';
import 'package:get/get.dart';
import 'package:outline_search_bar/outline_search_bar.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sh = Get.find<SearchController>();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Search"),
          backgroundColor: AppColors.primarycolor,
          leading: crossButton(context),
          
        ),
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  height:300,
                  child: Center(child: GText(text: "Enter the product name to search the product..", color: Colors.white,),),
                  
                color: AppColors.primarycolor,
                ),
                
                
              ],
            ),
            

            Positioned(
              // top:  MediaQuery.of(context).size.height,
              top: 260,
              child: Container(
                height:60 ,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: OutlineSearchBar(
                    elevation: 10,
                    // keyboardType: TextInputType.text,
                    // backgroundColor: Colors.red,
                    borderColor: AppColors.primarycolor,
                    borderWidth: 2,
                    searchButtonIconColor: AppColors.primarycolor,
                    // onTap: ,
                    onSearchButtonPressed: (value) {
                      print(value);
                      sh.getSearchList(value);
                      print(sh.getSearchList(value));
                      Get.to(() => SearchedProductPage());
                    },
                  ),
                ),
              ),
              ),
              
          ],
        ),
      )
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_fyp/components/cross.dart';
// import 'package:getwidget/getwidget.dart';

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List list = [
//       "Flutter",
//       "React",
//       "Ionic",
//       "Xamarin",
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         leading: crossButton(context),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             GFSearchBar(
//               searchList: list,
//               searchQueryBuilder: (query, list) {
//                 return list;
//                 return list
//                 .where((item) =>
//                     item!.toString().contains(query.toLowerCase()))
//                 .toList();
//               },
//               overlaySearchListItemBuilder: (item) {
//                 return Container(
//                   padding: const EdgeInsets.all(8),
//                   child: Text(
//                     'item',
//                     style: const TextStyle(fontSize: 18),
//                   ),
//                 );
//               },
//               onItemSelected: (item) {
//                 setState(() {
//                   print('$item');
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void setState(Null Function() param0) {}
// }
