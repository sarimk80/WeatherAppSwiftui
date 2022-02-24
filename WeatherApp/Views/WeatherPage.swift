//
//  WeatherPage.swift
//  WeatherApp
//
//  Created by sarim khan on 23/02/2022.
//

import SwiftUI

struct WeatherPage: View {
    
    var weatherModel:CurrentWeather
    @StateObject var weatherViewModel:WeatherPageViewModel = WeatherPageViewModel()
    
    var body: some View {
        
        VStack{
            
            switch weatherViewModel.weatherPageState {
            case .Loading:
                ProgressView()
            case .Error(let error):
                Text(error)
            case .Loaded(let currentWeather):
                VStack {
                    HStack {
                        VStack(alignment:.leading, spacing: 8) {
                            Text(Converters.timestampToDate(timeZone: Double(currentWeather.sys.sunrise)))
                                .font(.title2)
                                .fontWeight(.regular)
                            Text(currentWeather.name)
                                .font(.title3)
                                .fontWeight(.regular)
                            Text(currentWeather.sys.country)
                                .font(.subheadline)
                                .fontWeight(.regular)
                        }
                        
                        
                        Spacer()
                        
                        Text(currentWeather.weather.first?.main ?? "")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .rotationEffect(Angle(degrees: 90))
                        
                        
                    }
                    Spacer()
                    
                    AsyncImage(url: URL(string: "http://openweathermap.org/img/wn/\(currentWeather.weather.first?.icon ?? "50d")@2x.png")!) { image in
                        image
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.75)
                    } placeholder: {
                        ProgressView()
                    }

                    Spacer()
                    
                    
                    HStack {
                        Text("\(currentWeather.main.temp,specifier: "%.1f")\u{00B0}")
                            .font(.system(size: 70))
                            .fontWeight(.heavy)
                        
                        Text("C")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Spacer()
                        
                    }
                    
                }
                .padding()
                
            default:
                ProgressView()
            }
        }
        .onAppear(perform: {
            weatherViewModel.getCurrentWeather(latitude: 24.910530, longitude: 67.099970)
        })
        
        
        
        
        //24.910530
    }
}

struct WeatherPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherPage(weatherModel: dummyWeather)
            //            WeatherPage(weatherModel: dummyWeather)
            //                .previewDevice("iPad Air (4th generation)")
            //            WeatherPage(weatherModel: dummyWeather)
            //                .previewDevice("iPhone SE (2nd generation)")
            //            WeatherPage(weatherModel: dummyWeather)
            //                .previewDevice("iPhone 8")
        }
    }
}
