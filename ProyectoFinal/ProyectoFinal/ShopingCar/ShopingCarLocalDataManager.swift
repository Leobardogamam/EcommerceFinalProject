//
//  ShopingCarLocalDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import UIKit
import CoreData

class ShopingCarLocalDataManager:ShopingCarLocalDataManagerInputProtocol {
    var interactor: ShopingCarLocalDataManagerOutputProtocol?
    var arrayIdProduct:[Int]?
    
    func getAllCarCoredataSave() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductoCustomer")
                //request.predicate = NSPredicate(format: "age = %@", "21")
        request.returnsObjectsAsFaults = false
        do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject]
        {
                self.arrayIdProduct?.append(data.value(forKey: "idproduct")! as! Int)
                interactor?.getIdProducts(id: data.value(forKey: "idproduct")! as! Int)
        }

        } catch {

                print("Failed")
        }
        
        
    }
    
    
    
}



