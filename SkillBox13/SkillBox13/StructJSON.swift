//
//  StructJSON.swift
//  SkillBox13
//
//  Created by Илья Лобков on 19.12.2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import Foundation

struct Request:Decodable {
    var list : [Weather?]
}

struct Weather:Decodable {
    var main : Tempucher?
    var dt_txt : String?
    var weather : [IconStatus?]
}

struct Tempucher:Decodable {
    var temp : Float?
}

struct IconStatus:Decodable {
    var icon : String?
}
