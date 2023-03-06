//
//  RegisterController.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

final class RegisterController: UIViewController, InputStackDelegate {
    
    func didValidForm() {
        signUpButton.isEnabled = true
    }
    
    func didInvalidForm() {
        signUpButton.isEnabled = false
    }
    
    private let labelsStack = VerticalStack([
        UILabel(text: "Sign Up", .title1, .textPrimary, alignment: .center),
        UILabel(text: "Login or sign up to continue using our app.", .title3, .textSecondary, alignment: .center)
    ], spacing: 16)
    
    private let forgotButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.textPrimary, for: .normal)
        button.titleLabel?.font = .title4medium
        return button
    }()
    
    private lazy var forgotPassword = HorizontalStack([
        UIView(), forgotButton
    ])
    
    private let signUpButton: CustomButton = {
        let button = CustomButton(title: "Sign Up")
        button.heightAnchor.constraint(equalToConstant: 53).isActive = true
        button.isEnabled = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let inputStack = InputStack([InputArea(.name), InputArea(.email), InputArea(.password)])
    
    private let toSignInStack = HorizontalStack([
        UILabel(text: "Already have an account?", .title3medium, .textSecondary),
        UIButton(title: "Sign in now", textColor: .purple100, font: .title3medium)
    ], spacing: 2)
    
    private lazy var overallStack = VerticalStack([
        labelsStack, inputStack, bottomStack
    ], spacing: 30)
    
    private lazy var bottomStack = VerticalStack([
        forgotPassword, signUpButton
    ], spacing: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputStack.delegate = self
        setupViews()
        setupGesture()
    }
    
    private func setupGesture() {
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleTap))
        )
    }
    
    @objc private func handleTap() { view.endEditing(true) }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubviews(overallStack, toSignInStack)
        labelsStack.alignment = .center
                
        overallStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        toSignInStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
    }
}
