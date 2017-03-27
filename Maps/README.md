# Maps

### Apple Map

````swift
class ViewController: UIViewController, CLLocationManagerDelegate
````

````swift
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
````

````swift
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
````

### Pass Data Through Segue

````swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondViewController" {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.test = "hello"
        }
        
    }
````
