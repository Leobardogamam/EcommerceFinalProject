//
//  ProductsStruct.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 01/05/22.
//

import UIKit

struct Product:Codable{
    let id : Int
    let title:String
    let price: Int
    let description: String
    let images:[String]?
}
