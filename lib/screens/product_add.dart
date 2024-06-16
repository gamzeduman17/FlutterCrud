import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';

import '../models/product.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductAddState();
  }
}

class ProductAddState extends State<ProductAdd> { // StatefulWidget ile uyumlu olacak şekilde düzelttik
  var txtName = TextEditingController(); //genel isimlendirme
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();
  var dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),
            buildDescriptionField(),
            buildUnitPriceField(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Name"),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Description"),
      controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Unit Price"),
      controller: txtUnitPrice,
    );
  }

  buildSaveButton() {
    return ElevatedButton(
        child: Text("Add"),
        onPressed: () {
          addProduct();
        });
  }

  void addProduct() async {
    // Parse the unit price text and provide a default value of 0.0 if parsing fails
    double unitPrice = double.tryParse(txtUnitPrice.text) ?? 0.0;

    // Create a Product object and insert it into the database
    var result = await dbHelper.insert(Product(txtName.text, txtDescription.text, unitPrice));
    Navigator.pop(context, true);
  }
}
