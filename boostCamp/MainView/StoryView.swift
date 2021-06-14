//
//  StoryView.swift
//  boostCamp
//
//  Created by godemodegame on 14.06.2021.
//

import SwiftUI

struct StoryView: View {
    let viewModel: CarouselViewModel

    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Image(viewModel.storyImage)
                .resizable()
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 13) {
                HStack {
                    Spacer()

                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    }
                }

                Spacer()

                Text(viewModel.storytext)
                    .foregroundColor(.white)
                    .font(.h2)

                Button(
                    action: {},
                    label: {
                        Text("Найти статью")
                            .padding(.vertical)
                            .foregroundColor(.white)
                            .font(.text1)
                    }
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color(.accent))
                .cornerRadius(10)
            }.padding(.horizontal, 25)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StoryView(
                viewModel:
                    CarouselViewModel(
                        id: 0,
                        cardName: "Books",
                        cardImage: "Group_48",
                        storytext: "Material Design прочитайте новую книгу для повышения квалификации",
                        storyImage: "Frame_50"
                    )
            )
            
            StoryView(
                viewModel:
                    CarouselViewModel(
                        id: 1,
                        cardName: "New\ncourses",
                        cardImage: "Group_49",
                        storytext: "Посмотрите новый видеурок об основах маркетинга",
                        storyImage: "Frame_49"
                    )
            )
            
            StoryView(
                viewModel:
                    CarouselViewModel(
                        id: 2,
                        cardName: "News",
                        cardImage: "Group_50",
                        storytext: "Выпускница курса «Коммерческий редактор» ведёт стримы  видеоигр.\n\nДарья расказала рассказала, какие способы заработка на играх существуют.",
                        storyImage: "Картинка"
                    )
            )
            
            StoryView(
                viewModel:
                    CarouselViewModel(
                        id: 3,
                        cardName: "News",
                        cardImage: "Group_52",
                        storytext: "Глобальная цифровизация наступила. Теперь работника оценивают не только по профессионализму, но и насколько адекватно он ведёт коммуникацию в онлайне.",
                        storyImage: "Frame_48"
                    )
            )
        }
    }
}
