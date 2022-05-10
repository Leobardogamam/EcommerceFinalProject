//
//  UserRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/7/22.
//  
//

import Foundation

class UserRemoteDataManager:UserRemoteDataManagerInputProtocol {
   
    
    var remoteRequestHandler: UserRemoteDataManagerOutputProtocol?
    
    var users : [Users]?
    
    func externalGetUsers() {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/users") else{return}
        let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard let datos = data else{
                print("No hay datos en la solicitud")
                return
            }
            do{
                let datosDecodificados = try JSONDecoder().decode([Users].self, from:datos)
                self.users = datosDecodificados
                self.remoteRequestHandler?.remoteDataManagerCallBackUsers(with: self.users!)
            }catch{
                print("Ocurrio un error al convertir los datos")
            }
        }
        tarea.resume()
    }
    
}
