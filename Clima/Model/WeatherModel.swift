//
//  WeatherModel.swift
//  Clima
//
//  Created by Anitej Srivastava on 04/08/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let temp: Double
    let conditionId: Int
    let cityName: String
    
    var temperature: String{
        return String(Int(temp))
    }
    var getConditionName: String{
        switch conditionId {
        case 200..<233:
            return "cloud.bolt"
        case 300..<322:
            return "cloud.drizzle"
        case 500..<532:
            return "cloud.rain"
        case 600..<623:
            return "cloud.snow"
        case 700..<782:
            return "smoke"
        case 800:
            return "sun.max"
        case 801..<805:
            return "cloud"
        default:
            return "Not found"
        }
    }
}
