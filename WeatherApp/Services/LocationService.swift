//
//  LocationService.swift
//  WeatherApp
//
//  Created by sarim khan on 23/02/2022.
//

import Foundation
import CoreLocation
import Combine


class LocationService: NSObject , ObservableObject, CLLocationManagerDelegate {
    
    
    let locationManager = CLLocationManager()
    
    @Published var currentLocation : CLLocationCoordinate2D?
    @Published var errorString : String = ""
    @Published var authorizationStatus: CLAuthorizationStatus = CLAuthorizationStatus.notDetermined
    
    override init() {
       
        super.init()
        authorizationStatus = locationManager.authorizationStatus
        locationManager.delegate = self
        
       
       
    }
    
    func requestLocation(){
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {
            return
        }
        currentLocation = lastLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        errorString = error.localizedDescription
    }
    
}
