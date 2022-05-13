//
//  HomeViewView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
// Clase Collection View 
class CollectionHomeView: UICollectionViewCell{
    @IBOutlet weak var imgCollectionView: UIImageView!
    @IBOutlet weak var lblNombreProductoCollectionView: UILabel!
    @IBOutlet weak var viewCategory: UIView!
}

class HomeViewView: UIViewController , MyViewDelegate, passTableToHome{
    // MARK: Properties
    //var tabBar = TabBarNavigationButtons()
    var presenter: HomeViewPresenterProtocol?
    var dataCategoriesCollectionView = [Categories]()
    var dataCategoriesTableView = [Categories]()
    var isCategorySelected = false
    var noUser : Int?
    
    @IBOutlet weak var collectionHomeView: UICollectionView!
    @IBOutlet weak var TabBar: TabBarNavigationButtons!
    @IBOutlet weak var viewCircle: UIView!
    @IBOutlet weak var tableHomeView: UITableView!
    

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        noUser = presenter?.noUser
        TabBar.btnCart.backgroundColor = .clear
        TabBar.btnUserAccount.backgroundColor = .clear
        TabBar.btnHome.tintColor = .systemPink
        TabBar.btnHome.setImage(UIImage(systemName: "house.fill"), for: .normal)
        TabBar.delegate = self
        viewCircle.layer.cornerRadius = viewCircle.frame.height / 2
    }
    
//    MARK: NAVEGACION ENTRE PANTALLAS
    func didTapButton(number:Int) {
        switch number{
        case 0:
           print("Ya estas aqui")
        case 1:
            
            if noUser != 0{
                presenter?.showShopingCart()
            }else{
                presenter?.showShopingCart(noUser: noUser!)
            }

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
    
    func pasarProducto(product: Product) {
        presenter?.showDetailProductView(product: product)
    }
    
    
    
}

extension HomeViewView: HomeViewViewProtocol {
    func pushData(with data: [Categories]) {
        self.dataCategoriesCollectionView = data
        self.dataCategoriesTableView = data
        DispatchQueue.main.async {
            self.collectionHomeView.reloadData()
            self.tableHomeView.reloadData()
        }
    }
    
}
//MARK: COLLECTION VIEW

extension HomeViewView: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataCategoriesCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollectionView", for: indexPath) as? CollectionHomeView
        cell?.imgCollectionView.image = UIImage(named: "loading")
        DispatchQueue.global(qos: .default).async {
            let url = URL(string: (self.dataCategoriesCollectionView[indexPath.row].image!) )
            let data = try? Data(contentsOf: url!)
            guard let data = data else {return}
            DispatchQueue.main.async {
                cell?.imgCollectionView.image = UIImage(data: data)
            }
        }
        cell?.lblNombreProductoCollectionView.text = self.dataCategoriesCollectionView[indexPath.row].name
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if self.dataCategoriesCollectionView[indexPath.row].name == self.dataCategoriesTableView[0].name && isCategorySelected == true{
            self.dataCategoriesTableView = self.dataCategoriesCollectionView
            isCategorySelected = false
        }else{
            self.dataCategoriesTableView = [self.dataCategoriesCollectionView[indexPath.row]]
            isCategorySelected = true
        }
        DispatchQueue.main.async {
            self.tableHomeView.reloadData()
        }
        
    }
}

//MARK: TABLE VIEW
extension HomeViewView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataCategoriesTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTableHomeView", for: indexPath) as? HomeTableViewCell
//        cell?.delegate = self
        cell?.id = self.dataCategoriesTableView[indexPath.row].id!
        cell?.lblNombreCategory.text = self.dataCategoriesTableView[indexPath.row].name
        cell?.presenter = presenter
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showSpecifcCategory(id: self.dataCategoriesTableView[indexPath.row].id!, name: self.dataCategoriesTableView[indexPath.row].name!)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
