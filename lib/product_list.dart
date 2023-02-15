import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_flutter_batch_two/product_list_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final Client httpClient = Client();
  ProductListModel productListModel = ProductListModel();
  bool dataLoadingInProgress = false;

  Future<void> getProductListFromApi() async {
    // encode -> x
    // decode -> ok
    dataLoadingInProgress = true;
    setState(() {});
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Response response = await httpClient.get(uri);
    productListModel = ProductListModel.fromJson(jsonDecode(response.body));
    print(productListModel.status);
    print(productListModel.productList?.length ?? 0);
    dataLoadingInProgress = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProductListFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewProduct()));
        },
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getProductListFromApi();
        },
        child: dataLoadingInProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: productListModel.productList?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(productListModel.productList?[index].title ??
                        'Unknown'),
                    subtitle: Text(
                        'Brand: ${productListModel.productList?[index].brand}'),
                    trailing: Text(
                        'Star: ${productListModel.productList?[index].star}'),
                    leading: Text(
                        '${productListModel.productList?[index].price}/Unit'),
                  );
                },
              ),
      ),
    );
  }
}

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final Client httpClient = Client();

  final TextEditingController productNameETController = TextEditingController();
  final TextEditingController productCodeETController = TextEditingController();
  final TextEditingController productQuantityETController =
      TextEditingController();
  final TextEditingController productTotalPriceETController =
      TextEditingController();
  final TextEditingController productUnitPriceETController =
      TextEditingController();
  final TextEditingController productImageETController =
      TextEditingController();

  Future<void> addNewProductToApi() async {
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
    Response response = await httpClient.post(
      uri,
      headers: {
        'Content-type': 'application/json'
      },
      body: jsonEncode({
        "Img": productImageETController.text,
        "ProductCode": productCodeETController.text,
        "ProductName": productNameETController.text,
        "Qty": productQuantityETController.text,
        "TotalPrice": productTotalPriceETController.text,
        "UnitPrice": productUnitPriceETController.text
      }),
    );
    final responseJson = jsonDecode(response.body);
    if (responseJson['status'] == 'success') {
      productUnitPriceETController.clear();
      productTotalPriceETController.clear();
      productNameETController.clear();
      productCodeETController.clear();
      productQuantityETController.clear();
      productImageETController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product add failed!')));
    }
  }

  /// form validation add
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: productNameETController,
              decoration: const InputDecoration(hintText: 'Product name'),
            ),
            TextFormField(
              controller: productCodeETController,
              decoration: const InputDecoration(hintText: 'Product code'),
            ),
            TextFormField(
              controller: productUnitPriceETController,
              decoration: const InputDecoration(hintText: 'Product unit price'),
            ),
            TextFormField(
              controller: productTotalPriceETController,
              decoration:
                  const InputDecoration(hintText: 'Product total price'),
            ),
            TextFormField(
              controller: productQuantityETController,
              decoration: const InputDecoration(hintText: 'Product quantity'),
            ),
            TextFormField(
              controller: productImageETController,
              decoration: const InputDecoration(hintText: 'Product image'),
            ),
            ElevatedButton(
                onPressed: () {
                  addNewProductToApi();
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
