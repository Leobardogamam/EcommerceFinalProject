//
//  ProductoDetallesView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/3/22.
//  
//

import Foundation
import UIKit

class ProductoDetallesView: UIViewController {

    // MARK: Properties
    var presenter: ProductoDetallesPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProductoDetallesView: ProductoDetallesViewProtocol {
    // TODO: implement view output methods
}
