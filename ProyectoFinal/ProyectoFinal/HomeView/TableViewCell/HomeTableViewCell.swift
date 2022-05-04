//
//  HomeTableViewCell.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 29/04/22.
//

import UIKit

protocol passCollectionProduct{
    func pasarProducto(product:Product)
}

class CollectionTableHomeView: UICollectionViewCell{
    @IBOutlet weak var imgCollectionTableHome: UIImageView!
    @IBOutlet weak var lblPrecioProducto: UILabel!
    @IBOutlet weak var lblNombreProducto: UILabel!
    
    
}


class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNombreCategory: UILabel!
    @IBOutlet weak var collectionTableViewHome: UICollectionView!
    var id = Int()
    var datos:[Product]?
    var delegate:passCollectionProduct?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionTableViewHome.delegate = self
        collectionTableViewHome.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        getAllProductsByCategory(id: id)
    }

}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return datos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollectionTableHome", for: indexPath) as? CollectionTableHomeView
        cell?.imgCollectionTableHome.image = UIImage(named: "loading")
        DispatchQueue.global(qos: .default).async {
            
            if self.datos?[indexPath.row].images?.count == 0{
                
            }else{
                let url = URL(string: self.datos?[indexPath.row].images?[0] ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930")
                guard let url = url else {return}
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    guard let data = data else {return}
                    cell?.imgCollectionTableHome.image = UIImage(data: data)
                }
            }
           
        }
        cell?.lblNombreProducto.text = datos?[indexPath.row].title
        cell?.lblPrecioProducto.text =  "$ " + String(datos?[indexPath.row].price ?? 0)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.pasarProducto(product: (datos?[indexPath.row])!)
    }
    
    
}

extension HomeTableViewCell{
    func getAllProductsByCategory(id:Int){
        let url = "https://api.escuelajs.co/api/v1/categories/\(id)/products"
        guard let url = URL(string: url) else{return}
        let tarea =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard let datos = data else{
                print("No hay datos en la solicitud")
                return
            }
            do{
                let datosDecodificados = try? JSONDecoder().decode([Product].self, from:datos)
                self.datos = datosDecodificados
                DispatchQueue.main.async {
                    self.collectionTableViewHome.reloadData()
                }
            }catch{
                print("Ocurrio un error al convertir los datos")
            }
        }
        tarea.resume()
    }
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= startIndex, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
