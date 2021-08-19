//
//  FirstController.swift
//  JiroCallGenerator
//
//  Created by 勇太_物販 on 2021/07/29.
//

import UIKit

class FirstViewController: UIViewController {
    // ボタン宣言
    @IBOutlet weak var gachaLink: UIButton!
    @IBOutlet weak var generatorLink: UIButton!
    // ガチャするボタン
    @IBAction func tapGachaLink(_ sender: Any) {
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
    @IBAction func tapGeneratorLink(_ sender: Any) {
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
        gachaLink.backgroundColor = buttonColor
        gachaLink.layer.borderWidth = 5
        gachaLink.layer.borderColor = UIColor.red.cgColor
        gachaLink.layer.cornerRadius = 5.0
        generatorLink.backgroundColor = buttonColor
        generatorLink.layer.borderWidth = 5
        generatorLink.layer.borderColor = UIColor.red.cgColor
        generatorLink.layer.cornerRadius = 5.0
        let buttonTextColor = UIColor(red: 247/255, green: 229/255, blue: 4/255, alpha: 1.0)
        gachaLink.setTitleColor(buttonTextColor, for: UIControl.State.normal)
        generatorLink.setTitleColor(buttonTextColor, for: UIControl.State.normal)
        //テキストの装飾
        UILabel.appearance().textAlignment = NSTextAlignment.center
        UILabel.appearance().font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        UILabel.appearance().textColor = UIColor.black
        //背景色
        view.backgroundColor = buttonTextColor
        }
    
}
