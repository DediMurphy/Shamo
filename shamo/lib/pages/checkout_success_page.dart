import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: true,
          title: Text(
            'Checkout Success',
            style: primaryTextStyle,
          ),
          elevation: 0,
        ),
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_keranjang.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You made a transaction',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Stay at home while we\nprepare your dream shoes',
              style: primaryTextStyle,
              textAlign: TextAlign.center,
            ),
            Container(
              height: 44,
              width: 196,
              margin: EdgeInsets.only(top: defaultMargin),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    'Order Other Shoes',
                    style: primaryTextStyle.copyWith(
                        fontWeight: medium, fontSize: 16),
                  )),
            ),
            Container(
              height: 44,
              width: 196,
              margin: EdgeInsets.only(top: 12),
              child: TextButton(
                onPressed: () {}, 
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff393748),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                child: Text(
                  'View My Order',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                    color: Color(0xffB7B6BF)
                  ),
                  )),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
