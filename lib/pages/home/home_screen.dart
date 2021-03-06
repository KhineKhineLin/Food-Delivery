import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';
import 'package:food_delivery/model/food_model.dart';

import 'components/bottom_bar.dart';
import 'components/category_list.dart';
import 'components/custom_appbar.dart';
import 'components/enum.dart';
import 'components/food_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      bottomNavigationBar: const CustomBottomBar(selectMenu: MenuState.home,),
      body: SafeArea(
        child: ListView(
          children: const [
            CustomAppbar(),
            SizedBox(
              height: 20.0,
            ),
            CategoryCard(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Popular Food',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            FoodCard(),
          ],
        ),
      ),
    );
  }
}

