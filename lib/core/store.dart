// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel catalog;
  CartModel cart;

  MyStore(
    this.catalog,
    this.cart,
    
  ){
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  
}
}