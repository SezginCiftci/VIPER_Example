//
//  DetailView.swift
//  VIPER_Example3
//
//  Created by Sezgin Çiftci on 28.03.2022.
//

import UIKit

protocol DetailViewProtocol {
    var detailPresenter: DetailPresenterProtocol? { get set }
    func updateDetail(with detail: [UserModel], index: Int)
}

class DetailView: UIViewController, DetailViewProtocol {
    
    var detailPresenter: DetailPresenterProtocol?
    private var detailUser: [UserModel] = []
    
    var emailLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .secondarySystemBackground
        title = "Further Detail"
        
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            //emailLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            //emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        emailLabel.adjustsFontSizeToFitWidth = true
        emailLabel.minimumScaleFactor = 0.5
        emailLabel.sizeToFit()
        
    }
    
    func updateDetail(with detail: [UserModel], index: Int) {
        DispatchQueue.main.async {
            self.detailUser = detail
            print(detail[index].email)
            self.emailLabel.text = detail[index].email
        }
        
    }
    
}
