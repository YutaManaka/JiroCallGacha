//
//  ViewController.swift
//  JiroCallGenerator
//
//  Created by Yuta Manaka on 2021/07/23.
//

import UIKit

class GachaViewController: UIViewController {
    //ボタンの宣言
    @IBOutlet weak var gachaButton: UIButton!
    @IBOutlet weak var generatorLink: UIButton!
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

    // gachaButtonボタンを押した際の操作
    @IBAction func garlic(_ sender: Any) {
        garlicNumber = Int(arc4random_uniform(5))
        
        switch garlicNumber {
            case 1, 2, 3, 4:
                garlicText.text = AppConstants.gachaGarlic[garlicNumber]
                garlicText.isHidden = false
            default:
                garlicText.text = ""
                garlicText.isHidden = true
        }
        vegetableNumber = Int(arc4random_uniform(4))
        switch vegetableNumber {
            case 1, 2, 3:
                vegetableText.text = AppConstants.gachaVegetable[vegetableNumber]
                vegetableText.isHidden = false
            default:
                vegetableText.text = ""
                vegetableText.isHidden = true
        }
        porkBackFatNumber = Int(arc4random_uniform(5))
        switch porkBackFatNumber {
            case 1, 2, 3, 4:
                porkBackFatText.text = AppConstants.gachaPorkBackFat[porkBackFatNumber]
                porkBackFatText.isHidden = false
            default:
                porkBackFatText.text = ""
                porkBackFatText.isHidden = true
        }
        soySouceNumber = Int(arc4random_uniform(2))
        switch soySouceNumber {
            case 1:
                soySourceText.text = AppConstants.gachaSoySouce[soySouceNumber]
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
    
    //遷移ボタンgeneratorLinkを押したときの動作
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
        gachaButton.backgroundColor = buttonColor
        gachaButton.layer.borderWidth = 5
        gachaButton.layer.borderColor = UIColor.red.cgColor
        gachaButton.layer.cornerRadius = 5.0
        generatorLink.backgroundColor = buttonColor
        generatorLink.layer.cornerRadius = 5.0
        let buttonTextColor = UIColor(red: 247/255, green: 229/255, blue: 4/255, alpha: 1.0)
        gachaButton.setTitleColor(buttonTextColor, for: UIControl.State.normal)
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
