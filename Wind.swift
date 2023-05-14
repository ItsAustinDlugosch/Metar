class Wind : CustomStringConvertible {
    let direction : String
    let speed : String
    let gust : String

    var description: String {
        var description = "\(direction)\(speed)"
        if gust != "00" {
            description += "G\(gust)"
        }
        return description + "KT"
    }

    init?(direction: String, speed: String, gust: String) {
        func prepend0(input: String, length: Int) -> String {
            var output = input
            while output.count < length {
                output = "0" + output
            }
            return output
        }
        self.direction = prepend0(input: direction, length: 3)
        self.speed = prepend0(input: speed, length: 2)
        self.gust = prepend0(input: gust, length: 2)
    }

    convenience init?(fields: [String]) {
        guard fields.count == 3 else {
            print("Unexpected field length when processing \(fields) of count \(fields.count)")
            return nil
        }
        self.init(direction: fields[0], speed: fields[1], gust: fields[2])
    }
}
