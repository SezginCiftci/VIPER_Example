//
//  DetailInteractor.swift
//  VIPER_Example3
//
//  Created by Sezgin Çiftci on 28.03.2022.
//

import Foundation

protocol DetailInteractorProtocol {
    var detailPresenter: DetailPresenterProtocol? { get set }
    func getDetail()
}

final class DetailInteractor: DetailInteractorProtocol {
    
    var detailPresenter: DetailPresenterProtocol?
    
    func getDetail() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let userData = try JSONDecoder().decode([UserModel].self, from: data)
                self?.detailPresenter?.interactorDidFetchDetail(with: .success(userData))
                //print("got users")
            } catch {
                self?.detailPresenter?.interactorDidFetchDetail(with: .failure(error))
                print("smt went wrong")
            }
            
        }.resume()
    }
}
