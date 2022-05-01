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
}

class HomeViewView: UIViewController {

    // MARK: Properties
    var presenter: HomeViewPresenterProtocol?
    var dataCategories = [Categories]()
    
    @IBOutlet weak var collectionHomeView: UICollectionView!
    @IBOutlet weak var TabBar: TabBarNavigationButtons!
    @IBOutlet weak var tableHomeView: UITableView!
    

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeViewView: HomeViewViewProtocol {
    func pushData(with data: [Categories]) {
        self.dataCategories = data
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
        DispatchQueue.global(qos: .default).async {
            let url = URL(string: (self.dataCategories[indexPath.row].image) ?? "https://static.wikia.nocookie.net/ssbb/images/b/b8/025Pikachu_LG.png/revision/latest?cb=20190520161120&path-prefix=es")
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell?.imgCollectionView.image = UIImage(data: data!)
            }
        }
        cell?.lblNombreProductoCollectionView.text = self.dataCategories[indexPath.row].name
        
        return cell ?? UICollectionViewCell()
    }
}

extension HomeViewView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTableHomeView", for: indexPath) as? HomeTableViewCell
        
        return cell ?? UITableViewCell()
    }
    
    
}
