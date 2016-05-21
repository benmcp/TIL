# Classes

## What are classes?

A class is essentially a template/blueprint that creates an object. JS classes is nothing new for the world of javascript, it is rather a cleaner syntax for managing objects.

In most languages, classes contain methods (member functions) and variables (initial member variables) with 'member' meaning contained.

When a new class is called, an instance of that class is created.

Using a bicylce as an example, a class is a template for a bike. A bike works a particular way/has a particular method with varibales such as the number of gears affecting how it functions. The class isn't the bike, the class is only a blueprint for the bike. The actual bike is an instance of the bicycle class.

 Another powerful feature of classes is that classes can inherit features from another class. The class HipsterBicycle extends upon the Bicycle class which it's own additional variables and methods.

## How do we use ES2015 classes?

Let's break it down piece by piece.

### Classes can be declared as follows:

```javascript
class bicycle {
	constructor(speed, gear) {
		this.speed = speed;
		this.gear = gear;
		console.log('constructor called');
	}
	changeGear(newGear){
		this.gear = newGear;
		console.log('changed gear');
	}
}
var bike = new bicycle(0, 1);

```

### Methods

#### Constructors

In the above example, when a new instance of the class is instantiated, the variables `0` and `1` are passed into the `constructor`. This defines the initial properties when instantiated.

#### Static and Prototype

Static methods are methods that are called by the class and not the instance of the class.

While prototype methods are called by the instance of the class and not the class itself.

This can be best summed up with the below:

```javascript

class hipsterBicycle {
	
	constructor(speed, gear){
		this.speed = speed;
		this.gear = gear;
		console.log('constructor called -> bike instance created');
	}

	static honkStaticHorn(){
		console.log("Novelty Static Horn");
	}
	honkHorn(){
		console.log("Novelty Horn");
	}

}

hipsterBicycle.honkStaticHorn(); // Novelty Static Horn
hipsterBicycle.honkHorn(); // is not a function

var bike = new hipsterBicycle();

bike.honkStaticHorn(); // not a function
bike.honkHorn(); // Novelty Horn

```

### Extend and Super

Extends are common amongst other languages such as PHP which allows a class to extend on another class.

Super constructors calls the constructor of the parent class.

In the below example, the hipster bicycle class extends the bicycle class with the super constructor inheriting the bikes constructor variables.

main.js
```javascript
import {bicycle} from "./modules/bicycle";
import {hipsterbicycle} from "./modules/hipsterBicycle";

var bike = new bicycle(10,1);
console.log(bike.checkBike());

bike.changeGear(2);
console.log(bike.checkBike());

bike.goFaster(2);
console.log(bike.checkBike().speed);

var hipBike = new hipsterbicycle(1,1);
console.log(hipBike.checkBike());

hipBike.goFaster(5);
hipBike.honkHorn();

```

bicycle.js
```javascript
class bicycle {
	constructor(speed, gear) {
		this.speed = speed;
		this.gear = gear;
		console.log('constructor called');
	}
	checkBike(){
		return {
			speed: this.speed, 
			gear: this.gear
		};
	}
	changeGear(newGear){
		this.gear = newGear;
		console.log('changed gear');
	}
	goFaster(increment){
		this.speed += increment;
		console.log('goFaster');
	}
	brakes(increment){
		this.speed -= increment;
		console.log('break');
	}
}

export bicycle;

```

hipsterBicycle.js
```javascript

import {bicycle} from "./bicycle";

class hipsterBicycle extends bicycle {
	
	constructor(speed, gear){
		super(speed, gear);
		this.sideBag = true;
	}

	honkHorn(){
		console.log("Novelty Horn");
	}

}

export hipsterBicycle;

```

### Getter/Setter

To better control variables, the mutator method was introducted with classes:

```javascript

class hipsterShirt {
	
	constructor(style) {
		this.style = style;
	}

	get style() {
		return this.type;
	}

	set style(value) {
		return this.type = value;
	}
}

var shirt = new hipsterShirt('red and black check');
console.log(shirt.style); // red and black check
shirt.style = 'ironic icon t-shrit';
console.log(shirt.style); // ironic icon t-shrit

```
