//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山本翔太郎 on 2021/05/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Zoom: UIButton!
    @IBOutlet weak var PlayPause: UIButton!
    @IBOutlet weak var Move: UIButton!
    @IBOutlet weak var Back: UIButton!
    
    var timer: Timer!
    var timer_sec: Float = 0
    var viewNumber = 0
    
    var imageArray: [UIImage] = [
        UIImage(named: "PublicPark")!,
        UIImage(named: "River")!,
        UIImage(named: "WaxWoman")!
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // segueから遷移先のResultViewControllerを取得する
           let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
           // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        zoomViewController.zoomimage = Zoom.imageView?.image
       }
    
    @IBAction func Move(_ sender: Any) {
        if viewNumber == 2 {
            viewNumber = 0
        } else {
            viewNumber = viewNumber + 1
        }
        // indexの画像をstoryboardの画像にセットする
      Zoom.setImage(imageArray[viewNumber], for: .normal)
    }

    @IBAction func PlayPause(_ sender: Any) {
        // 再生中か停止しているかを判定
              if (timer == nil) {
                  // タイマーをセットする
                  timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
              } else {
                  // 停止時の処理を実装
                  // タイマーを停止する
                  timer.invalidate()
                  // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
                  timer = nil
              }
    }

          @objc func changeImage() {
              // indexを増やして表示する画像を切り替える
              viewNumber += 1

              // indexが表示予定の画像の数と同じ場合
              if (viewNumber == imageArray.count) {
                  // indexを一番最初の数字に戻す
                  viewNumber = 0
              }
              // indexの画像をstoryboardの画像にセットする
            Zoom.setImage(imageArray[viewNumber], for: .normal)
          }
    
    @IBAction func Back(_ sender: Any) {
        if viewNumber == 0 {
            viewNumber = 2
        } else {
            viewNumber = viewNumber - 1
        }
        // indexの画像をstoryboardの画像にセットする
      Zoom.setImage(imageArray[viewNumber], for: .normal)
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
     }
}


    

