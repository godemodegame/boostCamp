//
//  GithubConfigurator.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import UIKit

// Всю логику из презентера вытащить сюда
final class GithubConfigurator {
    func configure(completion: @escaping () -> Void) -> GithubWebView {
        let view = GithubWebView()
        let presenter = GithubWebPresenter(view: view, githubService: GithubService())

        view.presenter = presenter
        presenter.completion = completion

        return view
    }
}
