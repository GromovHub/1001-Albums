import Foundation

func writeToFile() {
    struct StructToEncode: Codable {
        let name: String
        let id: Int
    }
    let instanceToEncode = StructToEncode(name: "Oliver", id: 26)
    guard let pathToWrite = Bundle.main.path(forResource: "fileToWrite", ofType: "json") else {
        print("invalid path")
        return
    }
    let urlToWrite = URL(fileURLWithPath: pathToWrite)
    let directoryToSave = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    let pathToSave = directoryToSave?.appendingPathComponent("file\(String(Int.random(in: 0...1000))).json")
    do {
        let dataToWrite = try JSONEncoder().encode(instanceToEncode)
        print(String(decoding: dataToWrite, as: UTF8.self))
        try dataToWrite.write(to: pathToSave!)
        
    } catch {
        print("encode failed \n",error)
    }
}

writeToFile()

