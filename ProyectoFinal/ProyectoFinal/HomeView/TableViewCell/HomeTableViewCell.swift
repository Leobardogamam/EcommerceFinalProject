//
//  HomeTableViewCell.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 29/04/22.
//

import UIKit
class CollectionTableHomeView: UICollectionViewCell{
    @IBOutlet weak var imgCollectionTableHome: UIImageView!
    @IBOutlet weak var lblPrecioProducto: UILabel!
    @IBOutlet weak var lblNombreProducto: UILabel!
}


class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNombreCategory: UILabel!
    @IBOutlet weak var collectionTableViewHome: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionTableViewHome.delegate = self
        collectionTableViewHome.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollectionTableHome", for: indexPath) as? CollectionTableHomeView
        
        cell?.imgCollectionTableHome.image = UIImage(named: "loading")
        cell?.lblNombreProducto.text = "Producto"
        cell?.lblPrecioProducto.text = "200"
        
        return cell ?? UICollectionViewCell()
    }
    
    
}
