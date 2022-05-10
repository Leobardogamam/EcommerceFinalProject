//
//  UsuarioView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/2/22.
//  
//

import Foundation
import UIKit

class UsuarioView: UIViewController {

    // MARK: Properties
    var presenter: UsuarioPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UsuarioView: UsuarioViewProtocol {
    // TODO: implement view output methods
}
