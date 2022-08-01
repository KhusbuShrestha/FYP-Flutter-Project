import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductProfile extends StatelessWidget {
  const ProductProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = 1;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Product Profile"),
          backgroundColor: AppColors.primarycolor,
          leading: crossButton(context),
          actions: [
            Column(
              children: [
                //  Icon(Icons.shopping_cart_outlined)
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'cart');
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Product Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                    trailing: IconButton(
                        onPressed: () async {
                          // Map jsonData = {
                          //   "item": {
                          //     "product": data.product.product.id,
                          //   }
                          // };
                          // CoolAlert.show(context: context, type: CoolAlertType.loading, text: "Item added to Wishlist");
                          // await Api().postData(jsonData, "/efn/wishlist");
                          // Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: AppColors.blackColor,
                        )),
                    title: GText(
                      text: "data.product.product.name",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.check,
                              // color: data.product.product.inStock == "In Stock" ? AppSetting.secondaryText : AppSetting.secondaryText,
                              size: 14,
                            ),
                            Text(
                              " data.product.product.inStock",
                              style: TextStyle(
                                  // color: data.product.product.inStock == "In Stock" ? AppSetting.secondaryText : AppSetting.secondaryText,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // data.product.product.supplierType[0] == ""
                            // SizedBox()
                            // : Icon(
                            //     Icons.check,
                            //     color: AppColors.secondaryText,
                            //     size: 14,
                            //   ),
                            // Text(
                            //   "uuuuuuuuuuu",
                            //   style: TextStyle(color: AppColors.secondaryText, fontWeight: FontWeight.normal),
                            // ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: GText(
                                text: "SKU",
                                fontSize: 14,
                                color: AppColors.secondaryText,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  height: 250,
                  child: Image.asset(
                    'images/file.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: ListTile(
                    //         title: Text(
                    //             "Bell Designed Key Holder/ Wall decor/Interfiors"),
                    //         subtitle: Text("Out of stock Retail"),
                    //       ),
                    //     ),
                    //     // Expanded(child: child)
                    //   ],
                    // )
                  ],
                ),
              ),

              Container(
                child: ListTile(
                  leading: Text("Rs. 50000"),
                  trailing: Text("0 Reviews"),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Quantity",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                total--;
                                if (total <= 1) {
                                  total = 1;
                                }
                                // setState(() {});
                              }),
                          Text('$total'),
                          IconButton(
                              icon: Icon(Icons.add_circle),
                              onPressed: () {
                                total++;
                                // setState(() {});
                              }),
                        ],
                      ),
                    ),

                    //  Container(
                    //   child: Row(
                    //     children: [
                    //       GText(
                    //         text: "Qty",
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //       SizedBox(width: 10),
                    //       GestureDetector(
                    //           onTap: () {},
                    //           child: FaIcon(FontAwesomeIcons.minusSquare)),
                    //       SizedBox(width: 5),
                    //       Container(
                    //         padding: EdgeInsets.symmetric(
                    //             vertical: 2, horizontal: 5),
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //           border: Border.all(
                    //               width: 1, color: AppColors.borderColor),
                    //         ),
                    //         child: GText(
                    //           text: '1',
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       SizedBox(width: 5),
                    //       GestureDetector(
                    //         onTap: () {},
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(right: 18),
                    //           child: FaIcon(FontAwesomeIcons.plusSquare),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  )
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.primarycolor),
                              ),
                              onPressed: () {},
                              child: const Text("ADD TO CARD")),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.primarycolor),
                              ),
                              onPressed: () {},
                              child: Icon(FontAwesomeIcons.heart)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ExpansionTile(
                initiallyExpanded: true,
                title: GText(
                  text: "Short Description",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  Row(
                    // children: [Html(data: data.product.product.shortDescription)],
                    children: [Text("Wodden frame")],
                  )
                ],
              ),
              Divider(),
              // Add to Cart

              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Flexible(
              //         fit: FlexFit.tight,
              //         flex: 2,
              //         child: Container(
              //           child: GText(
              //             text: "Quantity",
              //             fontSize: 18,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ),
              //       Flexible(
              //         flex: 1,
              //         fit: FlexFit.tight,
              //         child: Container(
              //           child: Row(children: [
              //             GestureDetector(onTap: () {
              //               //   if (qty <= minOrderQty) {
              //               //     qty = minOrderQty;
              //               //   } else {
              //               //     qty--;
              //               //   }
              //               //   setState(() {});
              //               // },
              //               // child: FaIcon(FontAwesomeIcons.minusSquare)
              //             }),
              //             SizedBox(width: 5),
              //             Container(
              //                 padding: EdgeInsets.symmetric(horizontal: 5),
              //                 alignment: Alignment.center,
              //                 decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     border: Border.all(
              //                         width: 1, color: AppColors.borderColor)),
              //                 child: Text("qty",
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 20))),
              //             SizedBox(width: 5),
              //             GestureDetector(onTap: () {
              //               //   qty++;
              //               //   setState(() {});
              //               // },
              //               // child: FaIcon(FontAwesomeIcons.plusSquare),
              //             })
              //           ]),
              //         ),
              //       )
              //     ],
              //   ),
              // ),

              const Divider(),
              // You May also Like
              const ListTile(
                title: Text(
                  "YOU MAY ALSO LIKE",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                // width: size.width,
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  // itemCount: data.product.relatedProduct.length,
                  itemBuilder: (BuildContext context, int index) {
                    // var mydata = data.product.relatedProduct[index];
                    return InkWell(
                      onTap: () {
                        // data.setProductID(mydata.id.toString());
                        // Navigator.popAndPushNamed(
                        //     context, 'productPage');
                        // data.isLoading = true;
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(id: mydata.id.toString())));
                      },
                      child: Container(
                        // width: size.width * .40,
                        child: Card(
                          elevation: .3,
                          color: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  height: 120,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: Image.asset("images/file.jpg"),
                                    // child: FadeInImage(
                                    //   placeholder: AssetImage('images/image.png'),
                                    //   image: Image.asset("name"),
                                    //   fit: BoxFit.cover,
                                    //   width: 120,
                                    //   height: 120,
                                    //   fadeInDuration: Duration(seconds: 1),
                                    //   fadeOutDuration: Duration(seconds: 1),
                                    // ),
                                  )),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 10,
                                        child: Row(
                                          children: [
                                            // mydata.sellerLogo != ""
                                            //     ? Image.network(
                                            //         mydata.sellerLogo,
                                            //         fit: BoxFit.contain,
                                            //         width: 24,
                                            //       )
                                            //     : SizedBox(),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            // Expanded(
                                            //   flex: 3,
                                            //   child: mydata.sellerName != ""
                                            //       ? Text(
                                            //           mydata.sellerName,
                                            //           style: TextStyle(fontSize: 10, color: AppSetting.secondaryText),
                                            //           maxLines: 1,
                                            //         )
                                            //       : SizedBox(),
                                            // )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 45,
                                        child: Text(
                                          "mydata.name",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.secondaryText,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          // RatingBar.builder(
                                          //   updateOnDrag: false,
                                          //   ignoreGestures: true,
                                          //   itemSize: 10,
                                          //   initialRating: double.parse(mydata.rating.toString()),
                                          //   minRating: 1,
                                          //   direction: Axis.horizontal,
                                          //   allowHalfRating: true,
                                          //   itemCount: 5,
                                          //   itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                          //   itemBuilder: (context, _) => Icon(
                                          //     Icons.star,
                                          //     color: Colors.amber,
                                          //   ),
                                          //   onRatingUpdate: (rating) {
                                          //     print(rating);
                                          //   },
                                          // ),
                                          Text(
                                            "({mydata.ratingPercent})",
                                            style: TextStyle(fontSize: 10),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      // mydata.finalPrice != 0
                                      //     ? Text(
                                      //         "\$" + mydata.finalPrice.toString(),
                                      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppSetting.secondaryColor),
                                      //       )
                                      //     : SizedBox()
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
