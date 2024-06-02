import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/cart_page.dart';
import 'package:shamo/pages/checkout_page.dart';
import 'package:shamo/pages/checkout_success_page.dart';
import 'package:shamo/pages/detail_chat_page.dart';
import 'package:shamo/pages/edit_profile_page.dart';
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/pages/sign_in_page.dart';
import 'package:shamo/pages/sign_up_page.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/provider/auth_providers.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/provider/product_providers.dart';
import 'package:shamo/provider/wistlist_providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProviders(),
        ),
        ChangeNotifierProvider(
          create:  (context) => WistlistProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/card': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
