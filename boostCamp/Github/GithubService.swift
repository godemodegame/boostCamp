//
//  GithubService.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import Foundation

protocol GithubServiceProtocol: AnyObject {
    func makeUrl() -> URLRequest?
    static var login: String { get set }
}

final class GithubService: GithubServiceProtocol {
    @UserDefault("login", defaultValue: "")
    static var login: String

    func makeUrl() -> URLRequest? {
        let uuid = UUID().uuidString
        let authURLFull = "https://github.com/login/oauth/authorize?client_id=" + GithubConstants.CLIENT_ID + "&scope=" + GithubConstants.SCOPE + "&redirect_uri=" + GithubConstants.REDIRECT_URI + "&state=" + uuid
        guard let url = URL(string: authURLFull) else {
            return nil
        }
        return URLRequest(url: url)
    }
}
