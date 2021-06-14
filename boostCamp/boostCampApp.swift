//
//  boostCampApp.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import SwiftUI

@main
struct boostCampApp: App {
    var body: some Scene {
        WindowGroup {
            if GithubService.login.count <= 0 {
                LoginView()
            } else {
                MainTabView()
            }
        }
    }
}
