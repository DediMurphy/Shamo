import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/product_providers.dart';
import 'package:shamo/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {

    getInit();
    // TODO: implement initState
   
    super.initState();
  }

  getInit()async {
    await Provider.of<ProductProviders>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/logo_shamo.png'))),
        ),
      ),
    );
  }
}
