//
//  FirstController.swift
//  JiroCallGenerator
//
//  Created by 勇太_物販 on 2021/07/29.
//

import UIKit

class FirstViewController: UIViewController {
    // ボタン宣言
    @IBOutlet weak var GachaBtn: UIButton!
    @IBOutlet weak var GeneratorBtn: UIButton!
    // ガチャするボタン
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
    // 自分で作るボタン
    @IBAction func tapGeneratorBtn(_ sender: Any) {
        // Storyboardのインスタンスを名前指定で取得する
        let storyboard = UIStoryboard(name: "GeneratorView", bundle: nil)
        // Storyboard内で'is initial'に指定されているViewControllerを取得する
        let nextVC = storyboard.instantiateInitialViewController() as! GeneratorViewController
        // FullScreenにする
        nextVC.modalPresentationStyle = .fullScreen
        // presentする
        self.present(nextVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ボタンの装飾
        let buttonColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        GachaBtn.backgroundColor = buttonColor
        GachaBtn.layer.borderWidth = 5
        GachaBtn.layer.borderColor = UIColor.red.cgColor
        GachaBtn.layer.cornerRadius = 5.0
        GeneratorBtn.backgroundColor = buttonColor
        GeneratorBtn.layer.borderWidth = 5
        GeneratorBtn.layer.borderColor = UIColor.red.cgColor
        GeneratorBtn.layer.cornerRadius = 5.0
        let buttonTextColor = UIColor(red: 247/255, green: 229/255, blue: 4/255, alpha: 1.0)
        GachaBtn.setTitleColor(buttonTextColor, for: UIControl.State.normal)
        GeneratorBtn.setTitleColor(buttonTextColor, for: UIControl.State.normal)
        //テキストの装飾
        UILabel.appearance().textAlignment = NSTextAlignment.center
        UILabel.appearance().font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        UILabel.appearance().textColor = UIColor.black
        //背景色
        view.backgroundColor = buttonTextColor
        }
    
}
