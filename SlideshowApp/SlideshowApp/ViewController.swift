//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山本翔太郎 on 2021/05/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Zoom: UIButton!
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // segueから遷移先のResultViewControllerを取得する
           let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
           // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        zoomViewController.zoomimage = Zoom.imageView?.image
       }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
     }
    

}

