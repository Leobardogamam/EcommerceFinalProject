//
//  DetailProductViewView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class DetailProductViewView: UIViewController,  DetailProductViewViewProtocol {
    
   
    
    
    // TODO: implement view output methods
    

    // MARK: Properties
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblNameProduct: UILabel!
    @IBOutlet weak var lblPriceProduct: UILabel!
    @IBOutlet weak var lblDescriptionProduct: UILabel!
    @IBOutlet weak var btnReturnBack: UIButton!
    var presenter: DetailProductViewPresenterProtocol?
    var idProduct:Int?
    var userDefault = UserDefaults()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        btnReturnBack.layer.cornerRadius = btnReturnBack.frame.height / 2
    }

    @IBAction func onPressReturnBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    

    @IBAction func onPressAddCar(_ sender: UIButton) {
        alert(title: "Se agrego al carrito", message: "El producto se agrego al carrito")
        if let savedPerson = userDefault.object(forKey: "UserLogged") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Users.self, from: savedPerson) {
                presenter?.saveDataInCoreData(idCustomer: loadedPerson.id, idProduct: idProduct ?? 0)
                print("user dafault = ", "\(loadedPerson.id)")
            }
        }
    }
        
    
    func alert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { alert in
            self.dismiss(animated: true)
        }
        alert.addAction(action)
        self.present(alert,animated:true)
    }
        
        
    func getDataProduct(product: Product) {
            idProduct = product.id
            self.lblPriceProduct.text = "$" + String(product.price)
            self.lblDescriptionProduct.text = product.description
            self.lblNameProduct.text = product.title
            self.imgProduct.image = UIImage(named: "loading")
            DispatchQueue.global(qos: .default).async {
                let url = URL(string: product.images?[0] ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930")
                guard let url = url else {
                    return
                }
                let data = try? Data(contentsOf: url)
                guard let dat = data else{return}
                DispatchQueue.main.async {
                    self.imgProduct.image = UIImage(data: dat)
                }
            }
    }
    
}



