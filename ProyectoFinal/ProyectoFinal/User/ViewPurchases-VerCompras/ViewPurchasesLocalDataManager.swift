//
//  ViewPurchasesLocalDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import CoreData

class ViewPurchasesLocalDataManager:ViewPurchasesLocalDataManagerInputProtocol {
    var compras:[CreditCard]?
    var localRequestHandler: ViewPurchasesLocalDataManagerOutputProtocol?
    var userDefaults = UserDefaults()
    func getPurchases() {
        let request = Compras.fetchRequest() as NSFetchRequest<Compras>
        let pred = NSPredicate(format: "idcustomer CONTAINS %@", "\(userDefaults.integer(forKey: "IdUsuario"))")
        request.predicate = pred
        
        
    }
    
    
    
}
