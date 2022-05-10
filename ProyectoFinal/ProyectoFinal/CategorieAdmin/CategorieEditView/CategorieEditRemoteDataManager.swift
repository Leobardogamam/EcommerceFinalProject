//
//  CategorieEditRemoteDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class CategorieEditRemoteDataManager:CategorieEditRemoteDataManagerInputProtocol {
   

    var remoteRequestHandler: CategorieEditRemoteDataManagerOutputProtocol?
    
    var categorie:Categories?
    
    func externalGetCategorie(_ url: String) {
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
    
    func externalSaveEditCategorie(id: Int, name: String) {
        guard let objUrl = URL(string: "https://api.escuelajs.co/api/v1/categories/\(id)") else{return}
        var peticion = URLRequest(url: objUrl)
        peticion.httpMethod = "PUT"
        peticion.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let datos:[String:Any] = ["name": name]
        
        peticion.httpBody = try? JSONSerialization.data(withJSONObject: datos, options: .fragmentsAllowed)
        
        let tarea = URLSession.shared.dataTask(with: peticion, completionHandler: {
          data, response, error in
            guard let datosR = data, error == nil else{return}
            do{
                guard let _ = try? JSONSerialization.jsonObject(with: datosR, options: .fragmentsAllowed) else{
                    self.remoteRequestHandler?.remoteDataManagerCallBackEditedCategorie(with: false)
                    return
                }
                self.remoteRequestHandler?.remoteDataManagerCallBackEditedCategorie(with: true)
                
            }
        })
        tarea.resume()
    }
    
}
