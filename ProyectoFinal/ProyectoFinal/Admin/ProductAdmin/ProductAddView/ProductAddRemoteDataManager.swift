//
//  ProductAddRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductAddRemoteDataManager:ProductAddRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: ProductAddRemoteDataManagerOutputProtocol?
    
    
    var categories : [Categories]?
    
    func externalGetCategories() {
        
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/categories") else{return}
        let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard let datos = data else{
                print("No hay datos en la solicitud")
                return
            }
            do{
                let datosDecodificados = try JSONDecoder().decode([Categories].self, from:datos)
                self.categories = datosDecodificados
                self.remoteRequestHandler?.remoteDataManagerCallBackCategories(with: self.categories!)
                 }catch{
                print("Ocurrio un error al convertir los datos")
            }
        }
        tarea.resume()
    }
    
    func externalUploadImage(productImage: UIImage) {
                let nombreParametro = "file"
                let nombreArchivo = "productImagen.png"
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
                      data.append(productImage.pngData()!)
                      data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
                      print(String(decoding: data, as: UTF8.self))
                      URLSession.shared.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
                          if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                              print("statusCode debería ser 200 y es \(httpStatus.statusCode)")
                              print("response = \(String(describing: response))")
                          }
                          if error == nil {
                              let jsonData = try? JSONDecoder().decode(ImageAdded.self, from: responseData!)
                              self.remoteRequestHandler?.remoteDataManagerCallBackImageAdded(with : jsonData!.location)
                          }
                      }).resume()

    }
    
    func externalAddProduct(title: String, price: Int, description: String, categoryId: Int, image: String) {
        
        guard let objUrl = URL(string: "https://api.escuelajs.co/api/v1/products/") else{return}
        var peticion = URLRequest(url: objUrl)
        peticion.httpMethod = "POST"
        peticion.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let datos:[String:Any] = ["title": title,
                                  "price": price,
                                  "description": description,
                                  "categoryId": categoryId,
                                  "images": [image
                                  ]]
        
        peticion.httpBody = try? JSONSerialization.data(withJSONObject: datos, options: .fragmentsAllowed)
        
        let tarea = URLSession.shared.dataTask(with: peticion, completionHandler: {
          data, response, error in
            guard let datosR = data, error == nil else{return}
            do{
                guard let _ = try? JSONSerialization.jsonObject(with: datosR, options: .fragmentsAllowed) else{
                    self.remoteRequestHandler?.remoteDataManagerCallBackProductAdded(added: false)
                    return
                }
                self.remoteRequestHandler?.remoteDataManagerCallBackProductAdded(added: true)
            }
        })
        tarea.resume()
    }
    
}
