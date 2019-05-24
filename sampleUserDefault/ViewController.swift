//
//  ViewController.swift
//  sampleUserDefault
//
//  Created by 片平駿介 on 2019/05/21.
//  Copyright © 2019 ShunsukeKatahira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    // 背景色の選択肢を保持
    // 0:白
    // 1:薄いグレイ
    // 2:濃いグレイ
    var colorOpt = 0
    
    // 画面が読み込まれた後に実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefault = UserDefaults.standard
        colorOpt = userDefault.integer(forKey: "colorOpt")
        // 値を読み込んだ後にその設定を反映させる
        changeBgColor()
        changeLabel()
    }
    @IBAction func didClickBtn(_ sender: Any) {
        colorOpt = colorOpt == 2 ? 0 : colorOpt + 1
        changeBgColor()
        changeLabel()
        
        // UserDefault
        // アプリごとの設定値を保存する機能
        // キーバリュー形式で値を保持する
        // アプリのプロセスを落としても値は保持されたまま
        let userrDefault = UserDefaults.standard
        userrDefault.set(colorOpt, forKey: "colorOpt")
    }
    
    // 背景色を変える関数
    func changeBgColor() {
        switch colorOpt {
        case 1:
            view.backgroundColor = .lightGray
        case 2:
            view.backgroundColor = .darkGray
        default:
            view.backgroundColor = .white
        }
    }
    
    // ラベルを変える関数
    func changeLabel() {
        switch colorOpt {
        case 1:
            label.text = "LightGray"
        case 2:
            label.text = "DarkGray"
        default:
            label.text = "White"
        }
    }

}

