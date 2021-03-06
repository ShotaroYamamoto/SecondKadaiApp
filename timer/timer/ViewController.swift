//
//  ViewController.swift
//  timer
//
//  Created by 山本翔太郎 on 2021/05/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    // タイマー
    var timer: Timer!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // selector: #selector(updatetimer(_:))で指定された関数
    //timeInterval: 0.1, repeats: trueで指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
           self.timer_sec += 0.1
           self.timerLabel.text = String(format: "%.1f", self.timer_sec)
       }
    
    // 再生ボタン　IBAction
    @IBAction func startTimer(_ sender: Any) {
        // 動作中のタイマーを１つに保つために、timerが存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
    }
    
    // 一時停止ボタン　IBAction
    @IBAction func pauseTimer(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate() // タイマーを停止する
            self.timer = nil // startTimer()のself.timer == nilで判断するために、self.timer = nilとしておく
        }
    }
    
    // リセットボタン　IBAction
    @IBAction func resetTimer(_ sender: Any) {
        // リセットボタンを押すと、タイマーの時間を0に
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1F", self.timer_sec)
        
        if self.timer != nil{
            self.timer.invalidate() // タイマーを停止する
            self.timer = nil // startTimer()のself.timer == nilで判断するために、self.timer = nilとしておく
        }
    }


}

