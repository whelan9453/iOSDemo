//
//  ViewController.swift
//  MemorablePlaces
//
//  Created by 丁偉倫 on 06/03/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var manager = CLLocationManager()

//    var places = [[String:String]()]
//    var activePlace = -999
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("places in map: \(places)")
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress))
        longPressRecognizer.minimumPressDuration = 2
        map.addGestureRecognizer(longPressRecognizer)
        setMapToSelectedPlace()
    }
    
    func longPress(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            let touchPoint = gestureRecognizer.location(in: map)
            let mCoordinate = map.convert(touchPoint, toCoordinateFrom: map)
            print(mCoordinate)
            
            var annotationTitle = ""
            let mLocation = CLLocation(latitude: mCoordinate.latitude, longitude: mCoordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(mLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    print(error!)
                } else {
                    if let placemark = placemarks?[0] {
                        if placemark.subThoroughfare != nil {
                            annotationTitle += placemark.subThoroughfare!
                        }
                        if placemark.thoroughfare != nil {
                            annotationTitle += placemark.thoroughfare!
                        }
                    }
                }
            })
            
            if annotationTitle == "" {
                annotationTitle = "Added \(NSDate())"
            }
            
            let mAnnotation = MKPointAnnotation()
            mAnnotation.coordinate = mCoordinate
            mAnnotation.title = annotationTitle
            map.addAnnotation(mAnnotation)
            places.append(["name": annotationTitle, "lat": String(mCoordinate.latitude), "lon": String(mCoordinate.longitude)])
            
            UserDefaults.standard.set(places, forKey: KEY_PLACES)
        }
    }
    
//    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        print("go back to table view")
//        if let tableController = viewController as? PlacesTableViewController {
//            tableController.places = self.places
//        }
//    }
    
    func setMapToSelectedPlace() {
        
        if activePlace == -1 {
            //add button is triggered
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
            return
        }
        
        if places.count > activePlace {
            let name = places[activePlace]["name"]
            let lat = places[activePlace]["lat"]
            let lon = places[activePlace]["lon"]
            if name != nil && lat != nil && lon != nil {
                let latD = Double(lat!)!
                let lonD = Double(lon!)!
                let center = CLLocationCoordinate2D(latitude: latD, longitude: lonD)
                let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                map.setRegion(region, animated: true)
                let annotation = MKPointAnnotation()
                annotation.coordinate = center
                annotation.title = name
                map.addAnnotation(annotation)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        map.setRegion(region, animated: true)
        map.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

