class Food {
  String? thName;
  String? enName;
  int? price;
  bool? checked;

  //constructor
  Food(this.thName, this.enName, this.price, this.checked);

  static getFood() {
    return [
      Food('พิซซ่า', 'Pizza', 199, true),
      Food('สเต็ก', 'Steak', 99,false),
      Food('สลัดผลไม้', 'salad', 149,false),
      Food('ปูไข่ดอง', 'crab', 289,false),
      Food('แซลมอนดอง', 'shrimp', 359,false),
      Food('ส้มตำปูปลาร้า', 'papaya pokpok', 129,false),
      Food('ชาบู', 'Shabu', 399, false),
      Food('ซูชิ', 'Sushi', 299, false),
      Food('กิมจิ', 'kimji', 159, false),
    ];
  }
}
