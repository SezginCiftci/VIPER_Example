//
//  Interactor.swift
//  VIPER_Example3
//
//  Created by Sezgin Çiftci on 27.03.2022.
//

import UIKit

protocol UserInteractorProtocol {
    var presenter: UserPresenterProtocol? { get set }
    func getUsers()
}


final class UserInteractor: UserInteractorProtocol {
    
    
    var presenter: UserPresenterProtocol?
    
    func getUsers() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let userData = try JSONDecoder().decode([UserModel].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(userData))
                //print("got users")
            } catch {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
                print("smt went wrong")
            }
            
        }.resume()
    }

}
