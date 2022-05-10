//
//  BuyItemsView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class BuyItemsView: UIViewController {

    // MARK: Properties
    var presenter: BuyItemsPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onPressBuy(_ sender: Any) {
        presenter?.showAddCards()
    }
    
}

extension BuyItemsView: BuyItemsViewProtocol {
    // TODO: implement view output methods
}
