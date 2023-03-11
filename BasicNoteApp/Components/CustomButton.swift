//
//  CustomButton.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

final class CustomButton: UIButton {

    private enum ButtonState {
        case normal
        case disabled
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                if let color = defaultBackgroundColor {
                    self.backgroundColor = color
                }
            } else {
                if let color = disabledBackgroundColor {
                    self.backgroundColor = color
                }
            }
        }
    }
    
    private var disabledBackgroundColor: UIColor?
    private var defaultBackgroundColor: UIColor? {
        didSet {
            backgroundColor = defaultBackgroundColor
        }
    }
    
    private func setBackgroundColor(_ color: UIColor?, for state: ButtonState) {
        switch state {
        case .disabled:
            disabledBackgroundColor = color
        case .normal:
            defaultBackgroundColor = color
        }
    }
    
    private func initColors() {
        setBackgroundColor(.purple100, for: .normal)
        setBackgroundColor(.purple50, for: .disabled)
        setTitleColor(.white, for: .normal)
        setTitleColor(.purple100, for: .disabled)
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 53).isActive = true
    }
    
    convenience init(title: String) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        initColors()
        titleLabel?.font = .title2
    }
    
    convenience init(title: String, imageName: String) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        initColors()
        titleLabel?.font = .title4
    }

}
