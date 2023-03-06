//
//  InputArea.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

final class InputArea: UIStackView, InputViewDelegate {
    
    private var inputTextField: InputView!
    private let errorLabel = UILabel(.title5, .helperRed)
    private lazy var errorStack = HorizontalStack([
        UIImageView(image: UIImage(named: "ic_error")),
        errorLabel,
        UIView()
    ])
    
    convenience init(_ type: InputView.`Type`) {
        self.init(frame: .zero)
        spacing = 10
        axis = .vertical
        inputTextField = InputView(type: type)
        addArrangedSubview(inputTextField)
        inputTextField.delegate = self
        errorLabel.text = type.rawValue
    }
    
    func didInvalidSelection() {
        inputTextField.layer.borderColor = UIColor.helperRed.cgColor
        addArrangedSubview(errorStack)
    }
    
    func didValidSelection() {
        inputTextField.layer.borderColor = UIColor.purple100.cgColor

        if arrangedSubviews.count != 1 {
            arrangedSubviews[1].removeFromSuperview()
        }
    }
    
}
