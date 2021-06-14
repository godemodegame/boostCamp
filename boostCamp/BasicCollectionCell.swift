//
//  BasicCollectionCell.swift
//  boostCamp
//
//  Created by godemodegame on 13.06.2021.
//

import SwiftUI

struct BasicCollectionCell: View {
    let title: String
    let subtitle: String
    let isActive: Bool
    let isShowPlay: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(isActive ? .green1 : .purple1))

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.h4)
                    .foregroundColor(Color(.textWhite))

                Text(subtitle)
                    .font(.text1)
                    .foregroundColor(Color(.textWhite))

                Spacer()
            }
            .padding(.leading, 9)
            .padding(.trailing, 38)
            .padding(.top, 12)

            if isShowPlay {
                VStack {
                    Spacer()

                    HStack {
                        Spacer()

                        Image("play")
                    }
                }
                .padding([.trailing, .bottom], 9)
            }
        }
    }
}

struct BasicCollectionCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicCollectionCell(
                title: "Урок:",
                subtitle: "ios developer База с++",
                isActive: true,
                isShowPlay: true
            ).frame(width: 157, height: 96)

            BasicCollectionCell(
                title: "Урок:",
                subtitle: "ios developer База с++",
                isActive: false,
                isShowPlay: false
            ).frame(width: 157, height: 96)
        }
    }
}
