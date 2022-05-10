//
//  Users.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//

import Foundation
struct Token: Codable{
    let access_token:String
}

struct Users: Codable{
    
    let id : Int
    let email : String
    let password : String
    let name : String
    let role : String
    let avatar : String
}
