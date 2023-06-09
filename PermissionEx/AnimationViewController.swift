//
//  AnimationViewController.swift
//  PermissionEx
//
//  Created by Eunchan Kim on 2023/06/01.
//

import UIKit

class AnimationViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var negativeButton: UIButton!
    @IBOutlet weak var positiveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.isHidden = true
        let touchOutSide = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        backView.addGestureRecognizer(touchOutSide)
    }
    override func viewDidAppear(_ animated: Bool) {
        viewAppear()
        
    }
    func viewAppear(){
        bottomView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, animations: { () -> Void in
            self.bottomView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 350)
        },
                       completion: { (didFinish) -> Void in
            
            self.buttonSet()
        })
        
    }
    func viewDisppear(){
        UIView.animate(withDuration: 0.2, delay: 0, animations: { [weak self] in
            guard let self = self else { return }
            let screenHeight = UIScreen.main.bounds.height
            self.bottomView.frame = CGRect(x: 0, y: screenHeight, width: self.bottomView.frame.width, height: self.bottomView.frame.height)
        }, completion: { (didFinish) -> Void in
            self.bottomView.isHidden = true
            self.dismiss(animated: false)
        })
    }
    func buttonSet(){
        negativeButton.layer.borderColor = UIColor.systemGray5.cgColor
        negativeButton.layer.borderWidth = 1
        negativeButton.addAction(UIAction(handler: { _ in
            self.viewDisppear()
        }), for: .touchUpInside)
    }
    //outsideTouch
    @objc func viewTapped() {
        self.viewDisppear()
    }

}
