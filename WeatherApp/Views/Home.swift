//
//  Home.swift
//  WeatherApp
//
//  Created by sarim khan on 23/02/2022.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var permissionService:PermissionService = PermissionService()
    
    var body: some View {       
        ZStack {
            switch permissionService.authorizationStatus {
            case .notDetermined:
                Text("Asking for permission")
            case .restricted:
                Text("Restricted")
            case .denied:
                Text("denied")
            case .authorizedWhenInUse:
                ContentView()
            case .authorizedAlways:
                ContentView()
            case .authorized:
                Text("Authorized")
            default:
                Text("Loading")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
