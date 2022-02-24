//
//  WeatherApiProtocols.swift
//  WeatherApp
//
//  Created by sarim khan on 24/02/2022.
//

import Foundation
import Combine

protocol WeatherApi {
    func getWeather(latitude:Double,longitude:Double)  -> AnyPublisher<CurrentWeather,Error>
}
