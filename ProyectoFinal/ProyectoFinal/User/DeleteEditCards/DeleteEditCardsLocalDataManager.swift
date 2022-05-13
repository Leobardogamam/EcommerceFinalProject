//
//  DeleteEditCardsLocalDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import CoreData
import UIKit

class DeleteEditCardsLocalDataManager:DeleteEditCardsLocalDataManagerInputProtocol {
    
    
    var localRequestHandler: DeleteEditCardsLocalDataManagerOutputProtocol?
    var card : [NSManagedObject]?

    
    func localGetCard(numSerie : String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let request = CreditCard.fetchRequest() as NSFetchRequest<CreditCard>
        
        let pred =  NSPredicate(format: "numserie = %@", numSerie)
        request.predicate = pred
        do {
            self.card = try context.fetch(request)
            localRequestHandler?.localDataManagerCallBackCards(card: card!)
            
        } catch  {
            
        }
        
        
    }
    
    func localDeleteCard(numSerie: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let request = CreditCard.fetchRequest() as NSFetchRequest<CreditCard>
        
        let pred =  NSPredicate(format: "numserie = %@", "\(numSerie)")
        request.predicate = pred
        do {
            self.card = try context.fetch(request)
            context.delete(card![0])
            try context.save()

            
        } catch  {
           
        }
    }
    
    
    
    
}
