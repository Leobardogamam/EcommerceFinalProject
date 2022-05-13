//
//  AddCardsLocalDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

class AddCardsLocalDataManager:AddCardsLocalDataManagerInputProtocol {
    

    var localRequestHandler: AddCardsLocalDataManagerOutputProtocol?
    var userDefault = UserDefaults()
    var cards : [NSManagedObject]?
    
    func localSaveCard(cvv: Int, day: Int, year: Int, idUser: Int, numSerie: String, name: String, color: UIColor, cardType: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
       
       
        let creditCard = CreditCard(context: context)
        creditCard.cvv = Int64(cvv)
        creditCard.day = Int64(day)
        creditCard.year = Int64(year)
        creditCard.idUser = Int64(idUser)
        creditCard.numserie = numSerie
        creditCard.name = name
        creditCard.color = color
        creditCard.cardType = cardType
        
        
        
        do {
          try context.save()
            localRequestHandler?.localDataManagerCallBackCardAdded(added: true)
         } catch {
          print("Error saving")
             localRequestHandler?.localDataManagerCallBackCardAdded(added: false)
        }
        
      
        }
    
    
    func getCards() {
        
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
    }
    
    
        
}
    

    
    

