//
//  ViewController.swift
//  SecondKadaiApp
//
//  Created by 山本翔太郎 on 2021/05/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // segueから遷移先のResultViewControllerを取得する
           let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        
        resultViewController.x = textField.text!

           func unwind(_ segue: UIStoryboardSegue) {
     }
}

}
