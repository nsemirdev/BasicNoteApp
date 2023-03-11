//
//  HelperFunctions.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 11.03.2023.
//

import UIKit

func presentVC(from vc1: UIViewController, to vc2: UIViewController) {
    vc2.modalPresentationStyle = .fullScreen
    vc2.modalTransitionStyle = .flipHorizontal
    vc1.present(vc2, animated: true)
}
