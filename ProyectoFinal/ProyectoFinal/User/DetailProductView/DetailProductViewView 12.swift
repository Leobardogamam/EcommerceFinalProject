//
//  DetailProductViewView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class DetailProductViewView: UIViewController {

    // MARK: Properties
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblNameProduct: UILabel!
    @IBOutlet weak var lblPriceProduct: UILabel!
    @IBOutlet weak var lblDescriptionProduct: UILabel!
    var presenter: DetailProductViewPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailProductViewView: DetailProductViewViewProtocol {
    // TODO: implement view output methods
    func getDataProduct(product: Product) {
        self.lblPriceProduct.text = "$" + String(product.price)
        self.lblDescriptionProduct.text = product.description
        self.lblNameProduct.text = product.title
        self.imgProduct.image = UIImage(named: "loading")
        DispatchQueue.global(qos: .default).async {
            let url = URL(string: product.images[0])
            let data = try? Data(contentsOf: url!)
            guard let dat = data else{return}
            DispatchQueue.main.async {
                self.imgProduct.image = UIImage(data: dat)
            }
        }
    }
}
