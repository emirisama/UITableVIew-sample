//
//  NextViewController.swift
//  UITableViewSample
//
//  Created by 中森えみり on 2021/01/29.
//

import UIKit

class NextViewController: UIViewController {

    
    var tweetString = String()
    @IBOutlet weak var tweetLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetLabel.text = tweetString
    }
    
    
    //ナビゲーションバーを隠す
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = false
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
