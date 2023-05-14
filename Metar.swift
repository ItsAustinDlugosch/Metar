import Foundation

class Metar {        

    let station_id : String
    let observation_time : Timestamp?
    let latitude : Float?
    let longitude : Float?
    let temp_c : Float?
    let dewpoint_c : Float?
    let wind : Wind?
    let visibility_statute_mi : Float?
    let altim_in_hg : Double?
    let sea_level_pressure_mb : Float?
    let corrected : Bool?
    let auto : Bool?
    let auto_station : Bool?
    let maintenance_indicator_on : Bool?
    let no_signal : Bool?
    let lightning_sensor_off : Bool?
    let freezing_rain_sensor_off : Bool?
    let present_weather_sensor_off : Bool?
    let wx_string : String
    let clouds: [Cloud?]
    let flight_category : String
    let three_hr_pressure_tendency_mb : String
    let maxT_c : String
    let minT_c : String
    let maxT24hr_c : String
    let minT24hr_c : String
    let precip_in : Float?
    let pcp3hr_in : Float?
    let pcp6hr_in : Float?
    let pcp24hr_in : Float?
    let snow_in : Float?
    let vert_vis_ft : Float?
    let metar_type : String
    let elevation_m : Int?

    init?(station_id: String,
          observation_time: Timestamp?,
          latitude: Float?,
          longitude: Float?,
          temp_c: Float?,
          dewpoint_c: Float?,
          wind : Wind?,
          visibility_statute_mi: Float?,
          altim_in_hg: Double?,
          sea_level_pressure_mb: Float?,
          corrected: Bool?,
          auto: Bool?,
          auto_station: Bool?,
          maintenance_indicator_on: Bool?,
          no_signal: Bool?,
          lightning_sensor_off: Bool?,
          freezing_rain_sensor_off: Bool?,
          present_weather_sensor_off: Bool?,
          wx_string: String,
          clouds: [Cloud?],
          flight_category: String,
          three_hr_pressure_tendency_mb: String,
          maxT_c: String,
          minT_c: String,
          maxT24hr_c: String,
          minT24hr_c: String,
          precip_in: Float?,
          pcp3hr_in: Float?,
          pcp6hr_in: Float?,
          pcp24hr_in: Float?,
          snow_in: Float?,
          vert_vis_ft: Float?,
          metar_type: String,
          elevation_m: Int?) {
        
        self.station_id = station_id
        self.observation_time = observation_time
        self.latitude = latitude
        self.longitude = longitude
        self.temp_c = temp_c
        self.dewpoint_c = dewpoint_c
        self.wind = wind
        self.visibility_statute_mi = visibility_statute_mi
        self.altim_in_hg = altim_in_hg
        self.sea_level_pressure_mb = sea_level_pressure_mb
        self.corrected = corrected
        self.auto = auto
        self.auto_station = auto_station
        self.maintenance_indicator_on = maintenance_indicator_on
        self.no_signal = no_signal
        self.lightning_sensor_off = lightning_sensor_off
        self.freezing_rain_sensor_off = freezing_rain_sensor_off
        self.present_weather_sensor_off = present_weather_sensor_off
        self.wx_string = wx_string
        self.clouds = clouds
        self.flight_category = flight_category
        self.three_hr_pressure_tendency_mb = three_hr_pressure_tendency_mb
        self.maxT_c = maxT_c
        self.minT_c = minT_c
        self.maxT24hr_c = maxT24hr_c
        self.minT24hr_c = minT24hr_c
        self.precip_in = precip_in
        self.pcp3hr_in = pcp3hr_in
        self.pcp6hr_in = pcp6hr_in
        self.pcp24hr_in = pcp24hr_in
        self.snow_in = snow_in
        self.vert_vis_ft = vert_vis_ft
        self.metar_type = metar_type
        self.elevation_m = elevation_m
    }

    convenience init?(fields: [String]) {
        guard fields.count == 43 else {
            print("Unexpected field length when processing \(fields) of count \(fields.count)")
            return nil
        }
        self.init(station_id: fields[0],
                  observation_time: Timestamp(fields: fields[1].split(whereSeparator: { ["-", "T", ":", "Z"].contains($0) }).map(String.init)),
                  latitude: Float(fields[2]),
                  longitude: Float(fields[3]),
                  temp_c: Float(fields[4]),
                  dewpoint_c: Float(fields[5]),
                  wind: Wind(fields: [fields[6], fields[7], fields[8]]),
                  visibility_statute_mi: Float(fields[9]),
                  altim_in_hg: Double(fields[10]),
                  sea_level_pressure_mb: Float(fields[11]),
                  corrected: Bool(fields[12].lowercased()),
                  auto: Bool(fields[13].lowercased()),
                  auto_station: Bool(fields[14].lowercased()),
                  maintenance_indicator_on: Bool(fields[15].lowercased()),
                  no_signal: Bool(fields[16].lowercased()),
                  lightning_sensor_off: Bool(fields[17].lowercased()),
                  freezing_rain_sensor_off: Bool(fields[18].lowercased()),
                  present_weather_sensor_off: Bool(fields[19].lowercased()),
                  wx_string: fields[20],
                  clouds: [Cloud(baseAGL: Int(fields[21]), cover: String(fields[22])),
                           Cloud(baseAGL: Int(fields[23]), cover: String(fields[24])),
                           Cloud(baseAGL: Int(fields[25]), cover: String(fields[26])),
                           Cloud(baseAGL: Int(fields[27]), cover: String(fields[28]))],
                  flight_category: fields[29],
                  three_hr_pressure_tendency_mb: fields[30],
                  maxT_c: fields[31],
                  minT_c: fields[32],
                  maxT24hr_c: fields[33],
                  minT24hr_c: fields[34],
                  precip_in: Float(fields[35]),
                  pcp3hr_in: Float(fields[36]),
                  pcp6hr_in: Float(fields[37]),
                  pcp24hr_in: Float(fields[38]),
                  snow_in: Float(fields[39]),
                  vert_vis_ft: Float(fields[40]),
                  metar_type: fields[41],
                  elevation_m: Int(fields[42]))
    }
    
    convenience init?(line: String) {
        self.init(fields: line.components(separatedBy: ","))
    }
                                
}
extension Metar : CustomStringConvertible {
    var description: String {
        var description = "\(station_id)"
        if observation_time != nil {
            description += " \(observation_time!)"
        }
        if let auto = auto, auto {
            description += " AUTO"
        }
        if let wind = wind {
            description += " \(wind)"
        }
        if let visibility_statute_mi = visibility_statute_mi {
            description += " \(Int(visibility_statute_mi))SM"
        }       
        return description + " \(flight_category)"
    }
}
