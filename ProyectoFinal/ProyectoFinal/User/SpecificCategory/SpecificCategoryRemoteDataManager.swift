//
//  SpecificCategoryRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 01/05/22.
//  
//

import Foundation

class SpecificCategoryRemoteDataManager:SpecificCategoryRemoteDataManagerInputProtocol {
    var remoteRequestHandler: SpecificCategoryRemoteDataManagerOutputProtocol?
    var category = [Product]()
    
    func getCategory(id: Int) {
        let sumId = id
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/categories/\(sumId)/products") else{return}
        let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard let datos = data else{
                print("No hay datos en la solicitud")
                return
            }
            do{
                let datosDecodificados = try JSONDecoder().decode([Product].self, from:datos)
                self.category = datosDecodificados
                self.remoteRequestHandler?.showDataProducts(with: self.category)
            }catch{
                print("Ocurrio un error al convertir los datos")
            }
        }
        tarea.resume()
    }
    
    
    
}
