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
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var collectionTarjet: UICollectionView!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func Pagar(_ sender: UIButton) {
        let alert = UIAlertController(title: "Se pagaran los productos", message: "Esta seguro de comprar", preferredStyle: .alert)
        let aceptar = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.presenter?.getAllShopingCar()
        }
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alert.addAction(cancelar)
        alert.addAction(aceptar)
        present(alert, animated: true)
    }
    
    
    @IBAction func onPressBuy(_ sender: Any) {
        presenter?.showAddCards()
    }
}

extension BuyItemsView: BuyItemsViewProtocol {
    // TODO: implement view output methods
    func sendPrice(price: Int) {
        lblPrice.text = "$" + String(price)
    }
}

extension BuyItemsView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
