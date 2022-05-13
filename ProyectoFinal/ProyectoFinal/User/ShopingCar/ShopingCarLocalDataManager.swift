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
    
    
    var localRequestHandler: ShopingCarLocalDataManagerOutputProtocol?
    var arrayIdProduct:[Int]?
    var userDefault = UserDefaults()
    
    func getAllCarCoredataSave() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductoCustomer")
//        MARK: HOLA
        
        if let savedPerson = userDefault.object(forKey: "UserLogged") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Users.self, from: savedPerson) {
                do {
                    request.predicate = NSPredicate(format: "idcustomer = %@", "\(loadedPerson.id)")
                } catch  {
                
                }
            }
        }
        request.returnsObjectsAsFaults = false
        do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject]
        {
                print(data)
                    self.arrayIdProduct?.append(data.value(forKey: "idproduct")! as! Int)
                localRequestHandler?.getIdProducts(id: data.value(forKey: "idproduct")! as! Int)
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
            print(result)
                for data in result as! [NSManagedObject]
                        
        {
                self.arrayIdProduct?.append(data.value(forKey: "idproduct")! as! Int)
                    print(data)
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
            localRequestHandler?.changePrice(price: price)
        }
        catch {
            // Handle Error
        }
    }
    
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



