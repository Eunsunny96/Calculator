//
//  ViewController.swift
//  Calculator
//
//  Created by sunny h on 2021/09/07.
//

import UIKit
enum Operation {
    case Add
    case Subtrack
    case Divide
    case Muliply
    case unknown
}

class ViewController: UIViewController {
   
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    // 계산기버튼을 누를때마다 numberOutputLabel에 표시
    var displayNumber = ""
    // 이전 계산값을 저장
    var firstOperand = ""
    // 새롭게 입력된 값을 저장
    var secondOperand = ""
    // 계산의 결과값 저장
    var result = ""
    // 현재 계산기에 어떤 연산자를 사용했나, 연산자의 값을 저장
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapNumberButton(_ sender: UIButton) {
        
        guard let numberValue = sender.title(for: .normal) else { return }
        // 숫자 9자리만 표시
        if self.displayNumber.count < 9{
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        // 숫자는 8자리, 소숫점 숫자, 소수점포함 10자리
        if self.displayNumber.count < 8, !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
    }
    @IBAction func tapSubtrackButton(_ sender: UIButton) {
    }
    @IBAction func tapAddbutton(_ sender: UIButton) {
    }
    
    @IBAction func tapEqualButton(_ sender: roundButton) {
    }
}

