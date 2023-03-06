//
//  UILabel+.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

extension UILabel {
    convenience init(_ text: String = "", _ font: UIFont, _ color: UIColor) {
        self.init(frame: .zero)
        self.font = font
        self.textColor = color
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
    }
}
