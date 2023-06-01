//
//  BottomDialogViewController.swift
//  PermissionEx
//
//  Created by Eunchan Kim on 2023/06/01.
//


import UIKit

class BottomDialogViewController: UIViewController {
    
    @IBOutlet weak var negativeButton: UIButton!
    @IBOutlet weak var positiveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonSet()

    }
    
    
    func buttonSet(){
        negativeButton.layer.borderColor = UIColor.systemGray5.cgColor
        negativeButton.layer.borderWidth = 1
        negativeButton.addAction(UIAction(handler: { _ in
            self.dismiss(animated: true)
        }), for: .touchUpInside)
    }
  
}
