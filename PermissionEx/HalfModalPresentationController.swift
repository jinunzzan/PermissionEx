//
//  HalfModalPresentationController.swift
//  3DAnimation
//
//  Created by Snuh_Mobile on 2023/06/01.
//
import Foundation
import UIKit

class HalfModalPresentationController: UIViewController {
    
    @IBOutlet weak var negativeButton: UIButton!
    
    @IBOutlet weak var positiveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSet()
    }
    func buttonSet(){
        negativeButton.layer.borderColor = UIColor.systemGray5.cgColor
        negativeButton.layer.borderWidth = 1
        negativeButton.addAction(UIAction(handler: { _ in
            self.dismiss(animated: true){
//                self.dismissTopViewController()
            }
        }), for: .touchUpInside)
    }
}
