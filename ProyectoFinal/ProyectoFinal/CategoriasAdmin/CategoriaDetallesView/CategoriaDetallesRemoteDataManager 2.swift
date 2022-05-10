//
//  CategoriaDetallesRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/4/22.
//  
//

import Foundation

class CategoriaDetallesRemoteDataManager:CategoriaDetallesRemoteDataManagerInputProtocol {
    
    
    var remoteRequestHandler: CategoriaDetallesRemoteDataManagerOutputProtocol?
    var categorie:Categorias?
    
    func externalGetCategories(_ url: String) {
        guard let url = URL(string: url) else{return}
        let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard let datos = data else{
                print("No hay datos en la solicitud")
                return
            }
            do{
                let datosDecodificados = try JSONDecoder().decode(Categorias.self, from:datos)
                self.categorie = datosDecodificados
                self.remoteRequestHandler?.remoteDataManagerCallBackCategorie(with: self.categorie!)
            }catch{
                print("Ocurrio un error al convertir los datos")
            }
        }
        tarea.resume()
    }
    
}
