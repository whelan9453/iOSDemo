//
//  ViewController.swift
//  HowsTheWeather
//
//  Created by 丁偉倫 on 28/02/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func sendRequest(_ sender: Any) {
        if let mLocation = locationTextField.text {
            print("location is \(mLocation)")
            if mLocation != "" {
                updateWeatherInfo(location: mLocation)
            } else {
                resultLabel.text = "please enter a valid location"
            }
            
        }
    }
    
    func updateWeatherInfo(location :String){
        var mLocation = location
        if location.contains(" ") {
            mLocation = location.replacingOccurrences(of: " ", with: "-")
        }
        if let mUrl = URL(string: "http://www.weather-forecast.com/locations/\(mLocation)/forecasts/latest") {
            print("mUrl = \(mUrl)")
            let mRequest = URLRequest(url: mUrl)
            let task = URLSession.shared.dataTask(with: mRequest) {
                data, response, error in
                if error != nil {
                    print("error: \(error!)")
                } else {
                    if let unWrappingData = data {
                        let dataString = NSString(data: unWrappingData, encoding: String.Encoding.utf8.rawValue)!
                        var returnStr = "";
                        print(dataString)
                        if dataString.contains("The page you were looking for doesn't exist") {
                            returnStr = "Cannot find your location, please retry later."
                        } else {
                            returnStr = self.handleWeatherString(rawData: dataString)
                        }
                        //update ui here
                        DispatchQueue.main.sync {
                            print("update ui here")
                            self.resultLabel.text = returnStr
                        }
                    }
                }
            }
            task.resume()
            
        } else {
            print("something is wrong with the url")
            resultLabel.text = "Cannot recognize your location, please retry later."
        }
    }
    
    func handleWeatherString(rawData :NSString) -> String {
        let summaryStr = NSString(string: rawData)
        let temp = summaryStr.components(separatedBy: "3 Day")[1] as NSString
        let temp2 = temp.components(separatedBy: "span")[3] as NSString
        let temp3 = temp2.substring(from: 16) as NSString
        let temp4 = temp3.substring(to: temp3.length - 2)
        return temp4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

