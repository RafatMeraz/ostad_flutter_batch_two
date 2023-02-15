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
        onPressed: () {},
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
