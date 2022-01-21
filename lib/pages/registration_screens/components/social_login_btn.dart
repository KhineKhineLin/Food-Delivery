import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constant.dart';

class SocialLoginBtn extends StatefulWidget {
  const SocialLoginBtn({Key? key}) : super(key: key);

  @override
  _SocialLoginBtnState createState() => _SocialLoginBtnState();
}

class _SocialLoginBtnState extends State<SocialLoginBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          height: 45,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: kSecondaryColor,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Login with Google',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
              ),
              SvgPicture.asset(
                'icons/google-icon.svg',
                height: 20,
              )
            ],
          ),
        ),
        const SizedBox(height: 10,),
        MaterialButton(
          height: 45,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: kSecondaryColor,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Login with Facebook',
                style: TextStyle(color: kPrimaryColor, fontSize: 16),
              ),
              Image.asset(
                'icons/facebook.png',
                height: 20,
              )
            ],
          ),
        ),
       
      ],
    );
  }
}
