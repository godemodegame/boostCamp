//
//  MainView.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import SwiftUI

struct MainView: View {
    @State private var response: Response?
    @State var carouselSelected: CarouselViewModel?
    @State var isRequested = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ScrollView {
                        HStack {
                            CarouselView(
                                viewModels: [
                                    CarouselViewModel(
                                        id: 0,
                                        cardName: "Books",
                                        cardImage: "Group_48",
                                        storytext: "Material Design прочитайте новую книгу для повышения квалификации",
                                        storyImage: "Frame_50"
                                    ),
                                    CarouselViewModel(
                                        id: 1,
                                        cardName: "New\ncourses",
                                        cardImage: "Group_49",
                                        storytext: "Посмотрите новый видеурок об основах маркетинга",
                                        storyImage: "Frame_49"
                                    ),
                                    CarouselViewModel(
                                        id: 2,
                                        cardName: "News",
                                        cardImage: "Group_50",
                                        storytext: "Выпускница курса «Коммерческий редактор» ведёт стримы  видеоигр.\n\nДарья расказала рассказала, какие способы заработка на играх существуют.",
                                        storyImage: "Картинка"
                                    ),
                                    CarouselViewModel(
                                        id: 3,
                                        cardName: "News",
                                        cardImage: "Group_52",
                                        storytext: "Глобальная цифровизация наступила. Теперь работника оценивают не только по профессионализму, но и насколько адекватно он ведёт коммуникацию в онлайне.",
                                        storyImage: "Frame_48"
                                    )
                                ],
                                completion: {
                                    carouselSelected = $0
                                }
                            ).fullScreenCover(item: $carouselSelected) { item in
                                if let carousel = item {
                                    StoryView(viewModel: carousel)
                                }
                            }
                        }
                    }
                    .frame(height: 100)
                    .padding(.top)
                    
                    MainProgress(minValue: 0, value: 45, maxValue: 100)
                        .cornerRadius(10)
                        .padding(.top)
                    
                    Text("iOS development")
                        .font(.h2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    if let course = response?.course {
                        ForEach(course) { item in
                            if let url = URL(string: item.url) {
                                Link(destination: url) {
                                    BasicCollectionCell(
                                        title: "Курс",
                                        subtitle: item.name,
                                        isActive: false,
                                        isShowPlay: false
                                    ).padding(.horizontal)
                                }
                            }
                        }
                    } else {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                        Text("Загрузка может быть долгой, наберитесь терпения")
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle(Text("Main"))
        }
    }
    
    func loadData() {
        guard !isRequested else {
            return
        }
        isRequested.toggle()
        guard let url = URL(string: "http://91.77.166.143:8080/api/recommendation/?username=\(GithubService.login)&career=\(CareerService.career)") else {
            print("Invalid URL")
            return
        }
        print(url.absoluteString)
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        self.response = decodedResponse
                    }
                    return
                }
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct Response: Codable {
    let course: [Course]
    let lib: [Lib]
    let lang: [Lib]
}

struct Lib: Codable {
    let name: String
    let value: Int
}

struct Course: Codable, Identifiable {
    var id: String {
        name
    }
    
    let name: String
    let img: String
    let url: String
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
