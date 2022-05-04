//
//  ShopingCarRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import CoreData

class ShopingCarRemoteDataManager:ShopingCarRemoteDataManagerInputProtocol {
    var localRequestHandler: ShopingCarLocalDataManagerOutputProtocol?
    
   
    var remoteRequestHandler: ShopingCarRemoteDataManagerOutputProtocol?
    var product:[Product]?
 
    
    func getProductsApi(ids: [Int]) {
        for id in ids{
            guard let url = URL(string: "https://api.escuelajs.co/api/v1/products/\(id)") else{return}
            print(url)
            let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
                guard let datos = data else{
                    print("No hay datos en la solicitud")
                    return
                }
                do{
                    let datosDecodificados = try JSONDecoder().decode(Product.self, from:datos)
                    print(datosDecodificados)
                    self.remoteRequestHandler?.returnDatosApi(product: datosDecodificados)
                    
                }catch{
                    print("Ocurrio un error al convertir los datos")
                }
            }
            tarea.resume()
        }
    }
    
}
