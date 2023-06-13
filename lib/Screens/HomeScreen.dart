import 'package:flutter/material.dart';
import 'package:mechine_test_sample/Api_Service/api_service.dart';
import 'package:mechine_test_sample/Const/Colors.dart';
import 'package:mechine_test_sample/ModelClass/Product_model.dart';
import 'package:mechine_test_sample/Screens/CategoryScreen.dart';
import 'package:mechine_test_sample/Screens/Product_Details.dart';
import 'package:mechine_test_sample/Screens/cart_Screen.dart';
import 'package:mechine_test_sample/cart/cart.dart';
import 'package:mechine_test_sample/widgets/carosel.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final apiService = ApiService();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                            color: ShopButton,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: '  Mr. Anand CB',
                            style: TextStyle(color: Shoptext, fontSize: 18),
                          )
                        ]),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ShopCardBackground,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.pushNamed(context, CartScreen.routeName);
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CourselSliderContainer(
                  FirstCourselSliderList: FirstCourselSliderList),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ShopCardBackground,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'What kind of shoes do you want?',
                            hintStyle:
                                TextStyle(color: Shoptextlight, fontSize: 15),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.search_rounded),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<List<String>>(
                future: apiService.fetchCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final categories = snapshot.data!;
                    return SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CategoryScreen(category: category),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 135,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ShopButton,
                                    ),
                                    child: Center(
                                      child: Text(
                                        category,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ));
                        },
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: FutureBuilder<List<Product>>(
                  future: apiService.fetchProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
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
                          return StaggeredGridView.countBuilder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(15),
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.count(2, index.isOdd ? 3.5 : 3.5),
                            crossAxisCount: 2,
                            itemCount: 6,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                        productId: product.id),
                                  ),
                                );
                              },
                              child: Card(
                                color: ShopBackground1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  product.image,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(),
                                          Positioned(
                                              bottom: 5,
                                              right: 5,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 18,
                                                  ),
                                                  Text("4.5",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 257, 27, 27),
                                                          fontSize: 12)),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                          ElevatedButton(
                                            onPressed: () {
                                              cart.addToCart(product);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content:
                                                        Text('Added to cart')),
                                              );
                                            },
                                            child: Text('Add to Cart'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List FirstCourselSliderList = [
  'images/1.jpg',
  'images/2.jpg',
  'images/3.jpg',
];
