//
//  Fonts.swift
//  boostCamp
//
//  Created by godemodegame on 12.06.2021.
//

import SwiftUI

extension UIFont {
    static var h1: UIFont {
        UIFont.systemFont(ofSize: 30, weight: .bold)
    }

    static var h2: UIFont {
        UIFont.systemFont(ofSize: 26, weight: .bold)
    }

    static var h3: UIFont {
        UIFont.systemFont(ofSize: 18, weight: .medium)
    }

    static var h4: UIFont {
        UIFont.systemFont(ofSize: 16, weight: .medium)
    }

    static var text1: UIFont {
        UIFont.systemFont(ofSize: 15, weight: .regular)
    }
}

extension Font {
    static var h1: Font {
        Font.system(size: 30, weight: .bold)
    }

    static var h2: Font {
        Font.system(size: 26, weight: .bold)
    }

    static var h3: Font {
        Font.system(size: 18, weight: .medium)
    }

    static var h4: Font {
        Font.system(size: 16, weight: .medium)
    }

    static var text1: Font {
        Font.system(size: 15, weight: .regular)
    }
}
