//
//  HomeViewLocalDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

class HomeViewLocalDataManager:HomeViewLocalDataManagerInputProtocol {
    
    var localRequestHandler: HomeViewLocalDataManagerOutputProtocol?
    
    
    func localDeleteCartWithoutUser() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductoCustomer")
            request.predicate = NSPredicate(format: "idcustomer = %@", "0")
        request.returnsObjectsAsFaults = false
        do {
                let result = try context.fetch(request)
            print(result)
                for data in result as! [NSManagedObject]
                        
        {
            context.delete(data)
                    
            do {
                try context.save()
                }
                catch {
                }
        }

        } catch {

                print("Failed")
        }
    }
    

    
}
