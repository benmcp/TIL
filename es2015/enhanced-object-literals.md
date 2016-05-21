# Enhanced Object Literals

This allows for syntactically shorter code when declaring objects. This affects Property Value declarations, Object Methods and Dynamic Propeties.

How is this achieved? Lets take the following code prior to to ES2015:

## Property Values

```javascript

var one = 1;
var two = 2;
var three = 3;

var obj = {
	one: one,
	two: two,
	three: three
};

```

This will output `{"one":1,"two":2,"three":3}`. But we can do better:

```javascript

var one = 1;
var two = 2;
var three = 3;

var obj = {
	one,
	two,
	three
};

```

This allows us to declare an object literal where `one:one,` becomes `one,`.

## Object Methods

With ES2015 we have a new object method shorthand. We can take this:

```javascript

var obj = {
	doStuff: function() {
		console.log('do stuff');
	},
	moreStuff: function() {
		console.log('more stuff');
	}
};

obj.doStuff();
obj.moreStuff();

```

And change it into this:

```javascript

var obj = {
	doStuff() {
		console.log('do stuff');
	},
	moreStuff() {
		console.log('more stuff');
	}
};

obj.doStuff();
obj.moreStuff();

```

Bonus - and if we incorporate Arrow Functions:

```javascript

var obj = {
	doStuff: () => console.log('do stuff'),
	moreStuff: () => console.log('more stuff')
};

obj.doStuff();
obj.moreStuff();

```

## Dynamic Propeties

And finally, dynamic property names:

```javascript

var extra = 'ExtraSpecial';
var extraFn = 'ExtraSpecialFn';

var obj = {
	doStuff() {
		console.log('do stuff');
	},
	moreStuff() {
		console.log('more stuff');
	},
	['do' + extra] : 'do ' + extra + ' stuff',
	['do' + extraFn]() {
		console.log('do ' + extraFn + ' stuff');
	}
};

obj.doStuff(); // outputs = > do stuff
obj.moreStuff(); // outputs = > more stuff
console.log(obj.doExtraSpecial); // outputs = > do ExtraSpecial stuff
obj.doExtraSpecialFn(); // outputs = > do ExtraSpecialFn stuff

```
