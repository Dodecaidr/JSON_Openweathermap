//
//  Category.swift
//  SkillBox13
//
//  Created by Илья Лобков on 05/11/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import Foundation

class Category {
    let temp : String
    let dt_txt : String
    
    init?(data:NSDictionary) {
        guard let temp = data["temp"] as? String,
            let dt_txt = data["dt_txt"] as? String else {
                return nil
        }
        self.temp = temp
        self.dt_txt = dt_txt
    }
}
