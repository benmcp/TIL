# Template Literals

Template Literals (pre  ES2015 String Literals) allow for strings to be created with extended syntacticaly components and functionality.

Template Literals are strings enclosed with the back quote or back tick (on the keyboard it is the key to the left of the 1).

## Multi-line strings

```javascript

var str = `this string is valid`;

var validStr = `this string
is also valid`;

console.log(str);
console.log(validStr);

```

The above example preserves the new line `\n`.

## Expression interpolation

```javascript

var colour = 'red';
var shirt = 5;
var pants = 1;

console.log(`The hipster is wearing a ${colour} bow tie and has ${shirt + pants} pockets.`);

```
## Tagged Templates

This allows you to manage the templates by modifying the output.

```javascript

var first = 'bow tie';
var second = 'is';

function unscramble(literal, ...value) {
	console.log(literal[0]);
	console.log(literal[2]);
	console.log(value[0]);
	console.log(literal[1]);
	console.log(value[1]);
	console.log(value);
	console.log(literal);
}

unscramble`The ${second}wearing a ${first}hipster`;

// output => The 
// output => hipster
// output => is
// output => wearing a 
// output => bow tie
// output => ["is","bow tie"]
// output => ["The ","wearing a ","hipster"]

```

