import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp_02/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool shawarma = false, kebab = false, falafel = false, biriyani = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello Navindu,", style: AppWidget.boldTextFieldStyle()),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Delicious Food", style: AppWidget.HeadlineTextFieldStyle()),
            Text("Discover and Get Great Food",
                style: AppWidget.LightTextFieldStyle()),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: showItem()),
            SizedBox(height: 30.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Container(
                  margin: EdgeInsets.all(4),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Image.asset(
                          "images/shawarma.png",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                          ),
                        Text("Chicken Shawarma",
                        style: AppWidget.semiBoldTextFieldStyle()),
                        SizedBox(height: 5.0,
                        ),
                        Text("Fresh and Healthy",style: AppWidget.LightTextFieldStyle(),),
                        SizedBox(height: 5.0,
                        ),
                        Text("\Rs. 950", style: AppWidget.semiBoldTextFieldStyle(),)
                      ],),
                    ),
                  ),
                ),
                SizedBox(width: 15.0,),
                Container(
                  margin: EdgeInsets.all(4),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Image.asset(
                          "images/shawarma.png",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                          ),
                        Text("Beef Kebab",
                        style: AppWidget.semiBoldTextFieldStyle()),
                        SizedBox(height: 5.0,
                        ),
                        Text("Juicy and tender",style: AppWidget.LightTextFieldStyle(),),
                        SizedBox(height: 5.0,
                        ),
                        Text("\Rs. 1200", style: AppWidget.semiBoldTextFieldStyle(),)
                      ],),
                    ),
                  ),
                )
              ],),
            ),
            SizedBox(height: 30.0,),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Image.asset(
                      "images/shawarma.png",
                     height: 120,
                     width: 120,
                     fit: BoxFit.cover,
                     ),
                     SizedBox(width: 20.0,),
                     Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text("Chicken Biriyani", style: AppWidget.semiBoldTextFieldStyle(),),
                      ),
                      SizedBox(height: 5.0,),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text("Spicy and Delicious", style: AppWidget.LightTextFieldStyle(),),
                      ),
                      SizedBox(height: 5.0,),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text("\Rs. 1450", style: AppWidget.semiBoldTextFieldStyle(),),
                      ),
                     ],)
                  ],),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            shawarma = true;
            kebab = false;
            falafel = false;
            biriyani = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: shawarma ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                "images/shawarmaicon.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: shawarma ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            shawarma = false;
            kebab = true;
            falafel = false;
            biriyani = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: kebab ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                "images/kebabicon.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: kebab ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            shawarma = false;
            kebab = false;
            falafel = true;
            biriyani = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: falafel ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                "images/falafelicon.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: falafel ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            shawarma = false;
            kebab = false;
            falafel = false;
            biriyani = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: biriyani ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                "images/biriyaniicon.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: biriyani ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
