# HowsTheWeather

### Download Web Content
````swift
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
````

