import 'package:myntra/modals/product.dart';

class CartItem {
  Product product;
  int quantity;
  int size;
  CartItem({required this.product, this.quantity = 1, required this.size});
}
