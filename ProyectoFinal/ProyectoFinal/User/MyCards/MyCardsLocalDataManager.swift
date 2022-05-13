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
        
        
        let request = CreditCard.fetchRequest() as NSFetchRequest<CreditCard>
        if let savedPerson = userDefault.object(forKey: "UserLogged") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Users.self, from: savedPerson) {
                let pred =  NSPredicate(format: "idUser = %@", "\(loadedPerson.id)")
                request.predicate = pred
            }
        }
        
       
        do {
            self.cards = try context.fetch(request)
            
            localRequestHandler?.localDataManagerCallBackCards(cards: cards!)
        } catch  {
            
        }
        
        
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CreditCard")
//        request.predicate = NSPredicate(format: "idUser = %@", "\(userDefault.integer(forKey: "IdUsuario"))")
//        request.returnsObjectsAsFaults = false
//        do {
//                let result = try context.fetch(request)
//                for data in result as! [NSManagedObject]{
//                    self.cards?.append(data)
//                    print(data)
//                  }
//
//            if ((cards?.isEmpty) != false){
//                localRequestHandler?.localDataManagerCallBackCards(cards: cards!)
//            }
//
//        } catch {
//
//                print("Failed")
//        }
    }
    
    
}


