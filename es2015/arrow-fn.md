# Arrow functions

## What are arrow functions?

On a basic level, arrow functions are a shorthand version of anonymous functions. Below is an exmple of the same function written in a shorten (arrow function) version.

```javascript

var c = function(a, b){
	return Math.sqrt(a*a + b*b);
}

var c = (a, b) => {return Math.sqrt(a*a + b*b)};
var cImplied = (a, b) => Math.sqrt(a*a + b*b);

// abother example

var hipsterQuote = function(){
	return "Is it organic?";
}

var hipsterQuote = () => "Is it organic?";

```

So what? That is where lexical this comes in.

## Lexical this

Lexical `this` refers to the `this` relating to the containing function. WHy is this important? The most comnmon example to show this is the following:

```javascript

function Counter() {
  this.number = 0;
  console.log(this.number);

  setInterval(function count() {
    this.number++;
    console.log(this.number);
  }, 1000);
}

var count = new Counter();

```

This will output `0`, followed by `null` every second when using js strict mode. Why is this? because `this.number` is defined to the instance of the object while the `this.number++` is define to the instance of the anonymous fn.

What is the solution?

Prior to ES2015, the solution was to use `self` or `that`;

```javascript

function Counter() {
  var self = this;
  self.number = 0;
  console.log(self.number);

  setInterval(function count() {
    self.number++;
    console.log(self.number);
  }, 1000);
}

var count = new Counter();

```

However, in ES2015, we can use the following:

```javascript

function Counter() {
  this.number = 0;
  console.log(this.number);

  setInterval(() => {
    this.number++;
    console.log(this.number);
  }, 1000);
}

var count = new Counter();

```

Notice that `this.number` is bound to the inital `this.number` in the parent function. This removes the necessity of using `self` and `that` which is syntactically cleaner.

