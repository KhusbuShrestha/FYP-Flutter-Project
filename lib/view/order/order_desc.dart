import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/accountTextController.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/order_controller.dart';
import 'package:flutter_fyp/controller/order_desc_controller.dart';
import 'package:flutter_fyp/controller/product_detail_controller.dart';
import 'package:flutter_fyp/controller/product_list_category_Controller.dart';
import 'package:flutter_fyp/controller/product_list_controller.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:flutter_fyp/view/product_detail.dart/product_detail.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:get/get.dart';

class OrderDescPage extends StatefulWidget {
  const OrderDescPage({Key? key}) : super(key: key);

  @override
  State<OrderDescPage> createState() => _OrderDescPageState();
}

class _OrderDescPageState extends State<OrderDescPage> {
  @override
  Widget build(BuildContext context) {
    double _ratingStar = 0;
    var od = Get.find<OrderDescController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primarycolor,
        title: Text('History Details'),
        leading: crossButton(context),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: AppColors.secondaryText,
                    child: ListTile(
                      leading: Text(
                        "ITEMS",
                        style: TextStyle(color: AppColors.whitecolor),
                      ),
                      trailing: Text(
                        "AMOUNT",
                        style: TextStyle(color: AppColors.whitecolor),
                      ),
                    )),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: od.orderDesc.value.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var mydata = od.orderDesc.value.data[index];
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          // leading: Text(mydata.quantity!.toInt().toString()),
                          // leading: Text(mydata.name.toString()),
                          onTap: () {
                            // od.getOrderDesc(mydata.id!);
                            // Get.to(() => const OrderDescPage());
                          },
                          title: Text(mydata.name!.toString()),
                          subtitle: Text('Quantity: ' +
                              mydata.quantity!.toInt().toString()),
                          // subtitle: Text(mydata.amount.toString()),
                          trailing: Text('Rs ' + mydata.amount.toString()),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => RatingDialog(
                                    commentHint: "Comment on your experience",
                                    enableComment: true,
                                    showCloseButton: true,
                                    starSize: 30,
                                    title: Text("Feedback"),
                                    submitButtonText: "Submit",
                                    onSubmitted: (response) async {
                                      Map data = {
                                        "value": response.rating,
                                        "review": response.comment,
                                        "product_id": mydata.productId,
                                      };
                                      print(data);

                                      await RemoteService.postData(
                                          'ratings', data);
                                    }));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Tap Here To Rate the product:"),
                              Icon(Icons.star_rate_outlined),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
              // GridView.builder(
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       crossAxisSpacing: 5.0,
              //       mainAxisSpacing: 5.0,
              //     ),
              //     shrinkWrap: true,
              //     itemCount: od.orderDesc.value.data.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       var mydata = od.orderDesc.value.data[index];
              //       return InkWell(
              //         onTap: () {},
              //         child: Padding(
              //           padding: const EdgeInsets.only(left: 10, right: 10),
              //           child: Container(
              //             height: 250,
              //             decoration: const BoxDecoration(
              //               borderRadius: BorderRadius.all(Radius.circular(10)),
              //               color: Colors.white,
              //             ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 // BAPTText(text: mydata.name),
              //                 // BAPTText(text: mydata.price.toString()),
              //                 ListTile(
              //                   title: Text(
              //                     'Order: ' + mydata.id!.toString(),
              //                     style: TextStyle(fontWeight: FontWeight.bold),
              //                   ),
              //                   subtitle: Text(
              //                       mydata.createdAt!.toString()),
              //                 ),


              //                 Column(
              //                   children: [
              //                     // Text(mydata.name!.toString()),
              //                     ListTile(
              //                       leading: Text('Rs'+mydata.amount!.toString(), style: TextStyle(fontSize: 12),),
              //                       trailing: Text('Quantaty'+mydata.quantity!.toString(),  style: TextStyle(fontSize: 12),),
              //                     ),
              //                     // Text(mydata.!.toString())
              //                   ],
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     }),
           
            ],
          ),
        ),
      ),
    );
  }
}
