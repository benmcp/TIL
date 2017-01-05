# compose(...functions)

## What is it?

This funciton combines the list of funcitons from right to left to return a `composed` function

## Very simple example of composing two functions

```
const f = (x) => {
	return `Hi ${x}`;
};

const g = (x) => {
	return `${x}, hope you have a nice day!`;
};

const compose = (x) => {
	return f(g(x));
}

console.log(compose('Dave'));
```