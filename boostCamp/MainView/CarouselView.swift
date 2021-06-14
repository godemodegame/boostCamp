//
//  CarouselView.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import SwiftUI

extension String: Identifiable {
    public var id: String {
        self
    }
}

struct CarouselViewModel: Identifiable {
    let id: Int
    let cardName: String
    let cardImage: String
    let storytext: String
    let storyImage: String
}

struct CarouselView: View {
    let viewModels: [CarouselViewModel]
    let completion: ((CarouselViewModel) -> Void)?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                Spacer(minLength: 0)

                ForEach(viewModels) { item in
                    Button(action: {
                        completion?(item)
                    }) {
                        ZStack {
                            Image(item.cardImage)

                            VStack {
                                Spacer()

                                Text(item.cardName)
                                    .font(.text1)
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 8)
                        }.frame(width: 90, height: 90)
                    }
                }

                Spacer(minLength: 0)
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(
            viewModels: [
                CarouselViewModel(
                    id: 0,
                    cardName: "Books",
                    cardImage: "Group_48",
                    storytext: "Material Design прочитайте новую книгу для повышения квалификации",
                    storyImage: "Картинка"
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
                    storyImage: "Frame_48"
                ),
                CarouselViewModel(
                    id: 3,
                    cardName: "News",
                    cardImage: "Group_52",
                    storytext: "Глобальная цифровизация наступила. Теперь работника оценивают не только по профессионализму, но и насколько адекватно он ведёт коммуникацию в онлайне.",
                    storyImage: "Frame_49"
                )
            ], completion: nil
        )
    }
}
