class Course {
  String? thcourse;
  String? courseValue;

  //constructor
  Course(this.thcourse, this.courseValue);

  static getCourse() {
    return [
      Course('วิทยาการคอมพิวเตอร์', 'cs'),
      Course('เทคโนโลยีสารสนเทศ', 'it'),
    ];
  }
}
