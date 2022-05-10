//
//  ViewProfileView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class ViewProfileView: UIViewController {

    // MARK: Properties
    var presenter: ViewProfilePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewProfileView: ViewProfileViewProtocol {
    // TODO: implement view output methods
}
