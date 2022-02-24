//
//  WeatherApiService.swift
//  WeatherApp
//
//  Created by sarim khan on 24/02/2022.
//

import Foundation
import Combine

class WeatherApiService: WeatherApi{
    func getWeather(latitude: Double, longitude: Double) -> AnyPublisher<CurrentWeather, Error> {
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&units=metric&appid=3c414449be05bed5857c0cef0686220f")
        
        return URLSession.shared.dataTaskPublisher(for: url!)
            .map({$0.data})
            .decode(type: CurrentWeather.self, decoder: JSONDecoder())
            .receive(on:DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
}

