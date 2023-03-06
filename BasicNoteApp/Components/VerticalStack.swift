//
//  VerticalStack.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

class VerticalStack: UIStackView {
    convenience init(_ arrangedSubviews: [UIView], spacing: CGFloat = 8) {
        self.init(arrangedSubviews: arrangedSubviews)
        axis = .vertical
        self.spacing = spacing
    }
}
