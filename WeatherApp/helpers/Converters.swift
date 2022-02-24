//
//  Converters.swift
//  WeatherApp
//
//  Created by sarim khan on 23/02/2022.
//

import Foundation

class Converters{
    static func timestampToDate(timeZone:Double) -> String{
        let date = Date(timeIntervalSince1970: timeZone)
        let dateFromate = DateFormatter()
        dateFromate.dateFormat = "EEEE, MMM d, yyyy"
        return dateFromate.string(from: date)
    }
}
