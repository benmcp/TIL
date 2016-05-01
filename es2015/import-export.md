# Import and Export

The import statement is used to bring in functions/classes/variables from other files that have been exported. Import statements must be declared at the top of the file.

## Import types

Import the default member or class from fileOne.js

main.js
```javascript
Import ClassOne from "./fileOne"
```

fileOne.js
```javascript
class ClassOne {
	static output(){
		return "Output One";
	}
}
export default ClassOne;
```

Import all functions from fileOne.js

main.js
```javascript
Import * from "./fileOne"

console.log(fnOne());

```

fileOne.js
```javascript
function fnOne(){
	return "fnOne";
}
function fnTwo(){
	return "fnTwo";
}

export {fnOne, fnTwo};
```

Import a member from module where the member may be a class, funtion or variable.

main.js
```javascript
Import {ClassOne} from "./fileOne"
```

fileOne.js
```javascript
class ClassOne {
	static output(){
		return "Output One";
	}
}

export {ClassOne};
```

An important element to note is the difference between importing the `defaultMember` and a `member`. This can be exemplified below:

fileOne.js
```javascript
class ClassOne {
	static output(){
		return "Output One";
	}
}

export {ClassOne};
```

fileTwo.js
```javascript
class ClassTwo {
	static output(){
		return "Output Two";
	}
}

export default ClassTwo;
```

main.js
```javascript
import {ClassOne} from "./modules/fileOne";
import ClassOne from "./modules/fileOne";  // ClassOne is undefined as there is no defaultMember exported
import ClassTwo from "./modules/fileTwo";
import {ClassTwo} from "./modules/fileTwo"; // ClassTwo is undefined as tehre is no member exported
```
Import only two members
main.js
```javascript
Import {fnOne, fnTwo} from "./fileOne"

console.log(fnOne());
console.log(fnTwo());
console.log(fnThree()); // Uncaught ReferenceError: fnThree is not defined

```

fileOne.js
```javascript
function fnOne(){
	return "fnOne";
}
function fnTwo(){
	return "fnTwo";
}
function fnThree(){
	return "fnThree";
}

export {fnOne, fnTwo};
```