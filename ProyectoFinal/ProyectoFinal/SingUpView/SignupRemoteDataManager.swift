//
//  SignupRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//
//

import Foundation
import UIKit

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
    
    func externalAddImage(avatarImage: UIImage) {
        
        let nombreParametro = "file"
        let nombreArchivo = "avatarImagen.png"
        //Genera y válida URL
              guard let url = URL(string: "https://api.escuelajs.co/api/v1/files/upload") else {return}
              //Para entidades de tipo multipart la directiva boundary es obligatoria. Ella consiste en una secuencia de 1 a 70 caracteres de un conjunto conocido por su robustez en pasarelas de correo electrónico, y no pueden terminar con espacios en blanco. Es usada para encapsular los limites de los mensajes de múltiples partes.
              let boundary = UUID().uuidString
              var urlRequest = URLRequest(url: url)
              urlRequest.httpMethod = "POST"
              urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
              var data = Data()
              data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
              data.append("Content-Disposition: form-data; name=\"\(nombreParametro)\"; filename=\"\(nombreArchivo)\"\r\n".data(using: .utf8)!)
              data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
              data.append(avatarImage.pngData()!)
              data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
              print(String(decoding: data, as: UTF8.self))
              URLSession.shared.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
                  if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                      print("statusCode debería ser 200 y es \(httpStatus.statusCode)")
                      print("response = \(response)")
                  }
                  if error == nil {
                      let jsonData = try? JSONDecoder().decode(ImageAdded.self, from: responseData!)
                      self.remoteRequestHandler?.remotepushImageAdded(imageAdded: jsonData!.location)
                  }
              }).resume()
    }
    
    func externalAddUser(email: String, password: String, name: String, avatar: String) {
        
        guard let objUrl = URL(string: "https://api.escuelajs.co/api/v1/users/") else {return}
        var peticion = URLRequest(url: objUrl)
        peticion.httpMethod = "POST"
        peticion.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let datos : [String : Any] = ["name" : name,
                                      "email" : email,
                                      "password" : password,
                                      "avatar" : avatar]
        
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

struct Imagenes: Codable {
    var file: Data?
}
