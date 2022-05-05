//
//  DetailProductViewLocalDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import UIKit
import CoreData

class DetailProductViewLocalDataManager:DetailProductViewLocalDataManagerInputProtocol {
    func saveDataInCoreData(idCustomer: Int, idProduct: Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ProductoCustomer", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(idCustomer, forKey: "idcustomer")
        newUser.setValue(idProduct, forKey: "idproduct")
        
        do {
          try context.save()
         } catch {
          print("Error saving")
        }
        
        
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductoCustomer")
//                //request.predicate = NSPredicate(format: "age = %@", "21")
//        request.returnsObjectsAsFaults = false
//        do {
//                    let result = try context.fetch(request)
//                    for data in result as! [NSManagedObject]
//        {
//            print(data)
//          }
//
//               } catch {
//
//                   print("Failed")
//        }
    }
    
    
    
}
