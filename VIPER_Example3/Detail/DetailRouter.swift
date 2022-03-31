//
//  DetailRouter.swift
//  VIPER_Example3
//
//  Created by Sezgin Çiftci on 28.03.2022.
//

import UIKit


protocol DetailRouterProtocol {
}

final class DetailRouter: DetailRouterProtocol {
    
    
    //weak var view: UIViewController?
    
    class func createModule(index: Int) -> UIViewController {
        let view = DetailView()
        let presenter = DetailPresenter(index: index)
        let interactor = DetailInteractor()
        let router = DetailRouter()
        
        view.detailPresenter = presenter
        interactor.detailPresenter = presenter
        //router.view = view
        presenter.detailView = view
        presenter.detailRouter = router
        presenter.detailInteractor = interactor

        return view
    }
  
    
}

//typealias EntryPointDetail = DetailViewProtocol & UIViewController
//
//protocol DetailRouterProtocol {
//    var entryDetail: EntryPointDetail? { get }
//    static func loadDetail(at index: Int) -> DetailRouterProtocol
//}
//
//
//final class DetailRouter: DetailRouterProtocol {
//
//    var entryDetail: EntryPointDetail?
//
//    static func loadDetail(at index: Int) -> DetailRouterProtocol {
//
//        let detailRouter = DetailRouter()
//
//        //Assign VIP
//        var detailView: DetailViewProtocol = DetailView()
//        var detailPresenter: DetailPresenterProtocol = DetailPresenter(index: index)
//        var detailInteractor: DetailInteractorProtocol = DetailInteractor()
//
//        detailView.detailPresenterProtocol = detailPresenter
//        detailInteractor.detailPresenter = detailPresenter
//        detailPresenter.detailRouter = detailRouter
//        detailPresenter.detailInteractor = detailInteractor
//        detailPresenter.detailView = detailView
//
//        detailRouter.entryDetail = detailView as? EntryPointDetail
//
//        return detailRouter
//    }
//}
