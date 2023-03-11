//
//  UILabel+.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String = "", _ font: UIFont, _ color: UIColor, alignment: NSTextAlignment = .center, nLines: Int = 1) {
        self.init(frame: .zero)
        self.font = font
        self.textColor = color
        self.text = text
        self.textAlignment = alignment
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = nLines
    }
}
