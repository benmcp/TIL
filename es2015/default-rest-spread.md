# Default, Rest and Spread

Parameters have been upgraded with the addition of defaults, rest and spreads.

## Default

Previously we had to load functions as follows:

```javascript

function test(one, two) {
	two = two || 0;
	return one + two;
}

console.log(test(1,1)); // 2
console.log(test(1)); // 1

```

But with defaults, we can use the following:

```javascript

function test(one, two = 0) {
	return one + two;
}

console.log(test(1,1)); // 2
console.log(test(1)); // 1

var test = (a = 1, b = 1, c = a*b) => c;

console.log(test(5));

```

Using arrow functions we can turn this:

```javascript

function test(a,b) {
  a = a || 1;
  b = b || 1;
  return a*b;
}

console.log(test(5));

```

Into this:

```javascript

var test = (a = 1, b = 1, c = a*b) => c;

console.log(test(5));

```

## Rest

This is a small addition wherein a collection of remaining parameters can be turned into an array, rather than explicityly gettintg the arguments via `Array.prototype.slice.call(arguments)` then iterating through.

```javascript

function satchelBag(first, ...items) {
	console.log(first);
	items.forEach(function (item) {
		console.log(item);
	});
}

satchelBag('kale','organic juice','beard trimmer','typewriter');

// ouput=> kale
// ouput=> organic juice
// ouput=> beard trimmer
// ouput=> typewriter

```

## Spread

Syntactically similar to rest but applying to all variables.

```javascript

function satchelBag(...items) {  // <-- slight difference
	items.forEach(function (item) {
		console.log(item);
	});
}

satchelBag('kale','organic juice','beard trimmer','typewriter');

// ouput=> kale
// ouput=> organic juice
// ouput=> beard trimmer
// ouput=> typewriter

```

This can also be used in arrays:

```javascript

var a = ['one','two'];

var b = [...a, 'three', 'four'];

console.log(b);
// output=> ["one","two","three","four"]

```