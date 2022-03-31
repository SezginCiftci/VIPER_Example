//
//  Presenter.swift
//  VIPER_Example3
//
//  Created by Sezgin Çiftci on 27.03.2022.
//

import UIKit

//ref to interactor, router, view

protocol UserPresenterProtocol {
    var router: UserRouterProtocol? { get set }
    var interactor: UserInteractorProtocol? { get set }
    var view: UserViewProtocol? { get set }
    func navigateToDetail(at index: Int)
    func interactorDidFetchUsers(with result: Result<[UserModel], Error>)
}

final class UserPresenter: UserPresenterProtocol {
    
    var router: UserRouterProtocol?
    var view: UserViewProtocol?

    var interactor: UserInteractorProtocol? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    func interactorDidFetchUsers(with result: Result<[UserModel], Error>) {
        switch result {
        case .success(let users):
            //print(users)
            view?.update(with: users)
        case .failure(let error):
            print(error)
            view?.update(with: "Smt went wrong in presenter")
        }
    }
    
    func navigateToDetail(at index: Int) {
        self.router?.showDetail(at: index, on: view  as! UserView) // look that
    }

}
