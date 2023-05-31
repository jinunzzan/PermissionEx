//
//  ViewController.swift
//  PermissionEx
//
//  Created by Eunchan Kim on 2023/05/31.
//

import UIKit
import Photos
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //권한체크
    @IBAction func setPermission(_ sender: UIButton) {
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        //최초 권한요청 시스템 알럿창
        if authStatus == .notDetermined {
            AVCaptureDevice.requestAccess(for: AVMediaType.video){ response in
                if response {
                    print("허용되었음")
                } else {
                    print("허용하지않음")
                }
            }
        }
        else if authStatus == AVAuthorizationStatus.authorized {
            print("권한 설정 허용 상태")
        } else {
            print("권한 설정 거부 상태")
            let alert = UIAlertController(title: "설정에서 권한을 허용해야 합니다", message: "", preferredStyle: .alert)
            let settingBtn = UIAlertAction(title: "설정하기", style: .default, handler: { _ in
                if (UIApplication.shared.canOpenURL(URL(string: UIApplication.openSettingsURLString)!)){
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }
            })
            alert.addAction(settingBtn)
            let refuseBtn = UIAlertAction(title: "거절", style: .destructive)
            alert.addAction(refuseBtn)
            present(alert, animated: true, completion: nil)
            print("alert 표시")
            
        }
    }
    
}
