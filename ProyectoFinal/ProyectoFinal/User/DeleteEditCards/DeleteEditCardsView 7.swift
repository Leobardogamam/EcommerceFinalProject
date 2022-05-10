//
//  DeleteEditCardsView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class DeleteEditCardsView: UIViewController {

    // MARK: Properties
    var presenter: DeleteEditCardsPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DeleteEditCardsView: DeleteEditCardsViewProtocol {
    // TODO: implement view output methods
}
