import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/reusable_widgets/app_bar.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  int get itemsCount => cartItems.length;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
  }
}

class ProductListScreen extends StatelessWidget {
  final CartController _cartController = Get.put(CartController());

  final List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 20),
    Product(name: 'Product 3', price: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Shopping Cart Example",
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Get.to(() => CartScreen());
                  },
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Obx(
                    () => Text(
                      _cartController.itemsCount.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                _cartController.addToCart(product);
              },
              child: Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Shopping Cart",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: _cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final product = _cartController.cartItems[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        _cartController.removeFromCart(product);
                      },
                      child: const Text('Remove'),
                    ),
                  );
                },
              );
            }),
          ),
          const Divider(),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \$${_cartController.totalPrice.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Shopping Cart Example',
//       initialRoute: '/',
//       getPages: [
//         GetPage(name: '/', page: () => ProductListScreen()),
//         GetPage(name: '/cart', page: () => CartScreen()),
//       ],
//     );
//   }
// }
