//
//  ViewController.swift
//  Maps
//
//  Created by 丁偉倫 on 04/03/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondViewController" {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.test = "hello"
        }
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        latitudeLabel.text = String(userLocation.coordinate.latitude)
        longitudeLabel.text = String(userLocation.coordinate.longitude)
        altitudeLabel.text = String(userLocation.altitude)
        speedLabel.text = String(userLocation.speed)
        courseLabel.text = String(userLocation.course)
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print("error: \(error)")
            } else {
                if let placemark = placemarks?[0] {
                    var mAddress = ""
                    
                    if placemark.subThoroughfare != nil {
                        mAddress += placemark.subThoroughfare! + "\n"
                    }
                    
                    if placemark.thoroughfare != nil {
                        mAddress += placemark.thoroughfare! + "\n"
                    }
                    
                    if placemark.subLocality != nil {
                        mAddress += placemark.subLocality! + "\n"
                    }
                    
                    if placemark.subAdministrativeArea != nil {
                        mAddress += placemark.subAdministrativeArea! + "\n"
                    }
                    
                    if placemark.postalCode != nil {
                        mAddress += placemark.postalCode! + "\n"
                    }
                    
                    if placemark.country != nil {
                        mAddress += placemark.country! + "\n"
                    }
                    
                    self.addressLabel.text = mAddress
                }
            }
        }
    }

}

