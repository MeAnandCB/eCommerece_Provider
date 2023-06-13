import 'package:flutter/material.dart';
import 'package:mechine_test_sample/Api_Service/api_service.dart';
import 'package:mechine_test_sample/ModelClass/Product_model.dart';
import 'package:mechine_test_sample/cart/cart.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    final apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: FutureBuilder<List<Product>>(
        future: apiService.fetchProductsByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final products = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text('\$${product.price}'),
                      SizedBox(height: 8),
                      Text(
                        product.category,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          cart.addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added to cart')),
                          );
                        },
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                );
                // return ListTile(
                //   leading: Container(
                //       height: 30,
                //       width: 50,
                //       child: Image.network(product.image)),
                //   title: Text(product.title),
                //   subtitle: Text('\$${product.price}'),
                // );
              },
            );
          }
        },
      ),
    );
  }
}
