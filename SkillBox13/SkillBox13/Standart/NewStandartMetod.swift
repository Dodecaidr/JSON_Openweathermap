//
//  NewStandartMetod.swift
//  SkillBox13
//
//  Created by Илья Лобков on 09/11/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import Foundation
import SVProgressHUD



class NewStandartMetod {
    
    func loadCatigories(callback: @escaping ([Weather])->()) {
        
        let urlString = "http://api.openweathermap.org/data/2.5/forecast?q=Moscow,ru&appid=f4e8241056c46e3ab2fa1983bf196af9&units=metric"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            
            guard let data = data else {return}
            guard error == nil else {return}
            do {
                let cityWether = try JSONDecoder().decode(Request.self, from: data)
                var list: [Weather] = []
                cityWether.list.forEach { weather in
                    if let weather = weather {
                        list.append(weather)
                    }
                }
                callback(list)
            } catch let error {
                print(error)
            }
        }.resume()
        
    }
    
}
