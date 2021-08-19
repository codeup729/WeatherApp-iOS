//
//  WeatherManager.swift
//  Clima
//
//  Created by Anitej Srivastava on 03/08/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weather: WeatherModel)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=7d212b10be1a109720078e66305d5738&units=metric"
    
    var delegate: WeatherManagerDelegate?
    func fetchWeather(city: String){
        let urlString = "\(weatherURL)&q=\(city)"
        performRequest(urlString)
    }
    func fetchWeather(latitude: CLLocationDegrees,longitude: CLLocationDegrees ){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            let weatherModel = WeatherModel(temp: temp, conditionId: id, cityName: cityName)
            
            return weatherModel
        }
        catch{
            print(error)
            return nil
        }
        
    }
}


