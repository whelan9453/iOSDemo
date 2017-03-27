# MemorablePlaces

### Pass Data Through the Segue
````swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toMap" {
        let mapViewController = segue.destination as! ViewController
        mapViewController.places = places
        mapViewController.activePlace = activePlace
    }
}
````

### Invoke Segue
````swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    activePlace = indexPath.row
    performSegue(withIdentifier: "toMap", sender: nil)
}
````

### Table View Basics
````swift
override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return places.count
}


override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")

    if places[indexPath.row]["name"] != nil {
        cell.textLabel?.text = places[indexPath.row]["name"]
    }

    return cell
}
````

### Set GestureRecognizer
````swift
let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress))
longPressRecognizer.minimumPressDuration = 2
map.addGestureRecognizer(longPressRecognizer)
````

### Set Map to the Selected Place
````swift
let name = places[activePlace]["name"]
let lat = places[activePlace]["lat"]
let lon = places[activePlace]["lon"]
if name != nil && lat != nil && lon != nil {
    let latD = Double(lat!)!
    let lonD = Double(lon!)!
    let center = CLLocationCoordinate2D(latitude: latD, longitude: lonD)
    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    map.setRegion(region, animated: true)
    let annotation = MKPointAnnotation()
    annotation.coordinate = center
    annotation.title = name
    map.addAnnotation(annotation)
}
````

### Set Annotation on the Map
````swift
let mAnnotation = MKPointAnnotation()
mAnnotation.coordinate = mCoordinate
mAnnotation.title = annotationTitle
map.addAnnotation(mAnnotation)
````

### Retrieve Location Information From the Coordinate
````swift
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
````

### LocationManager

Be sure to add CoreLocation.framework in project build phases and location privacy policies in the plist file.

func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) will be invoked every time the location information is updated.
```swift
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate


manager.delegate = self
manager.desiredAccuracy = kCLLocationAccuracyBest
manager.requestWhenInUseAuthorization()
manager.startUpdatingLocation()


func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
    let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    map.setRegion(region, animated: true)
}
````

### Set the Editable Attribute for the Table View
````swift
override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
}

override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        places.remove(at: indexPath.row)
        table.reloadData()
    }
}
````
