//
//  ClimaModelo.swift
//  clima_BJGD
//
//  Created by Mac19 on 01/12/20.
//  Copyright © 2020 ITM. All rights reserved.
//

import Foundation

struct ClimaModelo{
    let condicionId : Int
    let nombreCiudad : String
    let temperaturaCelsius : Double
    let descripcionClima : String
    
    var obtenerCondicionClima : String{
         switch condicionId  {
               case 200 ... 232:
                   return "lluvia2.jpg"
               case 300 ... 321:
                   return "llovizna.jpg"
               case 500 ... 531:
                   return "lluvia.jpg"
               case 600 ... 622:
                   return "nieve.jpg"
               case  800:
                   return "despejado.jpg"
               case 701:
                   return "neblina.jpg"
               case 801 ... 804:
                   return "limpio.jpg"
               default:
                   return "soleado.jpg"
               }
        
        
    }

    
}
