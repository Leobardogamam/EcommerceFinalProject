//
//  SpecificCategoryView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 01/05/22.
//  
//

import Foundation
import UIKit
class collectionCellProduct:UICollectionViewCell{
    
    @IBOutlet weak var lblNameProduct: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblPriceProduct: UILabel!
}

class SpecificCategoryView: UIViewController {

    // MARK: Properties
    var presenter: SpecificCategoryPresenterProtocol?
    var dataProducts = [Product]()

    // MARK: Lifecycle
    @IBOutlet weak var lblNombreCategoria: UILabel!
    @IBOutlet weak var collectionCategory: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    @IBAction func onPressReturnBack(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension SpecificCategoryView: SpecificCategoryViewProtocol {
    // TODO: implement view output methods
    
    func showDataProducts(with product:[Product]){
        self.dataProducts = product
        DispatchQueue.main.async { [self] in
            collectionCategory.reloadData()
        }
    }
    
    func sendNameCategory(name: String) {
        lblNombreCategoria.text = name
    }
    
}

extension SpecificCategoryView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCategorySpecific", for: indexPath) as? collectionCellProduct
        cell?.imgProduct.image = UIImage(named: "Fondo")
        DispatchQueue.global(qos: .default).async {
            var url: URL?
            do {
                url = try URL(string: self.dataProducts[indexPath.row].images[0])
            } catch  {
                
            }
            
            if (url == nil){
                
            }else{
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    cell?.imgProduct.image = UIImage(data: data!)
                }
            }
        }
        
        cell?.lblNameProduct.text = dataProducts[indexPath.row].title
        cell?.lblPriceProduct.text = "$" +  String(dataProducts[indexPath.row].price)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showDetailProduct(product: dataProducts[indexPath.row])
    }
    
    
}
