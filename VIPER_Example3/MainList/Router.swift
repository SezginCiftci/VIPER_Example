//
//  Router.swift
//  VIPER_Example3
//
//  Created by Sezgin Çiftci on 27.03.2022.
//

import Foundation
import UIKit

typealias EntryPoint = UserViewProtocol & UIViewController

protocol UserRouterProtocol {
    var entry: EntryPoint? { get }
    func showDetail(at index: Int, on view: UserViewProtocol)
    static func start() -> UserRouterProtocol
}

final class UserRouter: UserRouterProtocol {
    
    var entry: EntryPoint?
  //  var view: UserView?
    
    func showDetail(at index: Int, on view: UserViewProtocol) {
        let detailVC = DetailRouter.createModule(index: index)
        guard let sourceView = view as? UIViewController else { return }
        sourceView.navigationController?.pushViewController(detailVC, animated: true)

    }
    
    static func start() -> UserRouterProtocol {
        
        let router = UserRouter()
        //Assign VIP
        var view: UserViewProtocol = UserView()
        var presenter: UserPresenterProtocol = UserPresenter()
        var interactor: UserInteractorProtocol = UserInteractor()
   
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
}
