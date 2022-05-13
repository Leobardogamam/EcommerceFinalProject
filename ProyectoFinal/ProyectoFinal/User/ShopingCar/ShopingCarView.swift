//
//  ShopingCarView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
class cartTableViewCell: UITableViewCell{
    
    @IBOutlet weak var imageProduct:UIImageView!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
}


class ShopingCarView: UIViewController, MyViewDelegate {
    // MARK: Properties
    var presenter: ShopingCarPresenterProtocol?
    var price = 0
    var carrito: [Product]?
    var noUser : Int?
    @IBOutlet weak var tableCarProduct: UITableView!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var tabBar: TabBarNavigationButtons!
    @IBOutlet weak var viewCircle: UIView!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        noUser = presenter?.noUser
        presenter?.viewDidLoad()
        tabBar.delegate = self
        viewCircle.layer.cornerRadius = viewCircle.frame.height / 2
       
        tabBar.btnCart.tintColor = .systemPink
        tabBar.btnCart.setImage(UIImage(systemName: "cart.fill"), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
    func didTapButton(number: Int) {
        switch number{
        case 0:
            
            if noUser != 0{
            presenter?.showViewHome()
            }else{
                presenter?.showHomeUserViewWithoutUser(user: noUser!)
            }
        case 1:
            print("Ya estas Aqui")
        case 2:
            if noUser != 0{
              presenter?.showUserAccount()
            }else{
                let alert = UIAlertController(title: "No hay usuario", message: "No cuentas con un usuario, quieres ir al login?", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Si", style: .default) { [self] UIAlertAction in
                    presenter?.deleteCarWithoutUser()
                    self.view.window?.rootViewController?.dismiss(animated: true)
                }
                let cancel = UIAlertAction(title: "Cancelar", style: .cancel)
                

                alert.addAction(action)
                alert.addAction(cancel)
                present(alert, animated: true)
            }
        default:
            print("Error")
        }
    }
    
    
    @IBAction func onPressBuy(_ sender: UIButton) {
        if price == 0{
            let alert = UIAlertController(title: "No se ha ingresado ningun producto", message: "Inserta Productos", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }else{
            presenter?.showBuyItems(precio: price)
        }
    }
}

extension ShopingCarView: ShopingCarViewProtocol {
    
    
    // TODO: implement view output methods
    func
    getDatosDescodificados(product:[Product], precioTotal:Int) {

        carrito = product
        DispatchQueue.main.async {[self] in
            tableCarProduct.reloadData()
            lblTotalPrice.text = "$" + String(precioTotal)
            price = precioTotal
        }
    }
    func resetPrice(price: Int) {
        lblTotalPrice.text = String(price)
        
    }
    
}


extension ShopingCarView: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrito?.count ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartTableCell", for: indexPath) as? cartTableViewCell
        
        cell?.lblProductName.text = carrito?[indexPath.row].title
        cell?.lblProductPrice.text = "$"  + String(carrito?[indexPath.row].price ?? 0)
        cell?.imageProduct.image = UIImage(named: "loading")
        cell?.isUserInteractionEnabled = false
        DispatchQueue.global(qos: .background).async {
            if self.carrito?[indexPath.row].images?.count == 0{
                
            }else{
                let url = URL(string: (self.carrito?[indexPath.row].images?[0])!)
                guard let url = url else{return}
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    guard let data = data else {return}
                    cell?.imageProduct.image = UIImage(data: data)
                }
            }
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            presenter?.eliminate(id: carrito?[indexPath.row].id ?? 0 , price: carrito?[indexPath.row].price ?? 0)
            carrito?.remove(at: indexPath.row)
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
}
