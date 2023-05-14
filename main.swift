import Foundation

func readCSVFile() -> String? {
    do {        
        let contents = try String(contentsOfFile: "./Example-metars.csv")
        return contents
    } catch {
        print("File read error: \(error)")
    }
    return nil
}

func parseCSVFile(contents: String) -> [[String]] {
    let lines = contents.components(separatedBy: .newlines).filter { !$0.isEmpty }
    return lines.map { $0.components(separatedBy: ",") }        
}

func main() {
    if let contents = readCSVFile() {
        var data  = parseCSVFile(contents: contents)

        for _ in 1 ... 6 {
            data.remove(at: 0)
        }
                
        var metars = [Metar?]()
        for index in 0 ..< data.count {
            data[index].removeFirst()
            metars.append(Metar(fields: data[index]))
        }
        metars.forEach { $0 != nil ? print($0!) : print("Failed Metar") }        
    } else {
        print("Failed to read the CSV File.")
    }
}

main()
