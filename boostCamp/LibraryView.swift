//
//  LibraryView.swift
//  boostCamp
//
//  Created by godemodegame on 13.06.2021.
//

import SwiftUI

struct LibraryView: View {
    @State private var searchString = ""

    let practices = [
        "Интеграция голосовых функций в приложение",
        "Добавление в проект вопросно-ответной системы Wolfram Alpha",
        "Создание пользовательского интерфейса, реализация принципов Material Design с помощью Material Design Components",
        "Создание проекта в Android Studio, настройка эмулятора и запуск проект на нём"
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Поиск", text: $searchString)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.stroke1))
                        )

                    Text("Видео Уроки")
                        .font(.h3)

                    HStack(spacing: 15) {
                        BasicCollectionCell(
                            title: "Урок:",
                            subtitle: "ios developer База с++",
                            isActive: true,
                            isShowPlay: true
                        )

                        BasicCollectionCell(
                            title: "Урок:",
                            subtitle: "ux/ui Компоненты",
                            isActive: false,
                            isShowPlay: true
                        )
                    }.frame(height: 96)

                    HStack(spacing: 15) {
                        BasicCollectionCell(
                            title: "Урок:",
                            subtitle: "Ux/ui сетка",
                            isActive: false,
                            isShowPlay: true
                        )

                        BasicCollectionCell(
                            title: "Урок:",
                            subtitle: "ios developer Alamofire SDK",
                            isActive: false,
                            isShowPlay: true
                        )
                    }.frame(height: 96)

                    Text("Лекции")
                        .font(.h3)

                    HStack(spacing: 15) {
                        BasicCollectionCell(
                            title: "Урок:",
                            subtitle: "Material Design Components",
                            isActive: true,
                            isShowPlay: false
                        )

                        BasicCollectionCell(
                            title: "Урок:",
                            subtitle: "Знакомство с API и SDK",
                            isActive: false,
                            isShowPlay: false
                        )
                    }.frame(height: 96)

                    HStack(spacing: 15) {
                        BasicCollectionCell(
                            title: "Урок:",
                            subtitle: "Material Design",
                            isActive: false,
                            isShowPlay: false
                        )

                        BasicCollectionCell(
                            title: "Урок:",
                            subtitle: "Wolfram Alpha SDK",
                            isActive: false,
                            isShowPlay: false
                        )
                    }.frame(height: 96)

                    Text("Практика")
                        .font(.h3)

                    ForEach(practices) { item in
                        BasicCollectionCell(
                            title: "Задание:",
                            subtitle: item,
                            isActive: false,
                            isShowPlay: false
                        )
                    }
                }.padding(.horizontal, 23)
            }.navigationTitle("Библиотека")
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
