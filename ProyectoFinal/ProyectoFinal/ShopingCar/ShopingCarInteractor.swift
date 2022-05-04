//
//  ShopingCarInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import CoreData

class ShopingCarInteractor: ShopingCarInteractorInputProtocol, ShopingCarLocalDataManagerOutputProtocol {
    
   
    
    // MARK: Properties
    weak var presenter: ShopingCarInteractorOutputProtocol?
    var localDatamanager: ShopingCarLocalDataManagerInputProtocol?
    var remoteDatamanager: ShopingCarRemoteDataManagerInputProtocol?
    var localRequestHandler: ShopingCarLocalDataManagerOutputProtocol?
    var idProducts = [Int]()
    var products = [Product]()
    var precio = UserDefaults()
    
    func getAllCarCoredataSave() {
        localDatamanager?.getAllCarCoredataSave()
    }
    
    func getIdProducts(id: Int) {
        if idProducts.contains(id){
            
        }else{
            idProducts.append(id)
        }
        remoteDatamanager?.getProductsApi(ids: idProducts)
    }
    
    
    

}

extension ShopingCarInteractor: ShopingCarRemoteDataManagerOutputProtocol {
    func returnDatosApi(product: Product) {
        var isUsable = false
        if products.count == 0{
            products.append(product)
        }else{
            for idProduct in 0...products.count-1{
                if product.id == products[idProduct].id{
                    isUsable = true
                }
            }
            if isUsable{
            }else{
                products.append(product)
                let valor = precio.integer(forKey: "Precio") + product.price
                precio.set(valor, forKey: "Precio")
            }
        }
        
        presenter?.getApiDescodificados(product: products, precioTotal: precio.integer(forKey: "Precio") )
    }
    
}



