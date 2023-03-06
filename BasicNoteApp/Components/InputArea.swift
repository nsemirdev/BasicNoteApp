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
    var delegate: InputAreaDelegate?
    
    convenience init(_ type: InputView.`Type`) {
        self.init(frame: .zero)
        spacing = 10
        axis = .vertical
        inputTextField = InputView(type: type)
        addArrangedSubview(inputTextField)
        inputTextField.delegate = self
        errorLabel.text = type.rawValue
    }
    
    func didInvalidSelection(with type: InputView.`Type`) {
        inputTextField.layer.borderColor = UIColor.helperRed.cgColor
        addArrangedSubview(errorStack)
        delegate?.didInvalidSelectionOf(type: type)
    }
    
    func didValidSelection(with type: InputView.`Type`) {
        inputTextField.layer.borderColor = UIColor.purple100.cgColor
        delegate?.didValidSelectionOf(type: type)
        if arrangedSubviews.count != 1 {
            arrangedSubviews[1].removeFromSuperview()
        }
    }
    
}
