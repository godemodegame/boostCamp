//
//  GithubView.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import SwiftUI

struct GithubView: UIViewControllerRepresentable {
    let completion: () -> Void

    func makeUIViewController(context: UIViewControllerRepresentableContext<GithubView>) -> GithubWebView {
        GithubConfigurator().configure(completion: completion)
    }

    func updateUIViewController(_: GithubWebView, context _: UIViewControllerRepresentableContext<GithubView>) { }
}
