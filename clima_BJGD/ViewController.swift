//
//  ViewController.swift
//  clima_BJGD
//
//  Created by Mac19 on 30/11/20.
//  Copyright © 2020 ITM. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate , ClimaManagerDelegate{
    func huboError(cualError: Error) {
        DispatchQueue.main.async {
            self.ciudadLabel.text = cualError.localizedDescription
            
        }
        
        print(cualError.localizedDescription)
    }
    
    
    func actualizarClima(clima: ClimaModelo) {
        print("Imprimiendo desde viweController \(clima.temperaturaCelsius)")
        
        //actualizar
        DispatchQueue.main.async {
            self.temperaturaLabel.text = String(clima.temperaturaCelsius)
            self.ciudadLabel.text = clima.descripcionClima
            //CAMBIAR IMAGEN DE FONDO SEGUN EL ID
            self.imagenFondoClima.image = UIImage(named: clima.obtenerCondicionClima)
            
        }
        
        
        //imprimiendo en consola
        print (clima.condicionId)
        print(clima.descripcionClima)
        print(clima.obtenerCondicionClima)
        
    }
    

    @IBOutlet weak var imagenFondoClima: UIImageView!
    @IBOutlet weak var buscarButton: UIButton!
    @IBOutlet weak var buscarTextFiel: UITextField!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    
    var climaManager = ClimaManager()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        climaManager.delegado = self
        buscarTextFiel.delegate = self
        
    }
    
    func textFielDidEndEditing( textField : UITextField){
        buscarTextFiel.text = ""
    }
    
    //ACTIVA EL CODIGO DEL BOTON BUSCAR EN EL TECLADO
    func textFieldShouldReturn (_ textField : UITextField) -> Bool{
        print(buscarTextFiel.text!)
        return true
    }
    
    //validar si el usuario escribio algo en el textField
    
    func textFieldShouldEndEditing(_ textField : UITextField) -> Bool {
        if buscarTextFiel.text != "" {
            return true
        }else{
            buscarTextFiel.placeholder = "ESCRIBIR UNA CIUDAD"
            print("Por favor escribir algo...")
            return false
        }
    }
    
    
    @IBAction func buscarCiudadButton(_ sender: UIButton) {
        print(buscarTextFiel.text!)
        ciudadLabel.text = buscarTextFiel.text
        climaManager.fetchClima(nombreCiudad: buscarTextFiel.text!)
        
    }
    


}

