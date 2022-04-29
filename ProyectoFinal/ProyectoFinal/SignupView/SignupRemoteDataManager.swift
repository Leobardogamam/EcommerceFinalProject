//
//  SignupRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation

class SignupRemoteDataManager:SignupRemoteDataManagerInputProtocol {
  
    var remoteRequestHandler: SignupRemoteDataManagerOutputProtocol?
    
    func externalCheckUser(email: String) {
        guard let objUrl = URL(string: "https://api.escuelajs.co/api/v1/users/is-available") else {return}
        var peticion = URLRequest(url: objUrl)
        peticion.httpMethod = "POST"
        peticion.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let datos : [String : Any] = ["email" : email]
        
        peticion.httpBody = try? JSONSerialization.data(withJSONObject: datos, options: .fragmentsAllowed)
        
        var tarea = URLSession.shared.dataTask(with: peticion, completionHandler: {
            data, response, error in
            
            guard let datosR = data, error == nil else {return}
            
            do{
                
                
                var respuesta = try? JSONDecoder().decode(CheckUser.self, from: datosR)
                
                if respuesta?.isAvailable == true
                {
                    self.remoteRequestHandler?.remotePushCheckUser(userExist: true)
                }else{
                    self.remoteRequestHandler?.remotePushCheckUser(userExist: false)
                }
                
            }catch{
                print(error)
            }
            
        })
        
        tarea.resume()
    }
    
    func externalAddUser(email: String, password: String, name: String) {
        
        guard let objUrl = URL(string: "https://api.escuelajs.co/api/v1/users/") else {return}
        var peticion = URLRequest(url: objUrl)
        peticion.httpMethod = "POST"
        peticion.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let datos : [String : Any] = ["name" : name,
                                      "email" : email,
                                      "password" : password]
        
        peticion.httpBody = try? JSONSerialization.data(withJSONObject: datos, options: .fragmentsAllowed)
        
        var tarea = URLSession.shared.dataTask(with: peticion, completionHandler: {
            data, response, error in
            
            guard let datosR = data, error == nil else {return}
            
            do{
                
                
                var user = try? JSONDecoder().decode(UserAdded.self, from: datosR)
                self.remoteRequestHandler?.remotepushUserAdded(userAdded: user!)
                
               
                
            }catch{
                print(error)
            }
            
        })
        
        tarea.resume()
    }
}
