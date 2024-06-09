import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp_02/widget/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              )),
          Image.asset(
            "images/shawarma.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Medium Shawarma",
                      style: AppWidget.semiBoldTextFieldStyle()),
                  Text("Chicken", style: AppWidget.boldTextFieldStyle()),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (a > 1) {
                    --a;
                  }
                  setState(() {

                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(a.toString(), style: AppWidget.semiBoldTextFieldStyle()),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  ++a;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20.0,),
          Text("Chicken shawarma: Tender, marinated chicken cooked on a vertical rotisserie, wrapped in flatbread with fresh vegetables and savory sauces, offering a burst of Middle Eastern flavors.",maxLines: 3, style: AppWidget.LightTextFieldStyle()),
          SizedBox(height: 30.0,),
          Row(children: [
            Text("Delivery Time", style: AppWidget.semiBoldTextFieldStyle(),),
            SizedBox(width: 25.0,),
            Icon(Icons.alarm, color:Colors.black54),
            SizedBox(width: 5.0,),
            Text("30 min", style: AppWidget.semiBoldTextFieldStyle(),)
          ],),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Total Price", style: AppWidget.semiBoldTextFieldStyle(),),
                Text("\Rs.950", style: AppWidget.HeadlineTextFieldStyle(),),
              ],),
              Container(
                width: MediaQuery.of(context).size.width/2,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Add to Cart", style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Poppins'),),
                    SizedBox(width: 40.0,),
                    Container(

                      padding:EdgeInsets.all(3),
                      decoration:BoxDecoration(
                        color: Colors.grey, borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],),
          ),
        ],
      ),
    ));
  }
}
