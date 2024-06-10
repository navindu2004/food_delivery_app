import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp_02/service/database.dart';
import 'package:flutterapp_02/widget/widget_support.dart';
import 'package:flutterapp_02/pages/details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool shawarma = false, kebab = false, falafel = false, biriyani = false;

  Stream? fooditemStream;

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem("Shawarma");
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Details(detail: ds["Detail"],name: ds["Name"],price: ds["Price"],image: ds["Image"],)));
                      },
                      child: Container(
              margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          ds["Image"],
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              ds["Name"],
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Spicy and Delicious",
                              style: AppWidget.LightTextFieldStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "\Rs. "+ds["Price"],
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  Widget allItems() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Details(detail: ds["Detail"],name: ds["Name"],price: ds["Price"],image: ds["Image"],)));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(ds["Name"],
                                    style: AppWidget.semiBoldTextFieldStyle()),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Fresh and Healthy",
                                  style: AppWidget.LightTextFieldStyle(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "\Rs. " + ds["Price"],
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

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
            Container(margin: EdgeInsets.only(right: 20.0), child: showItem()),
            SizedBox(
              height: 30.0,
            ),
            Container(height: 270, child: allItems()),
            SizedBox(
              height: 30.0,
            ),
            allItemsVertically(),
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
          onTap: () async{
            shawarma = true;
            kebab = false;
            falafel = false;
            biriyani = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Shawarma");
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
          onTap: () async{
            shawarma = false;
            kebab = true;
            falafel = false;
            biriyani = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Kebab");
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
          onTap: () async{
            shawarma = false;
            kebab = false;
            falafel = true;
            biriyani = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Falafel");
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
          onTap: () async{
            shawarma = false;
            kebab = false;
            falafel = false;
            biriyani = true;
            fooditemStream = await DatabaseMethods().getFoodItem("Biriyani");
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
