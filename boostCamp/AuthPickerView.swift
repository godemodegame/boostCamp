//
//  AuthPickerView.swift
//  boostCamp
//
//  Created by godemodegame on 14.06.2021.
//

import SwiftUI

enum CareerService {
    @UserDefault("career", defaultValue: "")
    static var career: String
}

struct AuthPickerView: View {
    var works = ["frontend_junior", "ios_dev"]
    @State private var selectedWork = "frontend_junior"
    @State private var isShowNext: Bool = false
    
    var body: some View {
        VStack {
            Text("Выберите профессию")
                .font(.h1)

            Picker("", selection: $selectedWork) {
                ForEach(works, id: \.self) {
                    Text($0)
                }
            }

            Button(
                action: buttonTapped,
                label: {
                    Text("Продолжить")
                        .padding()
                        .foregroundColor(.white)
                        .font(.text1)
                }
            )
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(.accent))
            .cornerRadius(10)
            .padding()
            .fullScreenCover(isPresented: $isShowNext) {
                MainTabView()
            }
        }
    }

    func buttonTapped() {
        CareerService.career = selectedWork
        isShowNext = true
    }
}

struct AuthPickerView_Previews: PreviewProvider {
    static var previews: some View {
        AuthPickerView()
    }
}
