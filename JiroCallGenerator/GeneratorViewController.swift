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
    
    //ドラムロールの宣言
    // TODO2 4つのtextfieldの位置をレスポンシブにする
    @IBOutlet weak var garlicTextField: UITextField!
    @IBOutlet weak var vegetableTextField: UITextField!
    @IBOutlet weak var porkBackFatTextField: UITextField!
    @IBOutlet weak var soySourceTextField: UITextField!
    
    // 参考記事 https://etolog.jp/archives/pickerview_memo.html
    @IBOutlet weak var garlicPicker: UIPickerView!
    @IBOutlet weak var vegetablePicker: UIPickerView!
    @IBOutlet weak var porkBackFatPicker: UIPickerView!
    @IBOutlet weak var soySourcePicker: UIPickerView!
   
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
    // TODO ドラムロール作るhttps://www.zinbloger.com/2021/05/swiftpickerview2/
    // ドラムロールのリスト
//    var pickerView: UIPickerView = UIPickerView()
//    let list: [String] = ["ニンニク抜き", "ニンニク少なめ", "ニンニク普通", "ニンニク多め", "ニンニク超多め"]
    let garlicList: [String] = ["ニンニク抜き", "ニンニク少なめ", "ニンニク普通", "ニンニク多め", "ニンニク超多め"]
    let vegetableList: [String] = ["ヤサイ少なめ", "ヤサイ普通", "ヤサイ多め", "ヤサイ超多め"]
    let porkBackFatList: [String] = ["背脂抜き", "背脂少なめ", "背脂普通", "背脂多め", "背脂超多め"]
    let soySourceList: [String] = ["味普通", "味濃いめ"]
    //表示するリストの数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //表示する配列の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return garlicList.count
        } else if pickerView.tag == 2{
            return vegetableList.count
        } else if pickerView.tag == 3{
            return porkBackFatList.count
        } else if pickerView.tag == 4{
            return soySourceList.count
        }
    }
    //データを返すメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         
        if pickerView.tag == 1{
            return garlicList[row]
        } else if pickerView.tag == 2{
            return vegetableList[row]
        } else if pickerView.tag == 3{
            return porkBackFatList[row]
        } else if pickerView.tag == 4{
            return soySourceList[row]
        }
    }
    //データ選択時の呼び出しメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
         
    // ボタンを押したときの処理
    // TODO ボタンを押したらコールが出る処理
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ドラムロール実行
//        picker()
        //pickerviewの設定、tagで表示内容を分ける
        garlicPicker.delegate = self
        garlicPicker.dataSource = self
        garlicPicker.tag = 1
        vegetablePicker.delegate = self
        vegetablePicker.dataSource = self
        vegetablePicker.tag = 2
        porkBackFatPicker.delegate = self
        porkBackFatPicker.dataSource = self
        porkBackFatPicker.tag = 3
        soySourcePicker.delegate = self
        soySourcePicker.dataSource = self
        soySourcePicker.tag = 4
        // ボタンの装飾
        let buttonColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        generatorButton.backgroundColor = buttonColor
        generatorButton.layer.borderWidth = 5
        generatorButton.layer.borderColor = UIColor.red.cgColor
        generatorButton.layer.cornerRadius = 5.0
        GachaBtn.backgroundColor = buttonColor
        GachaBtn.layer.cornerRadius = 5.0
        let buttonTextColor = UIColor(red: 247/255, green: 229/255, blue: 4/255, alpha: 1.0)
        GachaBtn.setTitleColor(buttonTextColor, for: UIControl.State.normal)
        //背景色
        view.backgroundColor = buttonTextColor
        //ドラムロール装飾
        garlicTextField.textAlignment = .center
        vegetableTextField.textAlignment = .center
        porkBackFatTextField.textAlignment = .center
        soySourceTextField.textAlignment = .center
    }
    
//    func picker(){
//        // ピッカー設定
//        pickerView.delegate = self
//        pickerView.dataSource = self
//        // 決定・キャンセル用ツールバーの生成
//        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
//        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
//        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
//        toolbar.setItems([cancelItem, spaceItem, doneItem], animated: true)
//        // インプットビュー設定
//        garlicTextField.inputView = pickerView
//        garlicTextField.inputAccessoryView = toolbar
//        // デフォルト設定
//        pickerView.selectRow(0, inComponent: 0, animated: false)
//    }
//    // 決定ボタンのアクション指定
//    @objc func done() {
//        garlicTextField.endEditing(true)
//        garlicTextField.text = "\(list[pickerView.selectedRow(inComponent: 0)])"
//    }
//    // キャンセルボタンのアクション指定
//    @objc func cancel(){
//        garlicTextField.endEditing(true)
//    }
//    // 画面タップでテキストフィールドを閉じる
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        garlicTextField.endEditing(true)
//    }
} //class終了



//// ピッカーの初期設定
//extension GeneratorViewController : UIPickerViewDelegate, UIPickerViewDataSource {
//    // ピッカービューの列数
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    // ピッカービューの行数
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return list.count
//    }
//    // ピッカービューに表示する内容
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return list[row]
//    }
//}
