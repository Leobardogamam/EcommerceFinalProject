//
//  ViewPurchasesLocalDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import UIKit
import CoreData

class ViewPurchasesLocalDataManager:ViewPurchasesLocalDataManagerInputProtocol {
    var compras:[Compras]?
    var localRequestHandler: ViewPurchasesLocalDataManagerOutputProtocol?
    var userDefault = UserDefaults()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func getPurchases() {
        let request = Compras.fetchRequest() as NSFetchRequest<Compras>
//        let encoder = JSONEncoder()
        if let savedPerson = userDefault.object(forKey: "UserLogged") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Users.self, from: savedPerson) {
                let pred = NSPredicate(format: "idcustomer = %@", "\(loadedPerson.id)")
                request.predicate = pred
                do {
                    self.compras = try context.fetch(request)
                    localRequestHandler?.returnData(compra: compras!)
                } catch  {
                    
                }
//                self.compras = try
            }
        }
        
        
    }
    
    
    
}
