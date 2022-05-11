//
//  MyCardsLocalDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

class MyCardsLocalDataManager:MyCardsLocalDataManagerInputProtocol {
   
    var localRequestHandler: MyCardsLocalDataManagerOutputProtocol?
    var userDefault = UserDefaults()
    var cards : [NSManagedObject]?
    
    func localGetCards() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductoCustomer")
        request.predicate = NSPredicate(format: "idUser = %@", "\(userDefault.integer(forKey: "IdUsuario"))")
        request.returnsObjectsAsFaults = false
        do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject]{
                    self.cards?.append(data)
                    
                  }
            localRequestHandler?.localDataManagerCallBackCards(cards: cards!)

        } catch {

                print("Failed")
        }
    }
    
    
}


