//
//  PermissionService.swift
//  WeatherApp
//
//  Created by sarim khan on 23/02/2022.
//

import Foundation
import CoreLocation

class PermissionService: NSObject, ObservableObject, CLLocationManagerDelegate{

    @Published var authorizationStatus: CLAuthorizationStatus = CLAuthorizationStatus.notDetermined
    let locationManager = CLLocationManager()
    
    override init() {
        super.init().self
        locationManager.delegate = self
        
    }

func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    authorizationStatus = manager.authorizationStatus
    
    switch manager.authorizationStatus {
    case .notDetermined:
        locationManager.requestWhenInUseAuthorization()
    case  .denied:
        locationManager.requestWhenInUseAuthorization()
    case .restricted:
        locationManager.requestWhenInUseAuthorization()
    case .authorizedAlways:
        locationManager.startUpdatingLocation()
    case .authorizedWhenInUse:
        locationManager.startUpdatingLocation()
    default:
        authorizationStatus = CLAuthorizationStatus.notDetermined
    }
}
}
