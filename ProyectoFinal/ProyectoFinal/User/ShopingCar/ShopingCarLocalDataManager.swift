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
    var userDefault = UserDefaults()
    
    func getAllCarCoredataSave() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductoCustomer")
        request.predicate = NSPredicate(format: "idcustomer = %@", "\(userDefault.integer(forKey: "IdUsuario"))")
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
    
    
    func getIdDeleteProduct(id: Int, price:Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductoCustomer")
            request.predicate = NSPredicate(format: "idproduct = %@", "\(id)")
        request.returnsObjectsAsFaults = false
        do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject]
        {
                self.arrayIdProduct?.append(data.value(forKey: "idproduct")! as! Int)
//                interactor?.getIdProducts(id: data.value(forKey: "idproduct")! as! Int)
                eliminate(data: data, price: price)
        }

        } catch {

                print("Failed")
        }
    }
    
    
    func eliminate(data: NSManagedObject, price:Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        context.delete(data)
        do {
        try context.save()
//            print("Valor borrado con exito")
            interactor?.changePrice(price: price)
        }
        catch {
            // Handle Error
        }
        
        
    }
    
    
    
}



