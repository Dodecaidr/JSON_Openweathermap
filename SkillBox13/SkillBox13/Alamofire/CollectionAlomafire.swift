//
//  CollectionAlomafire.swift
//  SkillBox13
//
//  Created by Илья Лобков on 18/11/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import Foundation
import SVProgressHUD
import Alamofire


class AlomofireMetod {
    
    func loadAlomaCatigories(callback: @escaping ([Weather])->()) {
        Alamofire.request( "http://api.openweathermap.org/data/2.5/forecast?q=Moscow,ru&appid=f4e8241056c46e3ab2fa1983bf196af9&units=metric", method: .get).responseJSON { response in
            
            if let data = response.data {
                do {
                    let cityWether = try JSONDecoder().decode(Request.self, from: data)
                    var listAloma: [Weather] = []
                    cityWether.list.forEach { weather in
                        if let weather = weather {
                            listAloma.append(weather)
                        }
                    }
                    callback(listAloma)
                } catch let error {
                    print(error)
                }
            }
        }
    }
}

// https://openweathermap.org/forecast5
//https://openweathermap.org/weather-conditions

