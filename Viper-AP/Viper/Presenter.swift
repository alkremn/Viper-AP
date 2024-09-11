//
//  Presenter.swift
//  Viper-AP
//
//  Created by Alexey Kremnev on 9/10/24.
//

import Foundation

protocol AnyPresenter: AnyObject {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? {get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

final class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    weak var view: AnyView?

    func interactorDidFetchUsers(with result: Result<[User], any Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure(_):
            view?.update(with: "Something went wrong")
        }
    }
}
