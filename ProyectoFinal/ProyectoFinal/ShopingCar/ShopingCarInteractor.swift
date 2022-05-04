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
    
    
    func eliminate(id: Int, price:Int) {
        localDatamanager?.getIdDeleteProduct(id: id, price: price)
    }
    
    func changePrice(price: Int) {
        let precio = precio.integer(forKey: "Precio") - price
        self.precio.set(precio, forKey: "Precio")
        presenter?.resetPrice(price: self.precio.integer(forKey: "Precio"))
        
    }
    
   
    

}

extension ShopingCarInteractor: ShopingCarRemoteDataManagerOutputProtocol {
    func returnDatosApi(product: Product) {
        var isUsable = false
        if products.count == 0{
            products.append(product)
            precio.set(product.price, forKey: "Precio")
            print(precio.set(product.price, forKey: "Precio"))
        }else{
            for idProduct in 0...products.count-1{
                if product.id == products[idProduct].id{
                    isUsable = true
                }
            }
            if isUsable{
            }else{
                products.append(product)
                let valorUserDefault = precio.integer(forKey: "Precio")
                print("El valor de userDafult es: ", valorUserDefault)
                var valorTotal = product.price
                valorTotal = valorTotal + valorUserDefault
                precio.set(valorTotal, forKey: "Precio")
                print(precio.integer(forKey: "Precio"))
            }
        }
        
        presenter?.getApiDescodificados(product: products, precioTotal: precio.integer(forKey: "Precio") )
    }
    
}



