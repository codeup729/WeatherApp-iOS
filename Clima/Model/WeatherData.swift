//
//  WeatherData.swift
//  Clima
//
//  Created by Anitej Srivastava on 04/08/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit

struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}
struct Main: Decodable{
    let temp: Double
}
struct Weather: Decodable{
    let description: String
    let id: Int
}
