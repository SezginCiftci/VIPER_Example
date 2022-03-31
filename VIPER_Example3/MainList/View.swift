//
//  View.swift
//  VIPER_Example3
//
//  Created by Sezgin Çiftci on 27.03.2022.
//

import UIKit

protocol UserViewProtocol {
    var presenter: UserPresenterProtocol? { get set }
    
    func update(with users: [UserModel])
    func update(with error: String)
}


class UserView: UIViewController, UserViewProtocol {
    
    var presenter: UserPresenterProtocol?
    
    var userTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var user: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
//    func notifyView() -> UINavigationController {
//
//    }
  
    func update(with users: [UserModel]) {
        DispatchQueue.main.async {
            self.user = users
            self.userTable.reloadData()
        }
    }
    
    func update(with error: String) {
        print("error")
    }
    
    private func configureUI() {
        
        title = "User Names"
        view.backgroundColor = .systemBlue
        navigationController?.navigationBar.prefersLargeTitles = true
        
        userTable.delegate = self
        userTable.dataSource = self
        
        view.addSubview(userTable)
        NSLayoutConstraint.activate([
            userTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            userTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            userTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
}

extension UserView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = user[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.presenter?.navigateToDetail(at: indexPath.row)
    }
}
