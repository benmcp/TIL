# Design Patterns - Revealing Modular Pattern

This pattern allows you to declare which variables and functions are to be exposed either directly or indirectly.

In the example below you can access the $public variable but you cannot direclty access the $private varible, but you can still alter it indireclty.

```javascript

var $revealingModule = (function(){

  var $public = "public";
  var $private = "private";
  
  function privateFn() {
  	console.log("Can't output '" + $private + "' it will be undefined'");
  }
  function publicSetFn( $new ) {
    $private = $new;
    return "Private var updated";
  }
  function publicGetFn(){
   privateFn();
  }
  return {
  	setVar: publicSetFn,
    getPublic: $public,
    getPrivate: publicGetFn
  };
})();

console.log($revealingModule.getPublic);
console.log($revealingModule.getPrivate());
console.log($revealingModule.setVar("Updated"));
console.log($revealingModule.getPrivate());

```
