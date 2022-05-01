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
        
        avatarImage.accessibilityIdentifier = "avatarImage.png"
        print(avatarImage.accessibilityIdentifier!)
        
        let parameters = [
          [
            "key": "file",
            "src": avatarImage.accessibilityIdentifier!,
            "type": "file"
          ]] as [[String : Any]]

        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        
        for param in parameters {
          if param["disabled"] == nil {
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if param["contentType"] != nil {
              body += "\r\nContent-Type: \(param["contentType"] as! String)"
            }
            let paramType = param["type"] as! String
            if paramType == "text" {
              let paramValue = param["value"] as! String
              body += "\r\n\r\n\(paramValue)\r\n"
            } else {
              let paramSrc = param["src"] as! String
              let fileData = (try? NSData(contentsOfFile:paramSrc, options:[]) as Data)!
              let fileContent = String(data: fileData, encoding: .utf8)!
            body += "; filename=\"\(paramSrc)\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
          }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.escuelajs.co/api/v1/files/upload")!,timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
       
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
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
