//
//  ContentView.swift
//  WeatherApp
//
//  Created by sarim khan on 23/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationService:LocationService=LocationService()
    
    var body: some View {
       WeatherPage(weatherModel: dummyWeather)
        .onAppear {
            locationService.requestLocation()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
