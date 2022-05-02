//
//  HomeViewView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
class CollectionHomeView: UICollectionViewCell{
    @IBOutlet weak var imgCollectionView: UIImageView!
    @IBOutlet weak var lblNombreProductoCollectionView: UILabel!
    @IBOutlet weak var viewCategory: UIView!
}

class HomeViewView: UIViewController , MyViewDelegate{
    // MARK: Properties
    //var tabBar = TabBarNavigationButtons()
    var presenter: HomeViewPresenterProtocol?
    var dataCategories = [Categories]()
    var dataCategoriesTable = [Categories]()
    var isCategorySelected = false
    
    @IBOutlet weak var collectionHomeView: UICollectionView!
    @IBOutlet weak var TabBar: TabBarNavigationButtons!
    @IBOutlet weak var tableHomeView: UITableView!
    

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        TabBar.btnHome.layer.cornerRadius = TabBar.frame.height / 2
        TabBar.btnHome.backgroundColor = .systemGray2
        TabBar.btnCart.backgroundColor = .clear
        TabBar.btnUserAccount.backgroundColor = .clear
        TabBar.delegate = self
        
    }
    
    func didTapButton(number:Int) {
        switch number{
        case 0:
            self.navigationController?.pushViewController(HomeViewWireFrame.createHomeViewModule(), animated: true)
        case 1:
            self.navigationController?.pushViewController(ShopingCarWireFrame.createShopingCarModule(), animated: true)
            self.present(UserAccountWireFrame.createUserAccountModule(),animated:true)
        case 2:
            dismiss(animated: true)
            self.present(UserAccountWireFrame.createUserAccountModule(),animated:true)
            
        default:
            print("Error")
        }
    }
}

extension HomeViewView: HomeViewViewProtocol {
    func pushData(with data: [Categories]) {
        self.dataCategories = data
        self.dataCategoriesTable = data
        DispatchQueue.main.async {
            self.collectionHomeView.reloadData()
            self.tableHomeView.reloadData()
        }
    }
    
    // TODO: implement view output methods
}
//MARK: COLLECTION
extension HomeViewView: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollectionView", for: indexPath) as? CollectionHomeView
        cell?.imgCollectionView.image = UIImage(named: "loading")
        DispatchQueue.global(qos: .default).async {
            let url = URL(string: (self.dataCategories[indexPath.row].image) )
            let data = try? Data(contentsOf: url!)
            guard let data = data else {return}
            DispatchQueue.main.async {
                cell?.imgCollectionView.image = UIImage(data: data)
            }
        }
        cell?.lblNombreProductoCollectionView.text = self.dataCategories[indexPath.row].name
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.dataCategories[indexPath.row].name == self.dataCategoriesTable[0].name && isCategorySelected == true{
            self.dataCategoriesTable = self.dataCategories
            isCategorySelected = false
        }else{
            self.dataCategoriesTable = [self.dataCategories[indexPath.row]]
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
        return self.dataCategoriesTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTableHomeView", for: indexPath) as? HomeTableViewCell
        
        cell?.lblNombreCategory.text = self.dataCategoriesTable[indexPath.row].name
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showSpecifcCategory(id: self.dataCategoriesTable[indexPath.row].id, name: self.dataCategoriesTable[indexPath.row].name)
    }
    
    
}
