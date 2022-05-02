//
//  HomeViewRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import UIKit

class HomeViewRemoteDataManager:HomeViewRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeViewRemoteDataManagerOutputProtocol?
    var dataCategories = [Categories]()
    
    func callCategoriesData(){
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/categories") else{return}
        let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard let datos = data else{
                print("No hay datos en la solicitud")
                return
            }
            do{
                let datosDecodificados = try JSONDecoder().decode([Categories].self, from:datos)
                self.dataCategories = datosDecodificados
                self.remoteRequestHandler?.getCategoriesData(with: self.dataCategories)
            }catch{
                print("Ocurrio un error al convertir los datos")
            }
        }
        tarea.resume()
    }
    
    
    
}
