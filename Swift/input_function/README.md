# Scanner for swift 

```swift
import Foundation

func input() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    return NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)! as String
}

print("What is your name?")

var userName = input()

print("\nHello " + userName)
```
