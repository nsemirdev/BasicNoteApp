//
//  InputAreaDelegate.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import Foundation

protocol InputAreaDelegate {
    func didValidSelectionOf(type: InputView.`Type`)
    func didInvalidSelectionOf(type: InputView.`Type`)
}
