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
    
    let dialog = UIAlertController(title: "설정", message: "설정에서 권한을 허용해야합니다", preferredStyle: .alert)
    let settingBtn = UIAlertAction(title: "설정하기", style: .default)
    let refuseBtn = UIAlertAction(title: "거절", style: .cancel)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //권한체크
    @IBAction func setPermission(_ sender: UIButton) {
        AVCaptureDevice.requestAccess(for: AVMediaType.video){Bool in
            if Bool == true {
                print("카메라 권한 체크 완료")
            }
        }
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if authStatus == AVAuthorizationStatus.authorized {
            print("이미 허용이 되어있음")
        } else {
            print("허용 안되어있음")
        }
    }
    
}
