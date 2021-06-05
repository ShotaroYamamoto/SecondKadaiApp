//
//  ResultViewController.swift
//  SecondKadaiApp
//
//  Created by 山本翔太郎 on 2021/05/26.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 2画面目のLabelを、StoryboardでこのViewControllerにIBOutletとして接続しておく
    @IBOutlet weak var label: UILabel!

    // 受け取るためのプロパティ（変数）を宣言しておく
    var x:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        
        label.text = "こんにちは\(x)さん"
    }
    
}
