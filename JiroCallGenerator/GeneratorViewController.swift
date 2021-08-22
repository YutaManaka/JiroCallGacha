//
//  GeneratorViewController.swift
//  JiroCallGenerator
//
//  Created by 勇太_物販 on 2021/07/29.
//

import UIKit

class GeneratorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // ラベルの宣言
    @IBOutlet weak var callText: UILabel!
    var garlicText = ""
    var vegetableText = ""
    var porkBackFatText = ""
    var soySourceText = ""
    
    // ボタンの宣言
    @IBOutlet weak var generatorButton: UIButton!
    @IBOutlet weak var gachaLink: UIButton!
    
    // その他パーツ宣言
    @IBOutlet weak var textsView: UIView!
    @IBOutlet weak var space: UIView!
    @IBOutlet weak var space2: UIView!
    @IBOutlet weak var space3: UIView!
    @IBOutlet weak var inputSpace: UIView!
    @IBOutlet weak var inputSpace2: UIView!
    @IBOutlet weak var inputSpace3: UIView!
    
    
    // ドラムロールの宣言
    // TODO2 4つのtextfieldの位置をレスポンシブにする
    @IBOutlet weak var garlicTextField: UITextField!
    @IBOutlet weak var vegetableTextField: UITextField!
    @IBOutlet weak var porkBackFatTextField: UITextField!
    @IBOutlet weak var soySourceTextField: UITextField!
    
    // ドラムロール設定
    // ドラムロールのリスト
    var garlicPickerView = UIPickerView()
    var vegetablePickerView = UIPickerView()
    var porkBackFatPickerView = UIPickerView()
    var soySourcePickerView = UIPickerView()

    var pickerNum = 0
    
    // ドラムロールの動作
    func picker(){
        // 決定・キャンセル用ツールバーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        toolbar.setItems([cancelItem, spaceItem, doneItem], animated: true)

        // インプットビュー設定
        garlicTextField.inputView = garlicPickerView
        garlicTextField.inputAccessoryView = toolbar
        vegetableTextField.inputView = vegetablePickerView
        vegetableTextField.inputAccessoryView = toolbar
        porkBackFatTextField.inputView = porkBackFatPickerView
        porkBackFatTextField.inputAccessoryView = toolbar
        soySourceTextField.inputView = soySourcePickerView
        soySourceTextField.inputAccessoryView = toolbar
    }
    
    // ピッカービューの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // ピッカービューの行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AppConstants.callList[pickerView.tag - 1].count
    }
    // ピッカービューに表示する内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerNum = pickerView.tag
        return AppConstants.callList[pickerView.tag - 1][row]
    }
    //データ選択時の呼び出しメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    // TextFieldの値
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
            case 1: garlicTextField.text = "\(AppConstants.callList[pickerView.tag - 1][garlicPickerView.selectedRow(inComponent: 0)])"
            case 2: vegetableTextField.text = "\(AppConstants.callList[pickerView.tag - 1][vegetablePickerView.selectedRow(inComponent: 0)])"
            case 3: porkBackFatTextField.text = "\(AppConstants.callList[pickerView.tag - 1][porkBackFatPickerView.selectedRow(inComponent: 0)])"
            case 4: soySourceTextField.text = "\(AppConstants.callList[pickerView.tag - 1][soySourcePickerView.selectedRow(inComponent: 0)])"
            default: break
        }
    }
    // doneボタンの動作
    @objc func done() {
        switch pickerNum {
            case 1: garlicTextField.text = "\(AppConstants.callList[pickerNum - 1][garlicPickerView.selectedRow(inComponent: 0)])"
            case 2: vegetableTextField.text = "\(AppConstants.callList[pickerNum - 1][vegetablePickerView.selectedRow(inComponent: 0)])"
            case 3: porkBackFatTextField.text = "\(AppConstants.callList[pickerNum - 1][porkBackFatPickerView.selectedRow(inComponent: 0)])"
            case 4: soySourceTextField.text = "\(AppConstants.callList[pickerNum - 1][soySourcePickerView.selectedRow(inComponent: 0)])"
            default: break
        }
        view.endEditing(true)
    }
    // cancelボタンの指定
    @objc func cancel(){
        garlicTextField.endEditing(true)
        vegetableTextField.endEditing(true)
        porkBackFatTextField.endEditing(true)
        soySourceTextField.endEditing(true)
    }
    // 画面タップでテキストフィールドを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        garlicTextField.endEditing(true)
        vegetableTextField.endEditing(true)
        porkBackFatTextField.endEditing(true)
        soySourceTextField.endEditing(true)
    }
    // ドラムロール設定ここまで
    
    // generatorButtonボタンを押したときの動作
    @IBAction func generateCall(_ sender: Any) {
        garlicText = AppConstants.CallList[0][garlicTextField.text!] ?? ""
        vegetableText = AppConstants.CallList[1][vegetableTextField.text!] ?? ""
        porkBackFatText = AppConstants.CallList[2][porkBackFatTextField.text!] ?? ""
        soySourceText = AppConstants.CallList[3][soySourceTextField.text!] ?? ""

        if garlicText.isEmpty && vegetableText.isEmpty && porkBackFatText.isEmpty && soySourceText.isEmpty {
            callText.text = "フツウ"
        } else {
            callText.text = garlicText + vegetableText + porkBackFatText + soySourceText
        }
    }
    
    //遷移ボタンの動作
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // pickerViewのtag指定
        garlicPickerView.delegate = self
        garlicPickerView.tag = 1
        vegetablePickerView.delegate = self
        vegetablePickerView.tag = 2
        porkBackFatPickerView.delegate = self
        porkBackFatPickerView.tag = 3
        soySourcePickerView.delegate = self
        soySourcePickerView.tag = 4
        // ドラムロール実行
        picker()
        
        // ボタンの装飾
        let buttonColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        generatorButton.backgroundColor = buttonColor
        generatorButton.layer.borderWidth = 5
        generatorButton.layer.borderColor = UIColor.red.cgColor
        generatorButton.layer.cornerRadius = 5.0
        gachaLink.backgroundColor = buttonColor
        gachaLink.layer.cornerRadius = 5.0
        let buttonTextColor = UIColor(red: 247/255, green: 229/255, blue: 4/255, alpha: 1.0)
        gachaLink.setTitleColor(buttonTextColor, for: UIControl.State.normal)
        //背景色
        view.backgroundColor = buttonTextColor
        textsView.backgroundColor = buttonTextColor
        space.backgroundColor = buttonTextColor
        space2.backgroundColor = buttonTextColor
        space3.backgroundColor = buttonTextColor
        inputSpace.backgroundColor = buttonTextColor
        inputSpace2.backgroundColor = buttonTextColor
        inputSpace3.backgroundColor = buttonTextColor
        //ドラムロール装飾
        garlicTextField.textAlignment = .center
        vegetableTextField.textAlignment = .center
        porkBackFatTextField.textAlignment = .center
        soySourceTextField.textAlignment = .center
        //コールを複数行で表示できるようにする
        callText.numberOfLines = 0
    }
} //class終了
