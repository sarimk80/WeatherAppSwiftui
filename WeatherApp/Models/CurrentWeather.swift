//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by sarim khan on 23/02/2022.
//

import Foundation

enum WeatherPageState {
    case Initial
    case Loading
    case Loaded(currentWeather:CurrentWeather)
    case Error(errorMessage:String)
}

struct CurrentWeather:Codable {
    let coord: Coord
    let weather:[Weather]
    let base:String
    let main:Main
    let visibility:Int
    let wind:Wind
    let clouds:Clouds
    let dt:CLong
    let sys:Sys
    let timezone:Int
    let id:Int
    let name:String
    let cod:Int
}

struct Coord: Codable{
    let lon:Double // 67,
    let lat: Double //43
}
struct Weather:Codable{
    let id : Int //802,
    let main:String  //"Clouds",
    let description:String //"scattered clouds",
    let icon:String //"03d"
}

struct Main:Codable{
    let temp :Double//": 11.75,
    let feels_like:Double//": 9.89,
    let temp_min:Double//": 11.75,
    let temp_max:Double//": 11.75,
    let pressure:Int//": 1022,
    let humidity:Int//": 35,
    let sea_level:Int?//": 1022,
    let grnd_level:Int?//": 1000
}

struct Wind:Codable{
    let speed:Double//": 1.71,
    let deg:Double//": 336,
    let gust:Double?//": 1.8
}

struct Clouds:Codable{
    let all:Int//": 34
}

struct Sys:Codable{
    let country:String//": "KZ",
    let sunrise:Int//": 1645582706,
    let sunset:Int//": 1645621963
    
    
}


var dummyWeather = CurrentWeather(coord: Coord(lon: 67, lat: 43), weather: [Weather(id: 802, main: "Clouds", description: "scattered clouds", icon: "03d")], base: "stations", main: Main(temp: 11.75, feels_like: 9.89, temp_min: 11.75, temp_max: 11.75, pressure: 1022, humidity: 35, sea_level: 1022, grnd_level: 1000), visibility: 10000, wind: Wind(speed: 1.71, deg: 336, gust: 1.8), clouds: Clouds(all: 34), dt: 1645609496, sys: Sys(country: "KZ", sunrise: 1645582706, sunset: 1645621963), timezone: 18000, id: 1524787, name: "South Kazakhstan Region", cod: 200)

/* {
 "coord": {
 "lon": 67,
 "lat": 43
 },
 "weather": [
 {
 "id": 802,
 "main": "Clouds",
 "description": "scattered clouds",
 "icon": "03d"
 }
 ],
 "base": "stations",
 "main": {
 "temp": 11.75,
 "feels_like": 9.89,
 "temp_min": 11.75,
 "temp_max": 11.75,
 "pressure": 1022,
 "humidity": 35,
 "sea_level": 1022,
 "grnd_level": 1000
 },
 "visibility": 10000,
 "wind": {
 "speed": 1.71,
 "deg": 336,
 "gust": 1.8
 },
 "clouds": {
 "all": 34
 },
 "dt": 1645609496,
 "sys": {
 "country": "KZ",
 "sunrise": 1645582706,
 "sunset": 1645621963
 },
 "timezone": 18000,
 "id": 1524787,
 "name": "South Kazakhstan Region",
 "cod": 200
 } */
