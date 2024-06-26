import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/provider/wistlist_providers.dart';
import 'package:shamo/theme.dart';

class WistListCard extends StatelessWidget {
 
  final ProductModel product;
  WistListCard(this.product);

  @override
  Widget build(BuildContext context) {

    WistlistProviders wistlistProvider = Provider.of<WistlistProviders>(context);

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4
      ),
      child: Row(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(product.galleries![0].url,width: 60,),
        ),
        SizedBox(width: 12,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name!,
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold
                ),
              ),
              Text(
                '\$${product.price}',
                style: priceTextStyle,
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            wistlistProvider.setProduct(product);
          },
          child: Image.asset(
            'assets/button_wishlist_blue.png',
            width: 34,
          ),
        )
        ],
      ),
    );
  }
}
