void main() {
  // Animal().move();
  // Fish().move();
  Bird().move();
}

class Animal {
  void move() {
    print('changed position');
  }
}

class Fish extends Animal {
  @override
  void move() {
    super.move();
    print('by swimming');
  }
}

class Bird extends Animal {
  @override
  void move() {
    super.move();
    print('by flying');
  }
}

mixin CanSwim {
  void swim() {
    print('changed position by swimming');
  }
}

mixin CanFly {
  void canFly() {
    print('changed position by flying');
  }
}

/// Duck can swim and fly but we can't extend from 2 class so we create mixin
class Duck extends Animal with CanFly, CanFly {}

class Airplane with CanFly {}
