//
//  UIButton+.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

extension UIButton {
    convenience init(title: String, textColor: UIColor, font: UIFont) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        setTitleColor(textColor, for: .normal)
        titleLabel?.font = font
    }
}
