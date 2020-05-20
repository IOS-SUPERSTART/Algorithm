
import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var results = Array<Int>()
    for command in commands {
        let command1 = command[0]-1
        let command2 = command[1]
        let command3 = command[2]-1
        
        var temp = Array.init(array[command1..<command2])
        temp.sort()
        let result = temp[command3]
        results.append(result)
    }
    
    return results
}
DispatchQueue.init(label: "solution1").async {
    let start=Date()
    print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
    let end=Date()
    let time = start.distance(to: end)
    print("time : \(time)")
}
// ----------------------------------------------------------------------

func solution2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var results = Array<Int>()
    results = commands.compactMap {
        array[$0[0]-1..<$0[1]].sorted()[$0[2]-1]
    }
    return results
}
DispatchQueue.init(label: "solution2").async {
    let start2=Date()
    print(solution2([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
    let end2=Date()
    let time2 = start2.distance(to: end2)
    print("time2 : \(time2)")
}
// ----------------------------------------------------------------------

func solution3(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map(
        {
            (key) in
            return array[(key[0]-1)...(key[1]-1)].sorted()[key[2]-1]
        }
    )
}
DispatchQueue.init(label: "solution3").async {
    let start3=Date()
    print(solution3([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
    let end3=Date()
    let time3 = start3.distance(to: end3)
    print("time3 : \(time3)")
}

func getUsedMemory() -> UInt {
    var info = mach_task_basic_info()
    var count = mach_msg_type_number_t(MemoryLayout.size(ofValue: info) / MemoryLayout<integer_t>.size)
    let kerr = withUnsafeMutablePointer(to: &info) {
        infoPtr in return infoPtr.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
            (machPtr: UnsafeMutablePointer<integer_t>) in return task_info( mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), machPtr, &count )
        }
    }
    guard kerr == KERN_SUCCESS else {
        return 0
        
    }
    return UInt(info.resident_size)
}

