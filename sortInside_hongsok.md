```
print(readLine()!.sorted(by:>).reduce("",{String($0)+String($1)}))

// 줄여서 이렇게도 가능
print(readLine()!.sorted { $0 > $1 }.reduce("", { String($0) + String($1) }))


//
import Foundation

let line = readLine()!
let sorted = line.sorted { $0 > $1 }.reduce("", { String($0) + String($1) })

print(sorted)
```
