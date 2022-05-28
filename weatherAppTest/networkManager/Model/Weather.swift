import UIKit
import Foundation

// MARK: - Weather
struct Weather: Codable {
    let coord: Coord
    let weather: [WeatherElement]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int
    #warning("To fix parsing issue make seaLevel optional, i.e. Int?")
    #warning("Maybe you will have to make some other properties oprtional too")
    #warning("Also I would recommend to make a nested struct (one inside another)")
    #warning("It's common practice to do like this. See below")
    
//    struct Weather: Codable {
//        let coord: Coord
//        let weather: [WeatherElement]
//        let base: String
//        let main: Main
//        let visibility: Int
//        let wind: Wind
//        let clouds: Clouds
//        let dt: Int
//        let sys: Sys
//        let timezone, id: Int
//        let name: String
//        let cod: Int
//
//        struct Coord {
//
//        }
//
//        struct Clouds {
//
//        }
//
//        etc...
//    }
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
