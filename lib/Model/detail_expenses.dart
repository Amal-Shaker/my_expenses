class DetailExpenses {
  int? id;
  String? name;
  double? price;
  String? date;
  String? time;

  DetailExpenses({this.name, this.date, this.time, this.id, this.price});

  DetailExpenses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['name'] = this.name;
    data['date'] = this.date;
    data['time'] = this.time;

    return data;
  }
}
