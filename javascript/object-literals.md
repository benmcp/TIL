```
var obj = {

  public: 'public',
  private: 'private',

  privateFn: function () {
    console.log("Can't output '" + obj.private + "' it will be undefined'");
  },

  publicSetFn: function ( newPrivate ) {
    obj.private = newPrivate;
    return 'Private var updated';
  },

  publicGetFn: function () {
   obj.privateFn();
  },
};

var publicObj = {
  setVar: obj.publicSetFn,
  getPublic: obj.public,
  getPrivate: obj.publicGetFn,
};

console.log(publicObj.getPublic);
console.log(publicObj.getPrivate());
console.log(publicObj.setVar('Updated'));
console.log(publicObj.getPrivate());
```

Todo - update code/explain what is happening.