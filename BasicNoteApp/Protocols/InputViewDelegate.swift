//
//  InputViewDelegate.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import UIKit

protocol InputViewDelegate {
    func didInvalidSelection(with type: InputView.`Type`)
    func didValidSelection(with type: InputView.`Type`)
}
