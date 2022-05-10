//
//  ProductoCustomer+CoreDataProperties.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 03/05/22.
//
//

import Foundation
import CoreData


extension ProductoCustomer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductoCustomer> {
        return NSFetchRequest<ProductoCustomer>(entityName: "ProductoCustomer")
    }

    @NSManaged public var idproduct: Int32
    @NSManaged public var idcustomer: Int32

}

extension ProductoCustomer : Identifiable {

}
