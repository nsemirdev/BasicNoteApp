//
//  InputStack.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

final class InputStack: VerticalStack, InputAreaDelegate {
    
    var delegate: InputStackDelegate?
    
    var resultArray: [InputView.`Type`: Bool] = [
        .name: false,
        .email: false,
        .password: false
    ] {
        didSet {
            if Array(resultArray.values) == [true, true, true] {
                delegate?.didValidForm()
            } else {
                delegate?.didInvalidForm()
            }
        }
    }
    
    func didValidSelectionOf(type: InputView.`Type`) {
        resultArray[type] = true
    }
    
    func didInvalidSelectionOf(type: InputView.`Type`) {
        resultArray[type] = false
    }
    
    convenience init(_ arrangedSubviews: [InputArea]) {
        self.init(arrangedSubviews, spacing: 16)
        
        arrangedSubviews.forEach {
            $0.delegate = self
            
        }
//        inputStack.subviews.forEach {
        //            $0.snp.makeConstraints { make in
        //                make.width.equalTo(view.frame.size.width - 48)
        //            }
        //        }
    }
}
