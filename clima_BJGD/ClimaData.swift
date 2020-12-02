//
//  ClimaData.swift
//  clima_BJGD
//
//  Created by Mac19 on 01/12/20.
//  Copyright © 2020 ITM. All rights reserved.
//

import Foundation

struct ClimaData : Codable {
    let name : String
    let timezone : Int
    let main : Main
    let coord : Coord
    let weather : [weather]
}

struct  Main : Codable{
    let temp: Double
}

struct Coord : Codable{
    let lon : Double
    let lat : Double
}

struct weather : Codable{
    let id: Int
    let description : String
}
