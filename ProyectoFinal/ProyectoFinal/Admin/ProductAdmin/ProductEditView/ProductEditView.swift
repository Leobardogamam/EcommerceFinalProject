//
//  ProductEditView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductEditView: UIViewController {

    // MARK: Properties
    var presenter: ProductEditPresenterProtocol?

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    var product : Products?
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    
        productImageView.layer.borderWidth = 1.0
        productImageView.layer.masksToBounds = false
        productImageView.layer.borderColor = UIColor.white.cgColor
        productImageView.layer.cornerRadius = (productImageView.frame.size.width) / 2
        productImageView.clipsToBounds = true
        presenter?.viewDidLoad()
    }
    

    
    @IBAction func savePressed(_ sender: Any) {
        
        if titleTextField.text!.isEmpty || priceTextField.text!.isEmpty{
            let alert = UIAlertController(title: "Error", message: "Los campos estan vacios", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default)

            alert.addAction(action)
            present(alert, animated: true)
        }
        else{
            presenter?.presenterSaveEditProduct(id: product!.id!, title: titleTextField.text!, price: Int(priceTextField.text!)!)
            
            
                self.presenter?.showProductView()

        }
        
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        self.dismiss(animated: true)
 
    }
    
}

extension ProductEditView: ProductEditViewProtocol {
    // TODO: implement view output methods
    
    func presenterGetProductView(receivedProduct: Products) {
        product = receivedProduct
        
        DispatchQueue.main.async { [self] in
            
            //Imagen
            let urlImage = URL(string: (product?.images![0])!)
            let data = try? Data(contentsOf: urlImage!)
            self.productImageView.image = UIImage(data: data!)
            
            //Name
            self.titleTextField.text = product!.title
            
            //Price
            self.priceTextField.text = "\(String(describing: (product!.price)!))"
        }
    }
}
