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
        self.operation(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(.Muliply)
    }
    @IBAction func tapSubtrackButton(_ sender: UIButton) {
        self.operation(.Subtrack)
    }
    @IBAction func tapAddbutton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tapEqualButton(_ sender: roundButton) {
        self.operation(self.currentOperation)
    }
    
    //
    func operation(_ operation: Operation){
        if self.currentOperation != .unknown{
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return}
                guard let secondOperand = Double (self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtrack:
                    self.result = "\(firstOperand - secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                case .Muliply:
                    self.result = "\(firstOperand * secondOperand)"
                
                default :
                    break
                }
                // 1로나눈 나머지값이 0이라면 Int타입으로 변환
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                self.firstOperand = self.result
                // 연산된 결과값 표시
                self.numberOutputLabel.text = self.result
                    
                }
            // 연산된 값을 저장
            self.currentOperation = operation
            
        }else{
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            // 이전에 눌렀던 숫자 없서짐
            self.displayNumber = ""
        }
    }
}
