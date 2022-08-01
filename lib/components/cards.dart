import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';

Widget cardView(BuildContext context, var image,
    var productName, var price,
    //  var rating, var discountPercent
     ) {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 500,
          // height: MediaQuery.of(context).size.height,
          // width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                child:Image.asset(image, fit: BoxFit.cover,),
                
                //  FadeInImage(
                //   placeholder: AssetImage(AppSetting.loading),
                //   image: NetworkImage(image),
                //   width: double.infinity,
                //   height: 150,
                //   fit: BoxFit.cover,
                // ),
              ),
             
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productName == null
                    ? SizedBox()
                    : GText(
                        text: productName,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    price == "0"
                        ? SizedBox()
                        : GText(
                            text: price.toString(),
                            color: AppColors.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                   
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
