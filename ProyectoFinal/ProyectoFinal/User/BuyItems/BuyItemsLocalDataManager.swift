//
//  BuyItemsLocalDataManager.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//
import Foundation
import UIKit
import CoreData

class BuyItemsLocalDataManager:BuyItemsLocalDataManagerInputProtocol {
   
    
    var LocalRequestHandler: BuyItemsLocalDataDataManagerOutputProtocol?
    let userDefault = UserDefaults()
    var compras:[NSManagedObject]?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getAllShopingCar() {
        
        if let savedPerson = userDefault.object(forKey: "UserLogged") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Users.self, from: savedPerson) {
                do {
                    let request = ProductoCustomer.fetchRequest() as NSFetchRequest<ProductoCustomer>
                    let pred = NSPredicate(format: "idcustomer == %@", "\(loadedPerson.id)")
                    request.predicate = pred
                    self.compras = try context.fetch(request)
                    print(compras!)
                    saveAllBuyItems(compras: compras!)
                    eliminate(data: compras!)
                } catch  {
                    
                }
            }
            
        }
    }
    
    func saveAllBuyItems(compras: [NSManagedObject]) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Compras", in: context)
        
        for compra in compras {
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            newUser.setValue(compra.value(forKey:"idcustomer"), forKey: "idcustomer")
            newUser.setValue(compra.value(forKey:"idproduct"), forKey: "idproduct")
            do {
              try context.save()
             } catch {
              print("Error saving")
            }
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Compras")
//        request.predicate = NSPredicate(format: "age = %@", "21")
        request.returnsObjectsAsFaults = false
        do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject]{
                    print(data)
                }
        } catch {
                   print("Failed")
        }
    }
    func eliminate(data: [NSManagedObject]) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        for dato in data {
            context.delete(dato)
            do {
            try context.save()
//            print("Valor borrado con exito")
            }
            catch {
                // Handle Error
            }
        }
        
    }
}

extension BuyItemsLocalDataManager: BuyItemsLocalDataDataManagerOutputProtocol{
    
}
