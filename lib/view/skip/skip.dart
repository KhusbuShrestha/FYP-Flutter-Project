import 'package:flutter/material.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/const/primaryButton.dart';

class SkipScreen extends StatefulWidget {
  const SkipScreen({Key? key}) : super(key: key);

  @override
  _SkipScreenState createState() => _SkipScreenState();
}

class _SkipScreenState extends State<SkipScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage("images/splash.png"),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: 
                      primaryButton(context,  'Log In', 'logIn')
                      // ElevatedButton(
                      //   style: ButtonStyle(
                      //     backgroundColor:
                      //         MaterialStateProperty.all<Color>(primarycolor),
                      //   ),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, 'logIn');
                      //   },
                      //   child: Text('Log In'),
                      // ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: primaryButton(context, 'Skip', 'mainScreen')
                      // ElevatedButton(
                      //   style: ButtonStyle(
                      //     backgroundColor:
                      //         MaterialStateProperty.all<Color>(primarycolor),
                      //   ),
                      //   onPressed: () {},
                      //   child: Text('Skip'),
                      // ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
