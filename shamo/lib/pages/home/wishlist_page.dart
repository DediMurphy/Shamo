import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/wistlist_providers.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wistlist_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {

    WistlistProviders wistlistProviders = Provider.of<WistlistProviders>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Favorite Shoes',
          style: primaryTextStyle,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishList() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_love.png',
              width: 74,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              ' You don\'t have dream shoes?',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: secondaryTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ));
    }

    Widget content() {
      return Expanded(
          child: Container(
        color: backgroundColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
          ),
          children: wistlistProviders.wistlist
            .map(
              (product) => WistListCard(product),
            )
            .toList(),
        ),
      ));
    }

    return Column(
      children: [
        header(),
        // emptyWishList(),
        wistlistProviders.wistlist.length == 0 ? emptyWishList() : content(),
      ],
    );
  }
}
