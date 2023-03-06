//
//  RegisterController.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

final class RegisterController: UIViewController {

    private let inputStack = VerticalStack([
        InputArea(.name),
        InputArea(.email),
        InputArea(.password)
    ])

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        view.addSubview(inputStack)
        
        inputStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
        }
    }
}
