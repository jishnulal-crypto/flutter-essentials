import 'package:flutter/material.dart';
class Products {
  List<Product>? product;

  Products({this.product});

  Products.fromJson(Map<String, dynamic> json) {

    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? country;

  Product({this.id, this.name, this.country});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    return data;
  }
}

//1 . if json comes with a key
var data = {"product": [{"id":1,"name":"ismile","country":"usa"},
  {"id":1,"name":"ismile","country":"usa"},
  {"id":1,"name":"ismile","country":"usa"}]};

//2 . if json comes with a single object
var obj = {"id":1,"name":"ismile","country":"usa"};

//3 . if json comes with list of object
var listdata = [{"id":1,"name":"ismile","country":"usa"},
  {"id":1,"name":"ismile","country":"usa"},
  {"id":1,"name":"ismile","country":"usa"}];

Future<Products> getdata() async {
  //1
  Products products = Products.fromJson(data);
  //2
  Product product = Product.fromJson(obj);
  //3
  List productlist = listdata.map((e) => Product.fromJson(e)).toList();

  return products;
}


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
