//
//  ShopingCarView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class ShopingCarView: UIViewController {

    // MARK: Properties
    var presenter: ShopingCarPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ShopingCarView: ShopingCarViewProtocol {
    // TODO: implement view output methods
}
