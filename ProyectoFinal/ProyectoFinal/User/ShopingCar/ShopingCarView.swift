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
    var price = Int()
    var carrito: [Product]?
    @IBOutlet weak var tableCarProduct: UITableView!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var tabBar: TabBarNavigationButtons!
    @IBOutlet weak var viewCircle: UIView!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tabBar.delegate = self
        viewCircle.layer.cornerRadius = viewCircle.frame.height /
        2
        tabBar.btnCart.layer.cornerRadius = tabBar.btnCart.frame.height / 2
        tabBar.btnCart.tintColor = .blue
        tabBar.btnCart.backgroundColor = .systemGray3
    }
    
    func didTapButton(number: Int) {
        switch number{
        case 0:
            presenter?.showViewHome()
        case 1:
            print("Ya estas Aqui")
        case 2:
            presenter?.showUserAccount()
        default:
            print("Error")
        }
    }
    
    
    @IBAction func onPressBuy(_ sender: UIButton) {
        presenter?.showBuyItems()
    }
}

extension ShopingCarView: ShopingCarViewProtocol {
    
    
    // TODO: implement view output methods
    func getDatosDescodificados(product:[Product], precioTotal:Int) {
        carrito = product
        DispatchQueue.main.async {[self] in
            tableCarProduct.reloadData()
            lblTotalPrice.text = "$" + String(precioTotal)
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