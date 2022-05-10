//
//  UserAccountView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class UserAccountView: UIViewController {

    // MARK: Properties
    var presenter: UserAccountPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UserAccountView: UserAccountViewProtocol {
    // TODO: implement view output methods
}
