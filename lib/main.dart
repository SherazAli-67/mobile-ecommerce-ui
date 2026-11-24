import 'package:flutter/material.dart';
import 'package:mobile_ecommerce_ui/constants/string_const.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/cart_provider.dart';
import 'package:mobile_ecommerce_ui/routing/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp.router(
        title: StringConst.appTitle,
        theme: ThemeData(brightness: .light),
        routerConfig: router,
        builder: (ctx, child) => child!,
      ),
    );
  }
}
