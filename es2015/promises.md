# Promises

A promise represents a single asynchronous operation. ES2015 provides a pattern/method to declare an operation that hasn't been completed but is expected to be completed.

The simplest way to demonstate this is via a `setTimeout() method`. Take the following example:

```
function waitOneMoment() {
  return new Promise(
    (resolve, reject)=> {
      setTimeout(
        ()=> resolve('break over'), 
        5000
      );
    }
  )
}

var test = waitOneMoment()
  .then(
    (res)=> {
      console.log(res);
    },
    (reason)=> {
      console.log(reason);
    }
  );
```

In the above example we call the function  `waitOneMoment`, which returns a `Promise` that will either `resolve` or `reject` (ommitted from example) the promise. `Then` is a fulfilment handler which will return a resolved or rejected value.

TODO - Show examples of all methods/prototypes/examples of breaking promises.