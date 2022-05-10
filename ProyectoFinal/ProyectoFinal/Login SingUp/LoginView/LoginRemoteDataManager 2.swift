//
//  LoginRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//
//

import Foundation

class LoginRemoteDataManager:LoginRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: LoginRemoteDataManagerOutputProtocol?
    var userList : [Users]?
    
    func externalGetUsers() {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/users") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let json = data else {return}
            
            //Serializar los datos
            do{
                let decoder = JSONDecoder()
                self.userList = try decoder.decode([Users].self, from: json)
                self.remoteRequestHandler?.remoteDataManagerCallBackData(with: self.userList!)
                
            }catch let error{
                print("Ha ocurrido un error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
