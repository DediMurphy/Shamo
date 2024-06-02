import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/theme.dart';

class ProductTile extends StatelessWidget {
  
  final ProductModel products;
  ProductTile(this.products);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context ) => ProductPage(products)));
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                products.galleries![0].url,
                width: 128,
                height: 128,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  products.category!.name,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12
                  ),
                ),
                SizedBox(height: 6,),
                Text(
                  products.name!,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 6,),
                Text(
                  '\$${products.price}',
                  style: priceTextStyle.copyWith(
                    fontWeight: medium
                  ),
                )
                ],
              )
              )
            ],
        ),
      ),
    );
  }
}