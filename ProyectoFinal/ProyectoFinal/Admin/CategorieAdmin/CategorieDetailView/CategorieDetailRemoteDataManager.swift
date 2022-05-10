//
//  CategorieDetailRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class CategorieDetailRemoteDataManager:CategorieDetailRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: CategorieDetailRemoteDataManagerOutputProtocol?
    
    var categorie:Categories?
    
    func externalGetCategories(_ url: String) {
        guard let url = URL(string: url) else{return}
        let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard let datos = data else{
                print("No hay datos en la solicitud")
                return
            }
            do{
                let datosDecodificados = try JSONDecoder().decode(Categories.self, from:datos)
                self.categorie = datosDecodificados
                self.remoteRequestHandler?.remoteDataManagerCallBackCategorie(with: self.categorie!)
            }catch{
                print("Ocurrio un error al convertir los datos")
            }
        }
        tarea.resume()
    }

    
}
