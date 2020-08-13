class Rectangle {

  // Constructor
  constructor(height, width) {
    // Member variables
    this.height = height;
    this.width = width;

    // Access static member variable
    Rectangle.count++;
  }

  // Getter
  get area() {
    return this.calcArea();
  }

  // Method
  calcArea() {
    return this.height * this.width;
  }

  // Static method
  static calcArea(width, height) {
    return width * height;
  }
}
