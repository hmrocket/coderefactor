//
//  LocationManager.swift
//  Salewhale
//
//  Created by Carine Domingo on 2020-07-05.
//  Copyright © 2020 Salewhale. All rights reserved.
//

import UIKit
import Combine
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    let objectWillChange = PassthroughSubject<Void, Never>()

    override init() {
      super.init()

      self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
      self.locationManager.requestWhenInUseAuthorization()
    }
}
