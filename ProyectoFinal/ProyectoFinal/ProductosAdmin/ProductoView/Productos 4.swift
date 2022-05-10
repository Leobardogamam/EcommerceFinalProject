//
//  Productos.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/2/22.
//

import Foundation

struct Productos:Codable{
    var id: Int
    var title: String
    var price: Int
    var description: String
    var images: [String]
}
