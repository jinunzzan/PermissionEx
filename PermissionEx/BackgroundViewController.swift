//
//  BackgroundViewController.swift
//  PermissionEx
//
//  Created by Eunchan Kim on 2023/06/01.
//

import UIKit

class BackgroundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestureRecognizers()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "BottomDialogViewController") as! BottomDialogViewController
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
    }

    private func setupGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        if gesture.state == .ended {
            dismiss(animated: false, completion: nil)
        }
    }
}
