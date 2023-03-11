//
//  ForgotPasswordController.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

final class ForgotPasswordController: UIViewController, InputStackDelegate, AlertSheetDelegate {
    func didTapButton() {
        let loginVC = LoginController()
        loginVC.modalTransitionStyle = .flipHorizontal
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
    
    func didValidForm() {
        resetButton.isEnabled = true
    }
    
    func didInvalidForm() {
        resetButton.isEnabled = false
    }

    private let labelsStack = VerticalStack([
        UILabel(text: "Forgot Password?", .title1, .textPrimary, alignment: .center),
        UILabel(text: "Confirm your email and we'll send the instructions.", .title3, .textSecondary, alignment: .center, nLines: 0)
    ], spacing: 16)
    
    private let inputStack = InputStack([InputArea(.email)])

    private let resetButton: CustomButton = {
        let button = CustomButton(title: "Reset Password")
        button.heightAnchor.constraint(equalToConstant: 53).isActive = true
        button.isEnabled = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var overallStack = VerticalStack([
        labelsStack, inputStack, resetButton
    ], spacing: 24)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        inputStack.delegate = self
        inputStack.resultArray[.name] = true
        inputStack.resultArray[.password] = true
        resetButton.addTarget(self, action: #selector(handleResetButton), for: .touchUpInside)
        labelsStack.alignment = .center
        setupViews()
        alertSheet.delegate = self
    }
    
    let alertSheet = AlertSheetController()
    let dividerView = UIView()
    
    @objc private func handleResetButton() {
        let topLayer = UIView()
        
        view.addSubview(topLayer)
        topLayer.frame = view.bounds
        topLayer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3953056167)
        
        view.addSubview(dividerView)
        dividerView.backgroundColor = .white
        dividerView.layer.cornerRadius = 3
        dividerView.frame = .init(x: view.center.x - 40, y: view.frame.size.height - 8, width: 80, height: 4)
        
        view.addSubview(alertSheet.view)
        alertSheet.view.frame = .init(x: 0, y: view.frame.size.height, width: view.frame.size.width, height: 400)
        alertSheet.view.layer.cornerRadius = 36
        alertSheet.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        UIView.animate(withDuration: 0.4) {
            self.alertSheet.view.transform = .init(translationX: 0, y: -400)
            self.dividerView.transform = .init(translationX: 0, y: -400)
        }
        yFrame = view.frame.size.height - 400
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        alertSheet.view.addGestureRecognizer(panGesture)
    }
    
    var yFrame: CGFloat?
    var isAnimating = false
    var timer: Timer?
    
    @objc private func handlePan(gesture: UIPanGestureRecognizer) {
        guard !isAnimating else { return }
        let translation = gesture.translation(in: view).y
        
        
        if translation > 0 {
            alertSheet.view.frame = .init(x: 0, y: yFrame! + gesture.translation(in: view).y, width: view.frame.size.width, height: 400)
            dividerView.frame = .init(x: view.center.x - 40, y: yFrame! + gesture.translation(in: view).y - 8, width: 80, height: 4)
            timer?.invalidate()
            if gesture.state == .ended && translation <= 200 {
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { _ in
                    print("called 2")
                    UIView.animate(withDuration: 0.1) {
                        self.alertSheet.view.frame = .init(x: 0, y: self.yFrame!, width: self.view.frame.size.width, height: 400)
                        self.dividerView.frame = .init(x: self.view.center.x - 40, y: self.yFrame! - 8, width: 80, height: 4)
                    }
                })
            }
        }
        
        if translation > 200 {
            if gesture.state == .ended {
                print("called")
                isAnimating = true
                UIView.animate(withDuration: 0.3) {
                    self.alertSheet.view.transform = .identity
                    self.dividerView.transform = .identity
                } completion: { _ in
                    self.alertSheet.view.removeFromSuperview()
                    self.dividerView.removeFromSuperview()
                    self.view.subviews.last?.removeFromSuperview()
                    self.isAnimating = false
                }
            }
        }
    }
    
    private func setupViews() {
        view.addSubview(overallStack)
        
        overallStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }

}
