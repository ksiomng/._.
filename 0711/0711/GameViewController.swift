//
//  369ViewController.swift
//  0711
//
//  Created by Song Kim on 7/13/25.
//

import UIKit

class GameViewController: UIViewController {
    var cnt = 0

    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultAllLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.placeholder = "최대 숫자를 입력해주세요"
        numberTextField.backgroundColor = .systemGray6
        resultAllLabel.text = "숫자를 입력하세요!"
        resultLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        resultLabel.text = ""
    }
    
    func checkTextField() {
        if let num = Int(numberTextField.text ?? "") {
            resultAllLabel.text = select369(num)
            resultLabel.text = "숫자 \(num)까지 총 박수는 \(cnt)번 입니다"
        } else {
            resultAllLabel.text = "숫자를 입력하세요!"
        }
    }
    
    func select369(_ num: Int) -> String {
        var result: String = ""
        for i in 1...num {
            var str = String(i)
            str = str.replacingOccurrences(of: "3", with: "👏")
            str = str.replacingOccurrences(of: "6", with: "👏")
            str = str.replacingOccurrences(of: "9", with: "👏")
            cnt += str.filter{$0 == "👏"}.count
            result += "\(str), "
        }
        return result
    }
    
    @IBAction func enterTextField(_ sender: UITextField) {
        checkTextField()
    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        checkTextField()
    }
    
}
