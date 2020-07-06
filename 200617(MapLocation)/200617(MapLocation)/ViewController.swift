//
//  ViewController.swift
//  200617(MapLocation)
//
//  Created by hyu on R 2/06/17.
//  Copyright © Reiwa 2 hyu. All rights reserved.
//

import UIKit
import MapKit //point 1
import CoreLocation  //point 2

class ViewController: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        self.locationManager.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) { //zuvshuurul
        CLLocationManager.locationServicesEnabled()
    
        let status = CLLocationManager.authorizationStatus()
        if(status == CLAuthorizationStatus.notDetermined){
            print("NotDetermined")
              
            locationManager.requestWhenInUseAuthorization()
            
        }
        else if(status == CLAuthorizationStatus.restricted){
         print("restriced")
        }
        else if(status == CLAuthorizationStatus.authorizedWhenInUse){
         print("authorizedWhenInUse")
        }
        else if(status == CLAuthorizationStatus.authorizedAlways){
         print("authorizedAlways")
        }
        else{
         print("not allowed")
    }
        locationManager.startUpdatingLocation()
        
        var region: MKCoordinateRegion = mapView.region
        region.center = mapView.userLocation.coordinate
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        
        mapView.setRegion(region, animated:true)
        self.view.addSubview(mapView)
        
        mapView.mapType = MKMapType.hybrid
        mapView.userTrackingMode = MKUserTrackingMode.follow //follow system
        mapView.userTrackingMode = MKUserTrackingMode.followWithHeading //north compass
        
        
    }
}
