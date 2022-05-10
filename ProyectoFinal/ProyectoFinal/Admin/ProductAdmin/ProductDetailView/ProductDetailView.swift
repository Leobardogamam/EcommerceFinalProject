//
//  ProductDetailView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductDetailView: UIViewController {

    // MARK: Properties
    var presenter: ProductDetailPresenterProtocol?
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var categoryProductLabel: UILabel!
    @IBOutlet weak var priceProductLabel: UILabel!
    @IBOutlet weak var descriptionProductLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var product: Products?
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.borderWidth = 1.0
        backButton.layer.masksToBounds = false
        backButton.layer.borderColor = UIColor.white.cgColor
        backButton.layer.cornerRadius = (backButton.frame.size.width) / 2
        backButton.clipsToBounds = true
        presenter?.viewDidLoad()
        
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        let alert = UIAlertController(title: "Eliminar", message: "¿Estas seguro que deseas eliminar este producto?", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Si", style: .default) { UIAlertAction in
            
            self.presenter?.deleteProduct(with: self.product!.id!)

            self.presenter?.showProductView()
            
            
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel)
        

        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true)
        
    }
    
    
    @IBAction func editPressed(_ sender: Any) {
        
      self.presenter?.showEditProductView(with: String(self.product!.id!))
     
          
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension ProductDetailView: ProductDetailViewProtocol {
    // TODO: implement view output methods
    
    func presenterGetProductView(receivedProduct: Products) {
      
        product = receivedProduct
        
        
        DispatchQueue.main.async { [self] in
            productImageView.image = UIImage(named: "No_Image_Available")
            nameProductLabel.text = product!.title
            categoryProductLabel.text = product!.category!.name
            priceProductLabel.text = "$\(product!.price!)"
            descriptionProductLabel.text = product!.description
        }
        
           if product?.images?.count != 0 {
               let urlImage = URL(string: (product?.images?[0]) ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930")
                guard let urlImage = urlImage else { return }
                guard let data = try? Data(contentsOf: urlImage) else {return}
                
                DispatchQueue.main.async {
                    self.productImageView.image = UIImage(data: data)
                   
                }
        
        }
    }
}
