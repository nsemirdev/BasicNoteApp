//
//  HorizontalStack.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

final class HorizontalStack: UIStackView {
    convenience init(_ arrangedSubviews: [UIView], spacing: CGFloat = 8) {
        self.init(arrangedSubviews: arrangedSubviews)
        axis = .horizontal
        self.spacing = spacing
    }
}
