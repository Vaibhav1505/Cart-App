// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/home_widget/add_to_cart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
   HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);
   Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: Vx.mOnly(top: 15, right: 20),
            children: [
              "\$${catalog.price}".text.bold.red700.xl4.make(),
              AddToCart(catalog:catalog,)
                  .wh(140, 50),
            ]),
      ),
      backgroundColor: myTheme.CremColor,
      body: SafeArea(
          bottom: false,
          child: Column(children: [
            Hero(
                    tag: (catalog.image.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4
                          .color(myTheme.DarkBluish)
                          .make(),
                      catalog.desc.text.center
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Duo elitr elitr labore et sed gubergren sit. Magna rebum aliquyam rebum dolore. Vero takimata no ipsum labore diam diam elitr amet. Voluptua sit dolore gubergren no ea, stet et."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ),
            )
          ])),
    );
  }
}
