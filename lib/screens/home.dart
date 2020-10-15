import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolkia/widget/bezeirContainer.dart';

import 'initial.dart';

class MainBoard extends StatefulWidget {
  @override
  _MainBoard createState() => _MainBoard();
}

class _MainBoard extends State<MainBoard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: Icon(Icons.menu, color: Colors.black),
      // ),
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        child: SafeArea(
          child: Stack(children: <Widget>[
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Icon(Icons.menu_outlined),
                        Column(
                          children: [
                            Text(
                              "Welcome,",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "John",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildItemMenu("assets/elaerning.jpg", "E-Learning"),
                        buildItemMenu("assets/result.png", "Student Result"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildItemMenu("assets/bill.png", "Bills"),
                        buildItemMenu("assets/payment.jpg", "Payment History"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildItemMenu("assets/forum.png", "Forum"),
                        buildItemMenu("assets/coins.png", "Tokens"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildItemMenu("assets/corres.png", "Correspondences"),
                        buildItemMenu("assets/lock.jpg", "Change Password"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("Current orders (3)",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.grey[700]),),
                    //     Text("View all",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.blue),),
                    //   ],
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(10),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey,
                    //         blurRadius: 3,
                    //         offset: Offset(0,1)
                    //       )
                    //     ]
                    //   ),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [

                    //     Container(
                    //       margin: EdgeInsets.symmetric(vertical: 6),
                    //       padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(30),
                    //         color: Colors.white,
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.grey,
                    //             offset: Offset(0,1),
                    //             blurRadius: 1
                    //           )
                    //         ]
                    //       ),
                    //       child: ClipRRect(
                    //         child: Image.asset("assets/images/delivery-truck.png",height: 40,),
                    //         borderRadius: BorderRadius.circular(20),

                    //         ),
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text("Order No : #1234567890",style: TextStyle(fontWeight: FontWeight.w500),),
                    //         Text("Out of delivery",style: TextStyle(color: Colors.blue),),
                    //       ],
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildItemMenu(String image, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InitialPage()));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            ClipRect(
                child: Image.asset(
              image,
              width: 100,
              height: 70,
              fit: BoxFit.contain,
            )),
            SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
