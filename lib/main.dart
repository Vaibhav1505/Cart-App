import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'pages/Home_Page.dart';
import 'pages/Login_page.dart';
import 'widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(CatalogModel(), CartModel()), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: myTheme.lightTheme(context),
      darkTheme: myTheme.darkTheme(context),
      initialRoute: "/Login",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.CartRoute: (context) => CartPage(),
        //MyRoutes.HomeDetailRoute: (context) => HomeDetailPage(catalog:catalog,),
        
      },
    );
  }
}
