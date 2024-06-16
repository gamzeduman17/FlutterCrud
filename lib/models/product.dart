class Product {
  int? id; // 'late' yerine nullable yaptık.
  late String name;
  late String description;
  late double unitPrice;

  Product(this.name, this.description, this.unitPrice);

  Product.withId(this.id, this.name, this.description, this.unitPrice);

  Map<String, dynamic> toMap() {
    // Object'i map'ledim
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["unitPrice"] = unitPrice;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Product.fromObject(dynamic o) {
    // map'lediğimi tekrar object'e çevirdim
    this.id = o["id"] != null ? int.tryParse(o["id"].toString()) : null;
    this.name = o["name"];
    this.description = o["description"];
    this.unitPrice = o["unitPrice"] != null ? double.tryParse(o["unitPrice"].toString())! : 0.0;
  }
}
