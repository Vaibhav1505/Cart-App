import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myTheme.CremColor,
      appBar: AppBar(
        title: "Cart".text.xl2.black.bold.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({super.key});
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    
    final CartModel _cart = (VxState.store as MyStore).cart;
    final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(Colors.deepPurple).bold.make(),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(myTheme.DarkBluish)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying Not Supported yet!".text.make()));
            },
            child: "Buy".text.white.bold.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    final Item catalog;

    return _cart.items.isEmpty
        ? "Nothing To Show Here!".text.bold.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              //ConstrainedBox(
              //  constraints: BoxConstraints(imeg()),
              //CatalogImage(image: catalog.image,)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      // setState(() {

                      // });
                    },
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.info_outline),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.HomeDetailRoute);
                  //   },
                  // )
                ],
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
