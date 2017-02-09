# Async

```
import async from 'async';

testThis function (arg1, callback) {
  arg2 = arg1 + ' foo';
  callback(null, arg2);
}

async.waterfall(
  [
    (callback) => {
      callback(null, 'one')
    },
    testThis,
    (arg1, callback) => {
      console.log('arg1 ' + arg1);
      callback(null, arg1, 'two')
    },
    (arg1, arg2, callback) => {
      console.log('arg2 ' + arg2);
      callback(null, arg1, arg2, 'done')
    },
  ],
  (err, arg1, arg2, result) => {
    console.log('the end');
    console.log(arg1, arg2);
    console.log(result);
  }
);
```