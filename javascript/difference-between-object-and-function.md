# What's the difference between an object and a function?

It's generally common for Front End Developers to view functions and objects are two different components but they are actual incredibly similar.

## What is a function?

Generally speaking, a function is `first-class object` or `functional object` with the additional feature of being able to be `called`. Calling a function is telling the program to execute the function:

```
function printInfo () {
  console.log('info here');
}

printInfo(); // <-- calling a function
```

## What is an object?

An object is a collection of properties, even when the total number of properties is 1. An object can be defined in two main ways:

```
var obj = new Object();
obj.colour = 'blue';
console.log(obj.colour); // <-- 'blue'

var obj = {
  colour: 'blue',
};
console.log(obj.colour); // <-- 'blue'
```

In the first example, an empty object `obj` is first declared and then a property is assigned. In the second example, an object is declared and a property is assigned in the one statement.

## How are objects and functions similar?

The best way to illustrate this is show the same output using a function and an object:

```
var shirt = {
  colour: 'blue',
  getColour: function () {
    return 'colour is ' + this.colour;
  },
};

console.log(shirt.colour); // <-- 'blue';
console.log(window.shirt.colour); // <-- 'blue';
console.log(shirt.getColour()); // <-- 'colour is blue';

var shirt = new function () {
  this.colour = 'blue';
};

console.log(shirt.colour); // <-- 'blue';
console.log(window.shirt.colour); // <-- 'blue';
```

## How are they different?

Put simply, functions can be called.

### Side note on function `this`

Take the following two example:

```
// example 1

var shirt = new function () {
  this.colour = 'blue';
  this.getColour = function () {
     return 'colour is ' + this.colour;
  };
};

console.log(shirt.getColour()); // <-- colour is blue
console.log(window.getColour()); // <-- window.getColour is not a function

// example 2

var shirt2 = function () {
  this.colour = 'blue';
  this.getColour2 = function () {
     return 'colour is ' + this.colour;
  };
};

shirt2();

console.log(shirt2.getColour2()); // <-- window.getColour2 is not a function
console.log(window.getColour2()); // <-- colour is blue
```

What is happening here?

In example 1, we are calling a `new function` which creates and function object. This cases `this` to be set to the function object `shirt`.

In example 2, we are calling shirt2 using `shirt2()`. However, `this` isn't set by the call so it defaults to a global object, in which case this is `window`. The reason why `shirt.getColour()` can reference the parent function's `this.colour` is the exact same reason as to why `getColour2()` defaults to the global object.

## Function prototypes

It is worth noting that all functions have a `prototype` property by default where the prototype is an object. The prototype allows objects to inherit methods and variables from their prototype. This can be seen below:

```
function Person(first, age) {
    this.firstName = first;
    this.age = age;
}

var Jack = new Person('James', 30);
var Jill = new Person('Jill', 30);

Person.prototype.eyeColour = 'blue'; // <-- eyeColour added to the existing prototype
Person.hairColour = 'black'; // <-- hairColour assigned to the function object

console.log(Jack.eyeColour); // <-- blue
console.log(Jack.hairColour); // <-- undefined

console.log(Person.hairColour);  // <-- 'black'
console.log(Person.prototype.eyeColour); // <-- 'blue'
```

In the above example, `eyeColour` is inherited from the Person prototype even if it assigned after `Jack` has been assigned.