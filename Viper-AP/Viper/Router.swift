//
//  Router.swift
//  Viper-AP
//
//  Created by Alexey Kremnev on 9/10/24.
//

import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

final class UserRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        let view = UserViewController()
        let interactor = UserInteractor()
        let presenter = UserPresenter()
        
        router.entry = view
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        return router
    }
}
