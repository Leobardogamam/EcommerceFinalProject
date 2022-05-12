//
//  EditCardViewLocalDataManager.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/12/22.
//  
//

import Foundation
import CoreData
import UIKit

class EditCardViewLocalDataManager:EditCardViewLocalDataManagerInputProtocol {
    
    
    var localRequestHandler: EditCardViewLocalDataManagerOutputProtocol?
    var card : [NSManagedObject]?
    
    func localGetCard(numSerie: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let request = CreditCard.fetchRequest() as NSFetchRequest<CreditCard>
        
        let pred =  NSPredicate(format: "numserie = %@", "\(numSerie)")
        request.predicate = pred
        do {
            self.card = try context.fetch(request)
            localRequestHandler?.localDataManagerCallBackCards(card: card!)
            
        } catch  {
            
        }
    }
    
    func localSaveCard(cvv: Int, day: Int, year: Int, idUser: Int, numSerie: String, name: String, color: UIColor, cardType: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
       
        
        let request = CreditCard.fetchRequest() as NSFetchRequest<CreditCard>
        
        let pred =  NSPredicate(format: "numserie = %@", "\(numSerie)")
        request.predicate = pred
        do {
            self.card = try context.fetch(request)
            
            if self.card?.count != 0{
                var creditCard = card![0]
                
                creditCard.setValue(Int64(day), forKey: "day")
                creditCard.setValue(Int64(year), forKey: "year")
                creditCard.setValue(Int64(idUser), forKey: "idUser")
                creditCard.setValue(numSerie, forKey: "numserie")
                creditCard.setValue(name, forKey: "name")
                creditCard.setValue(color, forKey: "color")
                creditCard.setValue(cardType, forKey: "cardType")
                
                do {
                  try context.save()
                    localRequestHandler?.localDataManagerCallBackCardEdited(edited: true)
                 } catch {
                  print("Error saving")
                     localRequestHandler?.localDataManagerCallBackCardEdited(edited: false)
                }
            }
            
            
        } catch  {
            
        }
       
        

       
        
        
        
      
        }
        
    }
    
    
    

