//
//  ProfileView.swift
//  boostCamp
//
//  Created by godemodegame on 13.06.2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Profile")
                }
            }
            .navigationTitle(GithubService.login ?? "Профиль")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
