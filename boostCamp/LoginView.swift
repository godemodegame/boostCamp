//
//  LoginView.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import SwiftUI

enum LoginViewDestination: Identifiable {
    case githubView
    case mainTab

    var id: Int {
        hashValue
    }
}

struct LoginView: View {
    @State private var destination: LoginViewDestination?

    @State private var urlString = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Авторизация")
                .font(.h1)
                .foregroundColor(Color(.textPrimary))
                .padding(.bottom, 24)
                .padding(.top, 100)

            TextField("Ссылка на Github", text: $urlString)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.stroke1))
                )

            Spacer()

            HStack {
                Spacer()

                VStack {
                    Button(
                        action: {},
                        label: {
                            Text("Button")
                                .padding()
                                .foregroundColor(.white)
                                .font(.text1)
                        }
                    )
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(.accent))
                    .cornerRadius(10)

                    Button("Войти с помощью Github") {
                        destination = .githubView
                    }
                    .foregroundColor(Color(.textLink))
                    .fullScreenCover(item: $destination) { item in
                        if item == .mainTab {
                            AuthPickerView()
                        } else {
                            GithubView(
                                completion: {
                                    withAnimation {
                                        destination = .mainTab
                                    }
                                }
                            )
                        }
                    }
                }

                Spacer()
            }
        }.padding(40)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .previewDevice("iPhone 12 Pro")

            LoginView()
                .previewDevice("iPhone 12 Pro Max")

            LoginView()
                .previewDevice("iPhone 12 mini")
            LoginView()
                .previewDevice("iPhone SE (2nd generation)")
        }
            
    }
}
