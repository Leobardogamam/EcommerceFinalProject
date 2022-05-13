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
    @IBOutlet weak var tablePurchases: UITableView!
    var compras = [Product]()
    var hola = Int()
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tablePurchases.delegate = self
        tablePurchases.dataSource = self
    }
}

extension ViewPurchasesView: ViewPurchasesViewProtocol {
    // TODO: implement view output methods
    func returnRemoteData(product:Product) {
        compras.append(product)
        hola += 1
        print(hola)
        DispatchQueue.main.async {
            self.tablePurchases.reloadData()
        }
    }
    
}


extension ViewPurchasesView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return compras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPurchases", for: indexPath) as? TableViewPurchase
        cell?.lblProductName.text = compras[indexPath.row].title
//        cell?.imgProduct
        cell?.imgProduct.image = UIImage(named: "loading")
        DispatchQueue.global(qos: .default).async {
            let url = URL(string: (self.compras[indexPath.row].images?[0])! )
            let data = try? Data(contentsOf: url!)
            guard let data = data else {return}
            DispatchQueue.main.async {
                cell?.imgProduct.image = UIImage(data: data)
            }
        }
        return cell ?? UITableViewCell()
    }
    
    
}
