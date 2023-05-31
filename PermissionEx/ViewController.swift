//
//  ViewController.swift
//  PermissionEx
//
//  Created by Eunchan Kim on 2023/05/31.
//

import UIKit
import Photos
import AVFoundation
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //권한체크
    @IBAction func setPermission(_ sender: UIButton) {
        //23.05.31 김은찬
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
            //alert 함수 사용해서 간소화
            alert(title: "설정에서 권한을 허용해야 합니다", message: "", okTitle: "설정하기", okHandler: { _ in if (UIApplication.shared.canOpenURL(URL(string: UIApplication.openSettingsURLString)!)){UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)}}, cancelTitle: "거절", cancelHandler: { _ in print("거절버튼 클릭") })
            
            
        }
        
        //        //최초 권한요청 시스템 알럿창
        //        if authStatus == .notDetermined {
        //            AVCaptureDevice.requestAccess(for: AVMediaType.video){ response in
        //                if response {
        //                    print("허용되었음")
        //                } else {
        //                    print("허용하지않음")
        //                }
        //            }
        //        }
        //        else if authStatus == AVAuthorizationStatus.authorized {
        //            print("권한 설정 허용 상태")
        //        } else {
        //            print("권한 설정 거부 상태")
        //            let alert = UIAlertController(title: "설정에서 권한을 허용해야 합니다", message: "", preferredStyle: .alert)
        //            let settingBtn = UIAlertAction(title: "설정하기", style: .default, handler: { _ in
        //                if (UIApplication.shared.canOpenURL(URL(string: UIApplication.openSettingsURLString)!)){
        //                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        //                }
        //            })
        //            alert.addAction(settingBtn)
        //            let refuseBtn = UIAlertAction(title: "거절", style: .destructive)
        //            alert.addAction(refuseBtn)
        //            present(alert, animated: true, completion: nil)
        //            print("alert 표시")
        //
        //        }
        //    }
        
    }
    
    @IBAction func showActionSheet(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let customViewController = UIViewController()
//        customViewController.view.backgroundColor = UIColor.black
       
        //뷰높이 설정
        let viewHeight:CGFloat = 160.0
        customViewController.view.snp.makeConstraints{make in
            make.height.equalTo(viewHeight)
        }
        //라벨 생성
        let label = UILabel()
        let text = "해당 앱을\n종료하시겠습니까?"
        label.text = text
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        //행간 설정
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        // 속성 문자열 생성
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        label.attributedText = attributedText
        //뷰에 라벨추가
        customViewController.view.addSubview(label)
        //라벨 오토레이아웃
        label.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview()
        }
        
        //버튼생성
        //아니오버튼
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("아니오", for: .normal)
        cancelButton.setTitleColor(.darkGray, for: .normal)
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor.systemGray4.cgColor
        cancelButton.layer.cornerRadius = 8
        cancelButton.addAction(UIAction(handler: { _ in
            // 여기에 버튼이 눌렸을 때 수행할 동작을 추가합니다.
            self.dismiss(animated: true, completion: nil)
        }), for: .touchUpInside)
        
        //종료하기 버튼
        let appFinishButton = UIButton(type: .system)
        appFinishButton.setTitle("종료하기", for: .normal)
        appFinishButton.backgroundColor = UIColor(red: 79/255, green: 175/255, blue: 166/255, alpha: 1) // RGB #4FAFA6
        appFinishButton.setTitleColor(.white, for: .normal)
        appFinishButton.layer.cornerRadius = 8
        appFinishButton.addAction(UIAction(handler: { _ in
            // 여기에 버튼이 눌렸을 때 수행할 동작을 추가합니다.
           print("앱 종료하기")
        }), for: .touchUpInside)
        
        //슈퍼뷰에 버튼 추가
        customViewController.view.addSubview(cancelButton)
        customViewController.view.addSubview(appFinishButton)
        
        //취소 버튼 제약조건
        cancelButton.snp.makeConstraints{ make in
            make.leading.equalTo(label)
            make.top.equalTo(label.snp.bottom).offset(24)
            make.width.equalTo(110)
            make.height.equalTo(50)
        }
        //종료하기 버튼 제약조건
        appFinishButton.snp.makeConstraints{ make in
            make.leading.equalTo(cancelButton.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-24).priority(.high)
            make.height.equalTo(50)
            make.top.equalTo(label.snp.bottom).offset(24)
            make.top.equalTo(label.snp.bottom).offset(24)
        }
        
        alert.setValue(customViewController, forKey: "contentViewController")
        present(alert, animated: true)
    }

}
