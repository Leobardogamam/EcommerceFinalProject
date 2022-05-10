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
    var token:Token?
    
    func logingAuth(email: String, password: String) {
        guard let objUrl = URL(string: "https://api.escuelajs.co/api/v1/auth/login") else{return}
        var peticion = URLRequest(url: objUrl)
        peticion.httpMethod = "POST"
        peticion.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let datos: [String:Any] = ["email": email,"password": password]
        peticion.httpBody = try? JSONSerialization.data(withJSONObject: datos, options: .fragmentsAllowed)
        let tarea = URLSession.shared.dataTask(with: peticion,completionHandler: { data, response, error in
            guard let datosR = data, error == nil else{return}
            do{
                let respuesta = try JSONDecoder().decode(Token.self, from: datosR)
                self.token = respuesta
                print(respuesta)
                if self.token?.access_token.count ?? 0 > 0{
                    self.PresentPrincipalVew(token: respuesta)
                } else{
                    print("errores")
                }
            }catch{
                print(error)
                self.remoteRequestHandler?.isAvailable(isAvailable: false)
            }
        })
        tarea.resume()
    }
    
    func PresentPrincipalVew(token:Token){
        print(token.access_token)
        let token = token.access_token
        let url = URL(string: "https://api.escuelajs.co/api/v1/auth/profile")!
        // prepare json data
        let json: [String: Any] = ["State": 1]
        _ = try? JSONSerialization.data(withJSONObject: json)
        // create post request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // insert json data to the request
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let datosDecodificados = try? JSONDecoder().decode(Users.self, from:data)
            print(datosDecodificados!)
            self.remoteRequestHandler?.isAvailable(isAvailable: true)
            self.remoteRequestHandler?.returnUser(user: datosDecodificados!)
            
        }.resume()
    
    }
}
