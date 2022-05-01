//
//  AddCardsView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class AddCardsView: UIViewController {

    // MARK: Properties
    var presenter: AddCardsPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AddCardsView: AddCardsViewProtocol {
    // TODO: implement view output methods
}
