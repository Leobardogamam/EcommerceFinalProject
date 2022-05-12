//
//  CreditCard+CoreDataProperties.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/11/22.
//
//

import Foundation
import CoreData
import UIKit


extension CreditCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreditCard> {
        return NSFetchRequest<CreditCard>(entityName: "CreditCard")
    }

    @NSManaged public var cvv: Int64
    @NSManaged public var day: Int64
    @NSManaged public var name: String?
    @NSManaged public var numserie: Int64
    @NSManaged public var year: Int64
    @NSManaged public var idUser: Int64
    @NSManaged public var color: UIColor?
    @NSManaged public var cardType: String?

}

extension CreditCard : Identifiable {

}
