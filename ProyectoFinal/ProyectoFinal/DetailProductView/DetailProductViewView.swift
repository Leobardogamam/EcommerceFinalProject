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
    @IBOutlet weak var btnReturnBack: UIButton!
    var presenter: DetailProductViewPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        btnReturnBack.layer.cornerRadius = btnReturnBack.frame.height / 2
    }
    
    @IBAction func onPressReturnBack(_ sender: UIButton) {
        dismiss(animated: true)
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
            let url = URL(string: product.images?[0] ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930")
            let data = try? Data(contentsOf: url!)
            guard let dat = data else{return}
            DispatchQueue.main.async {
                self.imgProduct.image = UIImage(data: dat)
            }
        }
    }
}
