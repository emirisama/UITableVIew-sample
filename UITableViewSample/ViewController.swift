//
//  ViewController.swift
//  UITableViewSample
//
//  Created by 中森えみり on 2021/01/29.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var textArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }

    //ナビゲーションバーを出す
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
        
    }
    
    
    //セクションの中のセルの数を確認
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
        
    }

    
    //セクションの数を確認
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    //セルを返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //セルを構築させる
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let label = cell.contentView.viewWithTag(2) as! UILabel
        
        //row番目の配列を入れる    //？は、？の右以降を実行しない(もし値が入っていなかったら先に進んではいけませんよ）
        label.text = textArray[indexPath.row]
 
        
        //セルのハイライトを消す
        cell.selectionStyle = .none

        
        return cell
        
    }
    
    //セルをタップしたときにその配列の番号の中身を取り出して、値を渡す
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //タップした番号に保存されている配列の中身(indexPathのrowはrow番目という意味。textArrayの番号と一致する）
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        nextVC.tweetString = textArray[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height/6
        
    }
    

    
    
    
    @IBAction func tap(_ sender: Any) {
        
        textArray.append(textField.text!)
        textField.text = ""
        tableView.reloadData()
    }
    

}

