//
//  ViewPurchasesRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class ViewPurchasesRemoteDataManager:ViewPurchasesRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: ViewPurchasesRemoteDataManagerOutputProtocol?
    var datos:[Product]?
    var dato:Product?
    func getProducts(arrayNumbers: [Int]) {
        for arrayNumber in arrayNumbers {
            guard let url = URL(string: "https://api.escuelajs.co/api/v1/products/\(arrayNumber)") else{return}
            let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
                guard let datos = data else{
                    print("No hay datos en la solicitud")
                    return
                }
                do{
                    let datosDecodificados = try JSONDecoder().decode(Product.self, from:datos)
                    self.remoteRequestHandler?.returnRemoteData(products: datosDecodificados)
                }catch{
                    print("Ocurrio un error al convertir los datos")
                }
            }
            tarea.resume()
        }
    }
    
}
