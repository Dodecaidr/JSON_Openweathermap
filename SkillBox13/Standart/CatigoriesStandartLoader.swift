//
//  CatigoriesStandartLoader.swift
//  SkillBox13
//
//  Created by Илья Лобков on 07/11/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import Foundation

protocol CatigoriesDeligate{
    func load(catigories: [Category])
}

class CatigoriesStandartLoader {
    
    var delegate: CatigoriesDeligate?
    
    func loadCatigories() {
        
        let url = URL (string: "http://api.openweathermap.org/data/2.5/forecast?q=Moscow,ru&appid=f4e8241056c46e3ab2fa1983bf196af9&units=metric")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, respons, error in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments), let jsonDict = json as? NSDictionary{
                
               //print(json)
                
//                НЕ работает
                
                var catigories: [Category] = []
                for (_,data) in jsonDict where data is NSDictionary{
                    if let category = Category(data: data as! NSDictionary){
                        catigories.append(category)
                    }
                }
                
                print(catigories.count)
                self.delegate?.load(catigories: catigories)
                
                
            }
        }
        task.resume()
    }
}
