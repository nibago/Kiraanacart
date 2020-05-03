//
//  ShowMapViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 28/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class ShowMapViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet var mapView : GMSMapView!
    @IBOutlet var mapViewPin : UIImageView!
    var locationManager = CLLocationManager()
    var geocoder = CLGeocoder()
    
    @IBOutlet weak var addressInfoLabel: UILabel!
    
    var locationLat = ""
    var locationLong = ""
    var locationName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
       addressInfoLabel.text = locationName
        
        print(locationName)
      locationLat =  "12.9177"
      locationLong = "77.6238"
        
        
        self.mapView.delegate = self
        
        var lat : Double = 0.0
        var lon : Double = 0.0
        print("locationLat",locationLat)
        print("locationLat",locationLong)
        lat = Double(locationLat)!
        lon = Double(locationLong)!
        
        let sydney = GMSCameraPosition.camera(withLatitude: lat,
                                              longitude: lon,
                                              zoom: 18)
        self.mapView.camera = sydney
        
        self.mapView?.isMyLocationEnabled = true

         //Location Manager code to fetch current location
         self.locationManager.delegate = self
         self.locationManager.startUpdatingLocation()
        
    }
    
  
    
  

}


extension ShowMapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        reverseGeocodeCoordinate(position.target)
    }
    
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        
        
    }
    
    private func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        // 1
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            
            guard let address = response?.firstResult(), let lines = address.lines, let cityName = address.locality else {
                return
            }
            
            self.locationLat = "\(address.coordinate.latitude)"
            self.locationLong = "\(address.coordinate.longitude)"
            self.addressInfoLabel.text = address.lines?.joined()
            
            
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
