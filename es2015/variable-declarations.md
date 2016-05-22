# Variable Declarations - Let and Const

Previously variables were declared using the `var` shorthand.

`var` declares a varaible statement and is declared before JS code is executed. The scope of a variable is contained to within the function. If it is not contained, it globally accessible. If a variable is undeclared, or referenced beyond it's scope, it will throw a reference error:

```javascript

var a = 'one';

function test(condition){

	if(condition === true) {
		var b = 'two';
	}
	console.log(b);
}
test(true);

console.log(a);  // ouput> one
console.log(b);  // b is not defined in the global scope

```

## let

`let` declares a variable statement that is contained within the enclosing block, expression or statement. `let` is also defined within any sub-block.

```javascript

let a = 'one';

function test(condition){

	if(condition === true) {
		let b = 'two';
	}
	console.log(a); // ouput> one
	console.log(b); // b is not defined 
}
test(true);

console.log(a);  // ouput> one
console.log(b);  // b is not defined in the global scope

```

This creates cleaner code as variables can be better contained. 

Additionally, if the varaible is declared twice in the same block, and error will occur:

```javascript

let a = 'one';
var test = true;

console.log(a);

if (test === true) {
	let a = 'two';
	console.log(a);
	let a = 'three'; // Uncaught SyntaxError: Identifier 'a' has already been declared
	console.log(a);
}

```

## const

`const`	on the other hand creates a readonly declaration, meaning that it cannot be reassigned. `const` also contains additional scoping limit where it is contained to the enclosing block:

```javascript

const a = 'one';
var test = true;

console.log(a);

if (test === true) {
	const a = 'two';
	console.log(a);
}

console.log(a);

// output=> one
// output=> two
// output=> one

```