//
//  DetailPresenter.swift
//  VIPER_Example3
//
//  Created by Sezgin Çiftci on 28.03.2022.
//

import Foundation
import UIKit

protocol DetailPresenterProtocol {
    var detailView: DetailViewProtocol? { get set }
    var detailInteractor: DetailInteractorProtocol? { get set }
    var detailRouter: DetailRouterProtocol? { get set }
    //func notifyView() -> UINavigationController
    func displayDetail(with user: [UserModel])
    func interactorDidFetchDetail(with result: Result<[UserModel], Error>)
}

final class DetailPresenter: DetailPresenterProtocol {
    
    var user: [UserModel] = []
    var index: Int
    var detailView: DetailViewProtocol?
    var detailInteractor: DetailInteractorProtocol? {
        didSet {
            detailInteractor?.getDetail()
        }
    }
    var detailRouter: DetailRouterProtocol?
    
    init(index: Int) {
        self.index = index
    }
    
//    func notifyView() -> UINavigationController {
//        return UINavigationController(rootViewController: detailView as! UIViewController)
//    }
    
    func displayDetail(with user: [UserModel]) {
        self.user = user
        detailView?.updateDetail(with: user, index: index)
    }
    
    func interactorDidFetchDetail(with result: Result<[UserModel], Error>) {
        switch result {
        case .success(let users):
            //print(users)
            detailView?.updateDetail(with: users, index: index)
        case .failure(let error):
            print(error)
            print("presenter detail problem")
            //detailView?.update(with: "Smt went wrong in presenter")
        }
    }
    
}
