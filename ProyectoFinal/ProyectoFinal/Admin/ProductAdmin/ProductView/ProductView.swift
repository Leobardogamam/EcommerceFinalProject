//
//  ProductView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductView: UIViewController, MyViewDelegateAdmin {

    // MARK: Properties
    var presenter: ProductPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TabBar: TabBarNavigationButtonsAdmin!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var products : [Products]?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.window?.rootViewController?.dismiss(animated: true)
        presenter?.viewDidLoad()
        selectedLabel.layer.cornerRadius = (selectedLabel.frame.size.width) / 2
        selectedLabel.clipsToBounds = true
        TabBar.btnProducts.tintColor = .systemIndigo
        TabBar.btnCategories.tintColor = .black
        TabBar.btnUsers.tintColor = .black
        TabBar.btnProfile.tintColor = .black
        TabBar?.delegate = self
    }
    
    
    
    @IBAction func addPressed(_ sender: Any) {
        presenter?.showAddProductView()
    }
    
    func didTapButton(number: Int) {
        switch number{
            case 0:
               tableView.reloadData()
            case 1:
               presenter?.showCategorieView()
            case 2:
               presenter?.showUserView()
            case 3:
               presenter?.showProfileView()
            default:
                print("Error")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
}

extension ProductView: ProductViewProtocol {
    func loadActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopAndHideActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidesWhenStopped = true
        }
    }
    
    // TODO: implement view output methods
    
    func presenterGetProducts(receivedProducts: [Products]) {
        products = receivedProducts
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ProductView : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductViewCell
        
        cell.productImageView.image = UIImage(named: "No_Image_Available")
        cell.productNameLabel.text = products?[indexPath.row].title ?? ""
     
      
        
        DispatchQueue.global(qos: .default).async { [self] in
       
            if self.products?[indexPath.row].images?.count != 0 {
                let urlImage = URL(string: (products?[indexPath.row].images?[0]) ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930")
                guard let urlImage = urlImage else { return }
                guard let data = try? Data(contentsOf: urlImage) else {return}
                
                DispatchQueue.main.async {
                    cell.productImageView.image = UIImage(data: data)
                    
                }
            }
 
        }
      
        
       
        return cell
    }
   
}

extension ProductView : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

      self.presenter?.showDetailProductView(with: String(self.products![indexPath.row].id!))
    }

    
}

