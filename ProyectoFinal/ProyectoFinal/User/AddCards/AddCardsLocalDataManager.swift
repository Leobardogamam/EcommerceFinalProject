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
        
}
    

    
    

