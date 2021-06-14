//
//  MainProgress.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import SwiftUI

struct MainProgress: View {
    let minValue: Float
    let value: Float
    let maxValue: Float

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Your EXP")
                .font(.h4)
            Text("\(Int(value))/\(Int(maxValue))")
                .font(.text1)
            ProgressView(value: (maxValue - minValue) / value)
        }
        .padding(.top, 12)
        .padding(.horizontal, 20)
        .padding(.bottom, 25)
    }
}

struct MainProgress_Previews: PreviewProvider {
    static var previews: some View {
        MainProgress(
            minValue: 0,
            value: 45,
            maxValue: 100
        )
    }
}
