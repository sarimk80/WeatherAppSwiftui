//
//  WeatherPageViewModel.swift
//  WeatherApp
//
//  Created by sarim khan on 23/02/2022.
//

import Foundation
import Combine

class WeatherPageViewModel: ObservableObject{
    
    @Published var weatherPageState:WeatherPageState=WeatherPageState.Initial
    
    let weatherApiService:WeatherApiService=WeatherApiService()
    var cancellable=Set<AnyCancellable>()
    
    
    func getCurrentWeather(latitude:Double,longitude:Double)  {
        weatherPageState=WeatherPageState.Loading
        weatherApiService.getWeather(latitude: latitude, longitude: longitude)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.weatherPageState=WeatherPageState.Error(errorMessage: "\(error)")
                    print("\(error)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] currentWeather in
                print(currentWeather)
                self?.weatherPageState=WeatherPageState.Loaded(currentWeather: currentWeather)
            }
            .store(in: &cancellable)

    }
    
    
}
