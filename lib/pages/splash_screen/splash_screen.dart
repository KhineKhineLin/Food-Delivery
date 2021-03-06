//import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';
import 'package:food_delivery/pages/registration_screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PageView(
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            children: const [
              SplashImgs(
                image: 'splash_images/splash1.jpg',
              ),
              SplashImgs(image: 'splash_images/splash2.jpg'),
              SplashImgs(image: 'splash_images/splash3.jpg')
            ],
          )),
          Expanded(
              child: Column(
            children: [
              const Spacer(),
              const Text(
                'Choose your favourite dishes\nfrom the nearest restaurant\nor cafe.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(3, (index) => dotContainer(index: index)),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                  },
                  color: kPrimaryColor,
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  )),
              const Spacer()
            ],
          ))
        ],
      ),
    );
  }

  Container dotContainer({int? index}) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}

class SplashImgs extends StatelessWidget {
  const SplashImgs({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // boxShadow: [
      //   BoxShadow(
      //     blurRadius: 10.0,
      //     spreadRadius: 10.0,
      //     color: kPrimaryColor.withOpacity(0.3)
      //   )
      // ],
      clipper: ClipperClass(),
      child: SizedBox(
        width: double.infinity,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}

class ClipperClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.width);
    path.quadraticBezierTo(
        size.width / 9, size.height, size.width / 4, size.height);
    path.quadraticBezierTo(size.width - (size.width / 2), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
