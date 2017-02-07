# Javascript sleep

```javascript
function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}

console.log(new Date());
console.log('Dude!');
sleep(1000); // 1 秒 (1000 milliseconds)
console.log(new Date());
```
