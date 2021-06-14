//
//  GithubWebPresenter.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import Foundation

protocol GithubWebPresenterProtocol: AnyObject {
    func requestForCallbackURL(request: URLRequest)
    func viewLoaded()
}

final class GithubWebPresenter: GithubWebPresenterProtocol {

    // MARK: Vars

    weak var view: GithubWebViewProtocol?
    let githubService: GithubServiceProtocol

    var completion: (() -> Void)?

    // MARK: Lifecycle

    init(
        view: GithubWebViewProtocol,
        githubService: GithubServiceProtocol
    ) {
        self.view = view
        self.githubService = githubService
    }

    // MARK: - GithubWebPresenterProtocol

    func viewLoaded() {
        guard let request = githubService.makeUrl() else {
            fatalError("no url in github view")
        }
        view?.loadWebView(with: request)
    }

    // MARK: - тут начинается дичь, которую надо вынести в сервис, ибо ну не дела

    func requestForCallbackURL(request: URLRequest) {
        // Get the authorization code string after the '?code=' and before '&state='
        let requestURLString = (request.url?.absoluteString)! as String
        print(requestURLString)
        if requestURLString.hasPrefix(GithubConstants.REDIRECT_URI) {
            if requestURLString.contains("code=") {
                if let range = requestURLString.range(of: "=") {
                    let githubCode = requestURLString[range.upperBound...]
                    if let range = githubCode.range(of: "&state=") {
                        let githubCodeFinal = githubCode[..<range.lowerBound]
                        githubRequestForAccessToken(authCode: String(githubCodeFinal))
                    }
                }
            }
        }
    }

    func githubRequestForAccessToken(authCode: String) {
        let grantType = "authorization_code"
        // Set the POST parameters.
        let postParams = "grant_type=" + grantType + "&code=" + authCode + "&client_id=" + GithubConstants.CLIENT_ID + "&client_secret=" + GithubConstants.CLIENT_SECRET
        let postData = postParams.data(using: String.Encoding.utf8)
        let request = NSMutableURLRequest(url: URL(string: GithubConstants.TOKENURL)!)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request as URLRequest) { [weak self] (data, response, _) -> Void in
            guard let self = self else {
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            if statusCode == 200 {
                let results = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [AnyHashable: Any]
                let accessToken = results?["access_token"] as! String
                // Get user's id, display name, email, profile pic url
                self.fetchGitHubUserProfile(accessToken: accessToken)
            }
        }.resume()
    }

    func fetchGitHubUserProfile(accessToken: String) {
        let tokenURLFull = "https://api.github.com/user"
        let verify: NSURL = NSURL(string: tokenURLFull)!
        let request: NSMutableURLRequest = NSMutableURLRequest(url: verify as URL)
        request.addValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request as URLRequest) { [weak self] data, _, error in
            guard let self = self else {
                return
            }
            if error == nil {
                let result = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [AnyHashable: Any]
                if let urlString = result?["url"] as? String{
                    self.fetchUser(from: urlString)
                    self.completion?()
                    DispatchQueue.main.async {
                        self.view?.close()
                    }
                }
            }
        }
        task.resume()
    }

    func fetchUser(from link: String) {
        // "https://github.com/godemodegame" "https://api.github.com/users/godemodegame"
        let check = ["https:", "api.github.com", "github.com", "users", ""]
        let potentialUsers = link.components(separatedBy: "/").filter {
            !check.contains($0)
        }
        print("qwerty", link.components(separatedBy: "/"))
        print(potentialUsers)
        GithubService.login = potentialUsers.first ?? ""
    }
}
