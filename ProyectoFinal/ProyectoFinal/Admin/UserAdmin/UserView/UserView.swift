//
//  UserView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/7/22.
//  
//

import Foundation
import UIKit

class UserView: UIViewController, MyViewDelegateAdmin {

    // MARK: Properties
    var presenter: UserPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TabBar: TabBarNavigationButtonsAdmin!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var users : [Users]?
    
    
    //var users : [Users]?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.window?.rootViewController?.dismiss(animated: true)
        presenter?.viewDidLoad()
        selectedLabel.layer.cornerRadius = (selectedLabel.frame.size.width) / 2
        selectedLabel.clipsToBounds = true
        TabBar.btnProducts.tintColor = .black
        TabBar.btnCategories.tintColor = .black
        TabBar.btnUsers.tintColor = .systemIndigo
        TabBar.btnProfile.tintColor = .black
        TabBar?.delegate = self
    }
    
    @IBAction func addPressed(_ sender: Any) {
        presenter?.showAddUserView()
    }
    
    func didTapButton(number: Int) {
        switch number{
            case 0:
                presenter?.showProductView()
            case 1:
                presenter?.showCategorieView()
            case 2:
                tableView.reloadData()
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

extension UserView: UserViewProtocol {
   
    
    // TODO: implement view output methods
    
    func presenterGetUsers(receivedUsers: [Users]) {
        users = receivedUsers
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
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
}

extension UserView : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserViewCell

        cell.userImageView.image = UIImage(named: "No_Image_Available")
        cell.userNameLabel.text = users?[indexPath.row].name ?? ""



        DispatchQueue.global(qos: .default).async { [self] in

            if self.users?[indexPath.row].avatar != nil {
                let urlImage = URL(string: (users?[indexPath.row].avatar) ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930")
                guard let urlImage = urlImage else { return }
                guard let data = try? Data(contentsOf: urlImage) else {return}

                DispatchQueue.main.async {
                    cell.userImageView.image = UIImage(data: data)

                }
            }

        }
        return cell
    }
   
}

extension UserView : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        presenter?.showDetailCategorieView(with: String(categories![indexPath.row].id!))
    }
}

