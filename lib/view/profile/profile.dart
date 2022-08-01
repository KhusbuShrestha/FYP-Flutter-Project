import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/const/primaryButton.dart';
import 'package:flutter_fyp/view/cart/cart.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
        backgroundColor: AppColors.primarycolor,
        leading: crossButton(context),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              
          children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: profileButton('Khusbu Shrestha', FontAwesomeIcons.mailchimp),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: profileButton('khusbustha529@gmail.com', FontAwesomeIcons.mailBulk),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 40,
              
                width: MediaQuery.of(context).size.width,
                
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.primarycolor),
                      ),
                  onPressed: (){
                    Get.off(() => const CartPage());
                  }, icon: Icon(Icons.edit_attributes_sharp), label: Text('Edit Profile', style: TextStyle(fontSize: 16),)),
              ),
            )
          ],
        )),
      ),
    );
  }

  Card profileButton( String title, IconData iconData) {
    return Card(
      color: AppColors.borderColor,
      shadowColor: AppColors.txtColor,
      child: ListTile(
        // onTap: () {
        //   Navigator.popAndPushNamed(context, route);
        // },
        leading: FaIcon(
        iconData,
        size: 20,
      ),
        title: Text(
          title,
          style: TextStyle(),
        ),
      ),
    );
  }
}
