//
//  ClimaManager.swift
//  clima_BJGD
//
//  Created by Mac19 on 30/11/20.
//  Copyright © 2020 ITM. All rights reserved.
//

import Foundation

//creando mi propio protocolo, se tendra que adopatr el protoolo actualizarclima afuerzas
protocol ClimaManagerDelegate {
    func actualizarClima (clima : ClimaModelo)
    func huboError (cualError : Error)
}

struct ClimaManager {
    
    var delegado : ClimaManagerDelegate?
    
    let climaURL = "https://api.openweathermap.org/data/2.5/weather?appid=4b97ddbd88a76f74872e36717a15a158&units=metric&lang=es"
    
    func fetchClima (nombreCiudad : String){
        let urlString = "\(climaURL)&q=\(nombreCiudad)"
        print(urlString)
        
        realizarSolicitud(urlString: urlString)
    }
    
    func realizarSolicitud (urlString : String){
        //1.- Crear URL
        if let url = URL(string: urlString ){
            
            //2.- Crear objeto URLSession
            let session = URLSession (configuration: .default)
            
            //3.- Dar una tarea a la sesion URLSession
           // let tarea = session.dataTask(with: url, completionHandler: handle(data:respuesta:error:))
            let tarea = session.dataTask(with: url) { (data, respuesta, error) in
                           if error != nil {
                              // print(error!)
                            self.delegado?.huboError(cualError: error!)
                               return
                           }
                           if let datosSeguros = data{
                            
                            //crear obj personalizado
                            if let clima = self.parseJSON(climaData: datosSeguros){
                                self.delegado?.actualizarClima(clima: clima)
                            }
                        }
                 }
            
            //4.- empezar tarea
            tarea.resume()
            
            }
    }
        
    
    func parseJSON(climaData: Data) -> ClimaModelo? {
        let decoder = JSONDecoder()
        do{
       let dataDecodificada = try decoder.decode(ClimaData.self, from: climaData)
            let id = dataDecodificada.weather[0].id
            let nombre = dataDecodificada.name
            let descripcion = dataDecodificada.weather[0].description
            let temperatura = dataDecodificada.main.temp
        
        //Craer obj personalizado
            let ObjClima = ClimaModelo(condicionId: id, nombreCiudad: nombre, temperaturaCelsius: temperatura, descripcionClima: descripcion)
            
            return ObjClima
        }catch{
            print(error)
            delegado?.huboError(cualError: error)
            return nil
        }
    }
        
}
