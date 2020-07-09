import Foundation

let line = readLine()!
let sorted = line.sorted { $0 > $1 }.reduce("", { String($0) + String($1) })

print(sorted)
