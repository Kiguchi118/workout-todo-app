//
//  AddController.swift
//  MyToDoApp
//
//  Created by KY on 2021/01/18.
//

import UIKit

var todoList = [String]()

class AddController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationBarDelegate {
    
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var repetitionsLabel: UILabel!
    @IBOutlet weak var setCountLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var trainingNameTextField: UITextField!
    
    let partList:[String] = ["胸", "肩", "背中", "腕", "腹", "脚"]
    let repetitionsList:[String] = ["5", "10", "15","20", "25", "30"]
    let setCountList:[String] = ["1", "2", "3", "4", "5", "6"]

    @IBAction func TodoAddButten(_ sender: Any) {
        // todoリストに追加
        let trainingMenu = partLabel.text!+"："+trainingNameTextField.text!
        let frequency = repetitionsLabel.text!+"回 × "+setCountLabel.text!
        todoList.append(trainingMenu+" / "+frequency)
        
        // テキスト初期化
        trainingNameTextField.text = ""
        partLabel.text = ""
        repetitionsLabel.text = ""
        setCountLabel.text = ""
        UserDefaults.standard.set(todoList, forKey: "todoList" )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        navigationBar.delegate = self
        
        // 追加画面の初期設定
        partLabel.text = ""
        repetitionsLabel.text = ""
        setCountLabel.text = ""
        pickerView.selectRow(0, inComponent: 0, animated: false)
        pickerView.selectRow(0, inComponent: 1, animated: false)
        pickerView.selectRow(0, inComponent: 2, animated: false)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
            case 0:
                return partList.count
            case 1:
                return repetitionsList.count
            case 2:
                return setCountList.count
            default:
                return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
            case 0:
                return partList[row]
            case 1:
                return repetitionsList[row]
            case 2:
                return setCountList[row]
            default:
                return "error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
            case 0:
                partLabel.text = partList[row]
            case 1:
                repetitionsLabel.text = repetitionsList[row]
            case 2:
                setCountLabel.text = setCountList[row]
            default:
                break
        }
    }

    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
