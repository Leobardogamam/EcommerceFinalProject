//
//  Compras+CoreDataProperties.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 12/05/22.
//
//

import Foundation
import CoreData


extension Compras {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Compras> {
        return NSFetchRequest<Compras>(entityName: "Compras")
    }

    @NSManaged public var idcustomer: Int64
    @NSManaged public var idproduct: Int64

}

extension Compras : Identifiable {

}
