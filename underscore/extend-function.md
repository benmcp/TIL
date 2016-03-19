# Extending Objects

Underscore has this incredibly useful function called extend. This extends the components of an object - plain and simple. On the site it [provides the example:](http://underscorejs.org/#extend)

```javascript
_.extend({name: 'moe'}, {age: 50});
```

Which outputs:

```javascript
=> {name: 'moe', age: 50}
```

However, this update the original object! Concider the following example:

```javascript
var dude = {
	underwear : true,
	pants: false
};

var attire = {
	pants: 'jeans',
	shirt: 't-shirt'
}
_.extend(dude, attire);

/*
	console.log(dude)

	{
		underwear : true,
		pants: 'jeans',
		shirt: 't-shirt'
	}
*/
```
In the above example, the dude will forever be wearing pants! Solution?

```javascript
var dudeAtHome = {
	underwear : true,
	pants: false
};

var attire = {
	pants: 'jeans',
	shirt: 't-shirt'
}

dudeInPublic = _.extend({}, dude, attire);

/*
	console.log(dudeInPublic)

	{
		underwear : true,
		pants: 'jeans',
		shirt: 't-shirt'
	}

	console.log(dudeAtHome)

	{
		underwear : true,
		pants: false
	}

*/
```
Now, we have a extended object, while still preserving the original.

Pretty sweet.