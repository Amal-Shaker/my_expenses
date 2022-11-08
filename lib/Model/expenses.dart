class Expenses {
  int? id;
  int? category_id;
  double? price;
  Expenses({this.category_id, this.id, this.price});

  Expenses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category_id = json['category_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.category_id;
    data['price'] = this.price;
    return data;
  }
}
