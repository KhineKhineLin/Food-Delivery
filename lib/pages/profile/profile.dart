import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';
import 'package:food_delivery/pages/home/components/bottom_bar.dart';
import 'package:food_delivery/pages/home/components/enum.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'My Profile',
          style: TextStyle(color: kTextGrayColor),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: const CustomBottomBar(selectMenu: MenuState.profile),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset(
                  'images/profile.png',
                  height: 120,
                  width: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Ms. Khin',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                ButtomCard(
                  title: 'My Orders',
                  press: () {},
                ),
                ButtomCard(title: 'My Payment Cards', press: () {}),
                ButtomCard(title: 'My Addresses', press: () {}),
                ButtomCard(title: 'My Promocodes', press: () {}),
                ButtomCard(title: 'Share Promocodes', press: () {}),
                ButtomCard(title: 'FAQ', press: () {}),
                ButtomCard(title: 'Exit', press: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ButtomCard extends StatelessWidget {
  const ButtomCard({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: kGrayColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 17.0),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
