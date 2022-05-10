//
//  MyCardsView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class MyCardsView: UIViewController {

    // MARK: Properties
    var presenter: MyCardsPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onPressGoToAddCard(_ sender: UIButton) {
        presenter?.showAddCards()
    }
    
}

extension MyCardsView: MyCardsViewProtocol {
    // TODO: implement view output methods
}
