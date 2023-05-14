class Timestamp : CustomStringConvertible {
    let year : String
    let month : String
    let day: String

    let hour: String
    let minute: String
    let second: String

    var description: String {            
        return "\(day)\(hour)\(minute)Z"        
    }

    init?(year: String, month: String, day: String,
          hour: String, minute: String, second: String) {
        self.year = year
        self.month = month
        self.day = day

        self.hour = hour
        self.minute = minute
        self.second = second
    }

    convenience init?(fields: [String]) {        
        self.init(year: String(fields[0]), month: String(fields[1]), day: String(fields[2]),
                  hour: String(fields[3]), minute: String(fields[4]), second: String(fields[5]))
    }
}
