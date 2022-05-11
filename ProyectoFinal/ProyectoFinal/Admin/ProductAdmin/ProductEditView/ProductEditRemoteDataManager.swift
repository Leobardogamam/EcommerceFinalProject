//
//  ProductEditRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class ProductEditRemoteDataManager:ProductEditRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: ProductEditRemoteDataManagerOutputProtocol?
    
    var product:Products?
    
    func externalGetProduct(_ url: String) {
        guard let url = URL(string: url) else{return}
        let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard let datos = data else{
                print("No hay datos en la solicitud")
                return
            }
            do{
                let datosDecodificados = try JSONDecoder().decode(Products.self, from:datos)
                self.product = datosDecodificados
                self.remoteRequestHandler?.remoteDataManagerCallBackProduct(with: self.product!)
            }catch{
                print("Ocurrio un error al convertir los datos")
            }
        }
        tarea.resume()
    }
    
    func externalSaveEditProduct(id : Int, title: String, price: Int) {
        guard let objUrl = URL(string: "https://api.escuelajs.co/api/v1/products/\(id)") else{return}
        var peticion = URLRequest(url: objUrl)
        peticion.httpMethod = "PUT"
        peticion.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let datos:[String:Any] = ["title": title,
                                  "price": price]
        
        peticion.httpBody = try? JSONSerialization.data(withJSONObject: datos, options: .fragmentsAllowed)
        
        let tarea = URLSession.shared.dataTask(with: peticion, completionHandler: {
          data, response, error in
            guard let datosR = data, error == nil else{return}
            do{
                guard let _ = try? JSONSerialization.jsonObject(with: datosR, options: .fragmentsAllowed) else{
                    self.remoteRequestHandler?.remoteDataManagerCallBackEditedProduct(edited: false)
                    return
                }
                
                self.remoteRequestHandler?.remoteDataManagerCallBackEditedProduct(edited: true)
        
            }
        })
        tarea.resume()
    }
}
