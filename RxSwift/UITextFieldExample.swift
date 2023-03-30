//
//  ViewController.swift
//  UITextFieldExample
//
//  Created by 장효원 on 2023/03/30.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         textField가 입력될 때마다 옵셔녈을 언래핑 시키고,
         $0.count > 0 로 true or false 값을 구하고나서,
         위에서 구한 Bool 값을 통해 button의 isEnabled를 설정합니다.
         */
        textField.rx.text
            .map { $0 ?? "" }
            .map { $0.count > 0 }
            .bind(to: button.rx.isEnabled)
            .disposed(by: disposeBag)
    }


}

