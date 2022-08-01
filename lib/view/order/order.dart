import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/order_controller.dart';
import 'package:flutter_fyp/controller/order_desc_controller.dart';
import 'package:flutter_fyp/controller/product_detail_controller.dart';
import 'package:flutter_fyp/controller/product_list_category_Controller.dart';
import 'package:flutter_fyp/controller/product_list_controller.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:flutter_fyp/view/order/order_desc.dart';
import 'package:flutter_fyp/view/product_detail.dart/product_detail.dart';
import 'package:get/get.dart';
 
class OrderPage extends StatelessWidget {
  const OrderPage({ Key? key }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    var ords = Get.find<OrderController>();
    var od = Get.find<OrderDescController>();
    return Scaffold(
      
      
     
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primarycolor,
        title: Text('Order History'),
        leading: crossButton(context),
       
      ),
      body: Obx(() => SingleChildScrollView(
 
        child: Column(
          children: [
            
 
            ListView.builder(
              shrinkWrap: true,
              itemCount: ords.orders.value.data.length,
              itemBuilder: (BuildContext context, int index){
                var mydata = ords.orders.value.data[index];
                return Card(
                  child: InkWell(
                    onTap: (){
                      // pd.getProductDetail(mydata.id);
                      // Get.to(() => const ProductDetailPage());
                    },
                    child: Container(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.date_range_outlined),
                            title: Text(mydata.createdAt!.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              height: 10,
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              od.getOrderDesc(mydata.id!);
                              Get.to(() => const OrderDescPage());
                            },
                            title: Text('Order Code: '+mydata.oCode!.toString()),
                            subtitle: Text('ID: '+mydata.id!.toString()),
                            trailing: Text('Rs: ' + mydata.grandTotal!.toString(), style: TextStyle(color: AppColors.primarycolor),),
                          )
                        ],
                      ),
                    ),
                  ),
                );
               
 
              })
          ],
        ),
      ),
      ),
       
     
    );
  }
}
