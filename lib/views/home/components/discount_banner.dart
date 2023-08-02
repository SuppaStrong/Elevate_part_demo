import 'package:flutter/material.dart';
import '../../../size_config.dart';

class DiscountBannerCard extends StatelessWidget {
  final Function onTap;
  final String img;
  const DiscountBannerCard({super.key, required this.onTap, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getProportionateScreenWidth(12)),
      width: getProportionateScreenWidth(284),
      height: getProportionateScreenWidth(160),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
          //scale: 0.7,
        ),
        //color: Color.fromRGBO(0, 54, 70, 1),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap as void Function(),
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(27, 50, 95, 0.08),
            offset: Offset(0, 8),
            blurRadius: 30,
          )
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          SizedBox(
            width: getProportionateScreenWidth(16),
          ),
          DiscountBannerCard(
            img: "assets/images/discountBanner3.png",
            onTap: () {},
          ),
          SizedBox(
            height: getProportionateScreenWidth(12),
          ),
          DiscountBannerCard(
            img: "assets/images/discountBanner1.png",
            onTap: () {},
          ),
          SizedBox(
            height: getProportionateScreenWidth(12),
          ),
          DiscountBannerCard(
            img: "assets/images/discountBanner2.png",
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}
