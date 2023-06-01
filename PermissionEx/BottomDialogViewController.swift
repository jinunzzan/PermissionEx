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
    override func viewDidDisappear(_ animated: Bool) {
        
//  dismiss(animated: false) navigationController?.popViewController(animated: true)
      
        print("하단팝업 내려갔음")
        dismissTopViewController()
        printTopViewController()
      
    }
    override func viewWillDisappear(_ animated: Bool) {

    }
    
    func printTopViewController() {
        var topVC = UIApplication.shared.keyWindow?.rootViewController
        while let presentedVC = topVC?.presentedViewController {
            topVC = presentedVC
        }
        if let topViewController = topVC {
            print("Top View Controller: \(topViewController)")
        } else {
            print("Top View Controller not found")
        }
    }
    
    func dismissTopViewController() {
        var topVC = UIApplication.shared.keyWindow?.rootViewController
//        while let presentedVC = topVC?.presentedViewController {
//            topVC = presentedVC
//        }
        if let topViewController = topVC {
            topViewController.dismiss(animated: false, completion: nil)
            print("d아니오버튼클릭하고 탑뷰닫을대")
        }
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
    func goToRootView(){
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        self.dismiss(animated: true) {
            presentingVC.popToRootViewController(animated: true)
        }
    }

}
