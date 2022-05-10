//
//  UserAddRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation
import UIKit

class UserAddRemoteDataManager:UserAddRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: UserAddRemoteDataManagerOutputProtocol?
    
    
    func externalCheckUser(email: String) {
        guard let objUrl = URL(string: "https://api.escuelajs.co/api/v1/users/is-available") else {return}
        var peticion = URLRequest(url: objUrl)
        peticion.httpMethod = "POST"
        peticion.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let datos : [String : Any] = ["email" : email]
        
        peticion.httpBody = try? JSONSerialization.data(withJSONObject: datos, options: .fragmentsAllowed)
        
        let tarea = URLSession.shared.dataTask(with: peticion, completionHandler: {
            data, response, error in
            
            guard let datosR = data, error == nil else {return}
            
            do{
                
                
                let respuesta = try? JSONDecoder().decode(CheckUser.self, from: datosR)
                
                if respuesta?.isAvailable == true
                {
                    self.remoteRequestHandler?.remotePushCheckUser(userExist: true)
                }else{
                    self.remoteRequestHandler?.remotePushCheckUser(userExist: false)
                }
                
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
                      self.remoteRequestHandler?.remotePushImageAdded(imageAdded: jsonData!.location)
                  }
              }).resume()
    }
    
    func externalAddUser(name : String, email : String, password : String, avatar : String) {
        
        guard let objUrl = URL(string: "https://api.escuelajs.co/api/v1/users/") else {return}
        var peticion = URLRequest(url: objUrl)
        peticion.httpMethod = "POST"
        peticion.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let datos : [String : Any] = ["name" : name,
                                      "email" : email,
                                      "password" : password,
                                      "avatar" : avatar]
        
        peticion.httpBody = try? JSONSerialization.data(withJSONObject: datos, options: .fragmentsAllowed)
        
        let tarea = URLSession.shared.dataTask(with: peticion, completionHandler: {
            data, response, error in
            
            guard let datosR = data, error == nil else {return}
            
            do{
                
                guard let _ = try? JSONSerialization.jsonObject(with: datosR, options: .fragmentsAllowed)
                else{
                    self.remoteRequestHandler?.remotePushUserAdded(added: false)
                    return
                }
               
                self.remoteRequestHandler?.remotePushUserAdded(added: true)
            }
        })
        
        tarea.resume()
    }
    
    

}
