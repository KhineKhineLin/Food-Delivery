import 'package:flutter/material.dart';
import 'package:food_delivery/model/food_model.dart';
import 'package:food_delivery/pages/home/detail_screen/detail_screen.dart';

import '../../../constant.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: foodProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0),
        itemBuilder: (context, index) => FoodProduct(
            product: foodProducts[index],
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            foodDetail: foodProducts[index],
                          )));
            }),
      ),
    );
  }
}

class FoodProduct extends StatelessWidget {
  const FoodProduct({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            Text(
              product.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const SizedBox(
                  height: 10.0,
                ),
                const Icon(
                  Icons.star,
                  size: 20,
                  color: kPrimaryColor,
                ),
                Text(
                  '${product.rating}',
                  style: TextStyle(fontSize: 14, color: kPrimaryColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
