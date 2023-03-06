//
//  InputView.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit
import SnapKit

final class InputView: UIView, UITextFieldDelegate {

    override var intrinsicContentSize: CGSize {
        .init(width: 0, height: 55)
    }
    
    var validationCallback: ((String) -> Bool)?
    
    enum `Type`: String {
        case email = "Email Invalid"
        case password = "Password Invalid"
        case name = "Full Name Invalid"
    }
    
    var delegate: InputViewDelegate?
    var type: `Type`?
    
    private let placeholderLabel = UILabel(.title4medium, .textSecondary)
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .textPrimary
        textField.font = .title4medium
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    convenience init(type: `Type`) {
        self.init(frame: .zero)
        self.type = type
        textField.delegate = self
        handleType(type)
        setupViews()
        setupBorder()
        setupGesture()
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleGesture() {
        textField.becomeFirstResponder()
    }
    
    private func setupBorder() {
        layer.borderColor = UIColor.borderGray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
    }
    
    private func setupViews() {
        addSubviews(placeholderLabel, textField)
    
        placeholderLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalTo(placeholderLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            self.placeholderLabel.transform = .init(translationX: 0, y: -10)
            self.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            delegate?.didValidSelection(with: type!)
            
            UIView.animate(withDuration: 0.1) {
                self.placeholderLabel.transform = .identity
                self.layoutIfNeeded()
            }
        }
        
        if layer.borderColor != UIColor.helperRed.cgColor {
            layer.borderColor = UIColor.borderGray.cgColor
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let validationCallback else { return }
        if !validationCallback(textField.text!) {
            delegate?.didInvalidSelection(with: type!)
        } else {
            delegate?.didValidSelection(with: type!)
        }
    }
    
    private func handleType(_ type: `Type`)  {
        switch type {
        case .email:
            handleEmail()
        case .password:
            handlePassword()
        case .name:
            handleName()
        }
    }
    
    private func handleEmail() {
        placeholderLabel.text = "Email Address"
        validationCallback = Validate.emailTextField(str:)
    }
    
    private func handlePassword() {
        placeholderLabel.text = "Password"
        validationCallback = Validate.passwordTextField(str:)
        textField.isSecureTextEntry = true
    }
    
    private func handleName() {
        placeholderLabel.text = "Full Name"
        validationCallback = Validate.fullNameTextField(str:)
    }
}
