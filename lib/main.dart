import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> containerNames = ['Container 1', 'Container 2', 'Container 3', 'Container 4', 'Container 5'];
  final List<List<String>> products = [    ['Product 1', 'Product 2', 'Product 3'],
    ['Product 4', 'Product 5', 'Product 6'],
    ['Product 7', 'Product 8', 'Product 9'],
    ['Product 10', 'Product 11', 'Product 12'],
    ['Product 13', 'Product 14', 'Product 15'],
  ];
  final List<List<double>> prices = [    [10.0, 20.0, 30.0],
    [40.0, 50.0, 60.0],
    [70.0, 80.0, 90.0],
    [100.0, 110.0, 120.0],
    [130.0, 140.0, 150.0],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.builder(
        itemCount: containerNames.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryPage(
                  products: products[index],
                  prices: prices[index],
                  containerName: containerNames[index],
                )),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16),
              child: Text(containerNames[index]),
            ),
          );
        },
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final List<String> products;
  final List<double> prices;
  final String containerName;

  CategoryPage({required this.products, required this.prices, required this.containerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(containerName),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(
                  productName: products[index],
                  price: prices[index],
                )),
              );
            },
            child: ListTile(
              title: Text(products[index]),
              subtitle: Text('\$${prices[index]}'),
            ),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String productName;
  final double price;

  DetailsPage({required this.productName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Center(
        child: Text('\$${price}'),
      ),
    );
  }
}
