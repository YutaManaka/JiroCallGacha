//
//  GeneratorViewController.swift
//  JiroCallGenerator
//
//  Created by 勇太_物販 on 2021/07/29.
//

import UIKit

class GeneratorViewController: UIViewController {
    //ボタンの宣言
    @IBOutlet weak var generatorButton: UIButton!
    @IBOutlet weak var GachaBtn: UIButton!
   
    //遷移ボタン
    @IBAction func tapGachaBtn(_ sender: Any) {
        // Storyboardのインスタンスを名前指定で取得する
        let storyboard = UIStoryboard(name: "GachaView", bundle: nil)
        // Storyboard内で'is initial'に指定されているViewControllerを取得する
        let nextVC = storyboard.instantiateInitialViewController() as! GachaViewController
        // FullScreenにする
        nextVC.modalPresentationStyle = .fullScreen
        // presentする
        self.present(nextVC, animated: true, completion: nil)
    }
    
    // ボタンを押したときの処理
    // TODO https://www.zinbloger.com/2021/05/swiftpickerview2/
    // TODO2 4つのtextfieldの位置をレスポンシブにする
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ボタンの装飾
        let buttonColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        generatorButton.backgroundColor = buttonColor
        generatorButton.layer.borderWidth = 5
        generatorButton.layer.borderColor = UIColor.red.cgColor
        generatorButton.layer.cornerRadius = 5.0
        GachaBtn.backgroundColor = buttonColor
    //        GeneratorBtn.layer.borderWidth = 5
    //        GeneratorBtn.layer.borderColor = UIColor.red.cgColor
        GachaBtn.layer.cornerRadius = 5.0
        let buttonTextColor = UIColor(red: 247/255, green: 229/255, blue: 4/255, alpha: 1.0)
        GachaBtn.setTitleColor(buttonTextColor, for: UIControl.State.normal)
        //背景色
        view.backgroundColor = buttonTextColor
        }
}
