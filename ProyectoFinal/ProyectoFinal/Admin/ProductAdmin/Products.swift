//
//  Products.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//

import Foundation

struct Products:Codable{
    var id: Int?
    var title: String?
    var price: Int?
    var description: String?
    var category : Categories?
    var images: [String]?
}
