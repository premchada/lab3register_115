class Year {
  String? uyear;
  String? yearValue;

  //constructor
  Year(this.uyear, this.yearValue);

  static getYear() {
    return [
      Year('ปี1','one'),
      Year('ปี2','two'),
      Year('ปี3','three'),
      Year('ปี4','four'),
    ];
  }
}
