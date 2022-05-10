//
//  CategorieRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class CategorieRemoteDataManager:CategorieRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: CategorieRemoteDataManagerOutputProtocol?
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
}
