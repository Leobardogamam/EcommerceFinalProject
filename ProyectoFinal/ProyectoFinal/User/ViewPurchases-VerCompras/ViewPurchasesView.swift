//
//  ViewPurchasesView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class ViewPurchasesView: UIViewController {

    // MARK: Properties
    var presenter: ViewPurchasesPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewPurchasesView: ViewPurchasesViewProtocol {
    // TODO: implement view output methods
}


extension ViewPurchasesView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPurchases", for: indexPath) as? TableCellPurchases
        
        return cell ?? UITableViewCell()
    }
    
    
}
