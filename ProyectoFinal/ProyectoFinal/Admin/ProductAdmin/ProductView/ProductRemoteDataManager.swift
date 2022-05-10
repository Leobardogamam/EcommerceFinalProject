//
//  ProductRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class ProductRemoteDataManager:ProductRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: ProductRemoteDataManagerOutputProtocol?
    
    
    var products:[Products]?
    
    func externalGetProducts() {
        
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/products") else{return}
        let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard let datos = data else{
                print("No hay datos en la solicitud")
                return
            }
            do{
                let datosDecodificados = try JSONDecoder().decode([Products].self, from:datos)
                self.products = datosDecodificados

                self.remoteRequestHandler?.remoteDataManagerCallBackProducts(with: self.products!)
            }catch{
                print("Ocurrio un error al convertir los datos")
            }
        }
        tarea.resume()
    }
}
