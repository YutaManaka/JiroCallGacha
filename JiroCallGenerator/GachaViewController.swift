//
//  ViewController.swift
//  JiroCallGenerator
//
//  Created by Yuta Manaka on 2021/07/23.
//

import UIKit

class GachaViewController: UIViewController {
    //ボタンの宣言
    @IBOutlet weak var gacyaButton: UIButton!
    @IBOutlet weak var GeneratorBtn: UIButton!
    // 乱数の宣言
    var garlicNumber = 0
    var vegetableNumber = 0
    var porkBackFatNumber = 0
    var soySouceNumber = 0
    // Labelの宣言
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var garlicText: UILabel!
    @IBOutlet weak var vegetableText: UILabel!
    @IBOutlet weak var porkBackFatText: UILabel!
    @IBOutlet weak var soySourceText: UILabel!
    @IBOutlet weak var normal: UILabel!
    //その他パーツ宣言
    @IBOutlet weak var stackSpace: UIView!
    @IBOutlet weak var space: UIView!
    @IBOutlet weak var space2: UIView!
    @IBOutlet weak var space3: UIView!

    // gacyaButtonボタンを押した際の操作
    @IBAction func garlic(_ sender: Any) {
        garlicNumber = Int(arc4random_uniform(5))
        switch garlicNumber {
            case 1:
                garlicText.text = "ニンニクヌキ"
                garlicText.isHidden = false
            case 2:
                garlicText.text = "ニンニクスクナメ"
                garlicText.isHidden = false
            case 3:
                garlicText.text = "ニンニクマシ"
                garlicText.isHidden = false
            case 4:
                garlicText.text = "ニンニクマシマシ"
                garlicText.isHidden = false
            default:
                garlicText.text = ""
                garlicText.isHidden = true
        }
        vegetableNumber = Int(arc4random_uniform(4))
        switch vegetableNumber {
            case 1:
                vegetableText.text = "ヤサイスクナメ"
                vegetableText.isHidden = false
            case 2:
                vegetableText.text = "ヤサイマシ"
                vegetableText.isHidden = false
            case 3:
                vegetableText.text = "ヤサイマシマシ"
                vegetableText.isHidden = false
            default:
                vegetableText.text = ""
                vegetableText.isHidden = true
        }
        porkBackFatNumber = Int(arc4random_uniform(5))
        switch porkBackFatNumber {
            case 1:
                porkBackFatText.text = "アブラヌキ"
                porkBackFatText.isHidden = false
            case 2:
                porkBackFatText.text = "アブラスクナメ"
                porkBackFatText.isHidden = false
            case 3:
                porkBackFatText.text = "アブラマシ"
                porkBackFatText.isHidden = false
            case 4:
                porkBackFatText.text = "アブラマシマシ"
                porkBackFatText.isHidden = false
            default:
                porkBackFatText.text = ""
                porkBackFatText.isHidden = true
        }
        soySouceNumber = Int(arc4random_uniform(2))
        switch soySouceNumber {
            case 1:
                soySourceText.text = "カラメ"
                soySourceText.isHidden = false
            default:
                soySourceText.text = ""
                soySourceText.isHidden = true
        }
        //フツウの表示/非表示
        if (garlicNumber == 0 && vegetableNumber == 0 && porkBackFatNumber == 0 && soySouceNumber == 0) {
            normal.isHidden = false
        } else {
            normal.isHidden = true
        }
    }
    
    //遷移ボタンGeneratorBtnを押したときの動作
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
        gacyaButton.backgroundColor = buttonColor
        gacyaButton.layer.borderWidth = 5
        gacyaButton.layer.borderColor = UIColor.red.cgColor
        gacyaButton.layer.cornerRadius = 5.0
        GeneratorBtn.backgroundColor = buttonColor
        GeneratorBtn.layer.cornerRadius = 5.0
        let buttonTextColor = UIColor(red: 247/255, green: 229/255, blue: 4/255, alpha: 1.0)
        gacyaButton.setTitleColor(buttonTextColor, for: UIControl.State.normal)
        //テキストの装飾
        UILabel.appearance().textAlignment = NSTextAlignment.center
        UILabel.appearance().font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        UILabel.appearance().textColor = UIColor.black
        //背景色
        view.backgroundColor = buttonTextColor
        stackSpace.backgroundColor = buttonTextColor
        space.backgroundColor = buttonTextColor
        space2.backgroundColor = buttonTextColor
        space3.backgroundColor = buttonTextColor
    }
}
