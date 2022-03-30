//
//  DetailView.swift
//  VIPER_Example3
//
//  Created by Sezgin Çiftci on 28.03.2022.
//

import UIKit

protocol DetailViewProtocol {
    var detailPresenterProtocol: DetailPresenterProtocol? { get set }
    func updateDetail(with detail: [UserModel], index: Int)
}

class DetailView: UIViewController, DetailViewProtocol {
    
    var detailPresenterProtocol: DetailPresenterProtocol?
    
    private var detailUser: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    func updateDetail(with detail: [UserModel], index: Int) {
        DispatchQueue.main.async {
            self.detailUser = detail
            print(detail[index].email)
            
        }
        
    }
    
}
