//
//  ViewPurchasesInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class ViewPurchasesInteractor: ViewPurchasesInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: ViewPurchasesInteractorOutputProtocol?
    var localDatamanager: ViewPurchasesLocalDataManagerInputProtocol?
    var remoteDatamanager: ViewPurchasesRemoteDataManagerInputProtocol?
    
    
    func getPurchases() {
        localDatamanager?.getPurchases()
    }
    

}

extension ViewPurchasesInteractor: ViewPurchasesRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func returnRemoteData(products: Product) {
        presenter?.returnRemoteData(product: products)
    }
    
}

extension ViewPurchasesInteractor: ViewPurchasesLocalDataManagerOutputProtocol{
    func returnData(compra:[Compras]){
        var array = [Int]()
        for compras in compra {
            array.append(compras.value(forKey: "idproduct") as! Int)
        }
        remoteDatamanager?.getProducts(arrayNumbers: array)
    }
    
    
    
    
}
