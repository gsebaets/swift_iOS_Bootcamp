//
//  SecondViewController.swift
//  ex00
//
//  Created by Gaolatlhwe SEBAETSE on 2018/10/08.
//  Copyright © 2018 Gaolatlhwe SEBAETSE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var pins:[MyPoints] = []

class MyPoints : MKPointAnnotation {
    var pinColor: UIColor?
}

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Updated!")
    }
    
    @IBAction func mapViewType(_ sender: UISegmentedControl) {
        switch sender.titleForSegment(at: sender.selectedSegmentIndex)! {
            case "Standard":
            mapView.mapType = .standard;
            case "Satellite":
            mapView.mapType = .satellite;
            case "Hybrid":
            mapView.mapType = .hybrid;
            default:
            break ;
        }
    }
    
    @IBAction func locateMe(_ sender: UIButton) {
        
        let span = MKCoordinateSpanMake(0.004, 0.004)
        let myLocation = CLLocationCoordinate2DMake(mapView.userLocation.coordinate.latitude, mapView.userLocation.coordinate.longitude)
        let region = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true;
        mapView.setCenter(mapView.userLocation.coordinate, animated: true)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.selectedIndex = 1
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        
        let location = CLLocationCoordinate2DMake(48.8966, 2.3185)
        let zoom = MKCoordinateSpanMake(0.002, 0.002)
        let region = MKCoordinateRegionMake(location, zoom)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Ecolé 42"
        annotation.subtitle = "42 School"
        mapView.addAnnotation(annotation)
        
        
        makePoint(name: "Mafikeng", sub: "Home", longitude: 25.6403, latitude: -25.8560, color: .orange)
        makePoint(name: "39 Rissik", sub: "The shitty place I happen to live in", longitude:28.040191 , latitude: -26.204611, color: .blue)
        makePoint(name: "WeThinkCode_ CPT", sub: "The place where the wierd reside", longitude:18.4241 , latitude:-33.9249, color: .green)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makePoint(name: String, sub: String, longitude: Double, latitude: Double, color: UIColor) {
        let annotation = MyPoints()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude:longitude)
        annotation.title = name
        annotation.subtitle = sub
        mapView.addAnnotation(annotation)
        annotation.pinColor = color
        pins.append(annotation)
    }
}
