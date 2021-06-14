//
//  ContentView.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import SwiftUI

struct MainTabView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image("Group_32")
                        .renderingMode(.template)
                    Text("Main")
                }

            LibraryView()
                .tabItem {
                    Image("book")
                        .renderingMode(.template)
                    Text("Библиотека")
                }

//            ProfileView()
//                .tabItem {
//                    Image("person")
//                        .renderingMode(.template)
//                    Text("Профиль")
//                }
        }
        .accentColor(Color(.green1))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
