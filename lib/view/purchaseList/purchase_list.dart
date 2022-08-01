import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PurchaseListPage extends StatefulWidget {
  const PurchaseListPage({Key? key}) : super(key: key);

  @override
  _PurchaseListPageState createState() => _PurchaseListPageState();
}

class _PurchaseListPageState extends State<PurchaseListPage> {
  final List<String> imagesList = [
    'https://images.pexels.com/photos/5709755/pexels-photo-5709755.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/5709913/pexels-photo-5709913.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/3738088/pexels-photo-3738088.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/994524/pexels-photo-994524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/22823/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: crossButton(context),
        backgroundColor: AppColors.primarycolor,
        centerTitle: true,
        title: Text("Purchae List"),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              // color: AppColors.blackColor,
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
                items: imagesList
                    .map(
                      (item) => Center(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Divider(),
            Card(
              child: Column(
                children: [
                  // ListTile(
                  //   trailing: Text(
                  //     "Rs. 1224083",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w800, color: Colors.green),
                  //   ),
                  //   title: Text("Product Name",
                  //       style: TextStyle(fontWeight: FontWeight.w800)),
                  //   subtitle: Text(
                  //     "Date: 2020-29-2",
                  //     style: TextStyle(fontSize: 12),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: purchaseListTile(
                        'Product Name', 'Rs. 90002', 'Date: 2222-2-2'),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: purchaseListTile(
                        'Product Name', 'Rs. 90002', 'Date: 2222-2-2'),
                  ),
                  Divider(),
                  purchaseListTile(
                      'Product Name', 'Rs. 90002', 'Date: 2222-2-2'),
                  Divider(),
                  purchaseListTile(
                      'Product Name', 'Rs. 90002', 'Date: 2222-2-2'),
                  Divider(),
                  purchaseListTile(
                      'Product Name', 'Rs. 90002', 'Date: 2222-2-2'),
                  Divider(),
                  purchaseListTile(
                      'Product Name', 'Rs. 90002', 'Date: 2222-2-2'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile purchaseListTile(String title, String price, String date) {
    return ListTile(
      // onTap: () {
      //   print(route);

      //   Navigator.pop(context);
      //   Navigator.pushNamed(context, route);
      // },
      // trailing: Icon(Icons.arrow_right),
      trailing: Text(
        price,
        style:
            const TextStyle(fontWeight: FontWeight.w800, color: Colors.green),
      ),
      title: GText(
        text: "$title",
        fontWeight: FontWeight.w800,
      ),
      subtitle: Text(
        date,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
