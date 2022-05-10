//
//  CategorieView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class CategorieView: UIViewController,MyViewDelegateAdmin {

    var presenter: CategoriePresenterProtocol?
    var categories: [Categories]?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TabBar: TabBarNavigationButtonsAdmin!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.window?.rootViewController?.dismiss(animated: true)
        selectedLabel.layer.cornerRadius = (selectedLabel.frame.size.width) / 2
        selectedLabel.clipsToBounds = true
        TabBar.btnProducts.tintColor = .black
        TabBar.btnCategories.tintColor = .systemIndigo
        TabBar.btnUsers.tintColor = .black
        TabBar.btnProfile.tintColor = .black
        TabBar?.delegate = self
        presenter?.viewDidLoad()
    }
    
    
    func didTapButton(number: Int) {
        switch number{
            case 0:
               presenter?.showProductView()
            case 1:
               tableView.reloadData()
            case 2:
               presenter?.showUserView()
            case 3:
               presenter?.showProfileUser()
            default:
                print("Error")
        }
    }
    
    @IBAction func addPressed(_ sender: Any) {
        presenter?.showAddCategorie()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
 
    
}

extension CategorieView: CategorieViewProtocol {
    // TODO: implement view output methods
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
    
    func presenterGetCategoriesView(receivedData: [Categories]) {
        categories = receivedData
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension CategorieView : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategorieViewCell

        cell.categorieImageView.image = UIImage(named: "No_Image_Available")
        cell.categorieNameLabel.text = categories?[indexPath.row].name ?? ""



        DispatchQueue.global(qos: .default).async { [self] in

            if self.categories?[indexPath.row].image != nil {
                let urlImage = URL(string: (categories?[indexPath.row].image) ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930")
                guard let urlImage = urlImage else { return }
                guard let data = try? Data(contentsOf: urlImage) else {return}

                DispatchQueue.main.async {
                    cell.categorieImageView.image = UIImage(data: data)

                }
            }

        }

        
       
        return cell
    }
   
}

extension CategorieView : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showDetailCategorieView(with: String(categories![indexPath.row].id!))
    }
}
