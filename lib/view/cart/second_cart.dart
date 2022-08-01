import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondCartPage extends StatefulWidget {
  const SecondCartPage({Key? key}) : super(key: key);

  @override
  State<SecondCartPage> createState() => _SecondCartPageState();
}

class _SecondCartPageState extends State<SecondCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Obx(() => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ListView.builder(itemBuilder: (BuildContext context, int index){
                return ListTile();
              }),
              ],
            ),
          )),
    );
  }
}
