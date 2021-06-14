//
//  GitHubWebView.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import WebKit

protocol GithubWebViewProtocol: UIViewController {
    func close()
    func loadWebView(with: URLRequest)
}

final class GithubWebView: UIViewController, WKNavigationDelegate, GithubWebViewProtocol {

    // MARK: - Components & vars

    var presenter: GithubWebPresenterProtocol?

    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()

    // MARK: - Lifecycle

    override func loadView() {
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }

    // MARK: - GithubWebViewProtocol

    func close() {
        dismiss(animated: true, completion: nil)
    }

    func loadWebView(with request: URLRequest) {
        webView.load(request)
    }

    // MARK: - WKNavigationDelegate

    func webView(
        _: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
    {
        presenter?.requestForCallbackURL(request: navigationAction.request)
        decisionHandler(.allow)
    }
}
