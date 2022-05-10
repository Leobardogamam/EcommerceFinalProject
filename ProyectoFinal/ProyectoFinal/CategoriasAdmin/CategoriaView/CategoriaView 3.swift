//
//  CategoriaView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/2/22.
//  
//

import Foundation
import UIKit

class CategoriaView: UIViewController {

    // MARK: Properties
    var presenter: CategoriaPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CategoriaView: CategoriaViewProtocol {
    // TODO: implement view output methods
}
