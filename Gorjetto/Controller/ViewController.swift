//
//  ViewController.swift
//  Gorjetto
//
//  Created by Diego Carvalho on 13/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelValorContaDigitada: UITextField!
    @IBOutlet weak var botaoZeroPercent: UIButton!
    @IBOutlet weak var botaoDezPercent: UIButton!
    @IBOutlet weak var botaoVintePercent: UIButton!
    @IBOutlet weak var labelNumeroDivisao: UILabel!
    
    var gorjetaSelecionada = 0.10
    var divisaoEm = 2
    var valorDigitado = 0.0
    var totalFinalString = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func gorgetaSelecionada(_ sender: UIButton) {
        labelValorContaDigitada.endEditing(true)
        botaoZeroPercent.isSelected = false
        botaoDezPercent.isSelected = false
        botaoVintePercent.isSelected = false
        sender.isSelected = true
        let selecao = sender.currentTitle!
        let selecaoSemPercent = Double(String(selecao.dropLast()))!
        gorjetaSelecionada = selecaoSemPercent / 100
    }
    
    @IBAction func stepperValorSelecionado(_ sender: UIStepper) {
        divisaoEm = Int(sender.value)
        labelNumeroDivisao.text = String(divisaoEm)
    }
    
    @IBAction func botaoCalcularPressionado(_ sender: UIButton) {
        let conta = labelValorContaDigitada.text!
        if conta != ""{
            valorDigitado = Double(conta)!
        }
        let totalFinal = valorDigitado * ( 1 + gorjetaSelecionada) / Double(divisaoEm)
        totalFinalString = String(format: "%.2f", totalFinal)
        self.performSegue(withIdentifier: "mostraResultado", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostraResultado"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalFinal = totalFinalString
            destinationVC.gorjetaSelecionada = Int(gorjetaSelecionada * 100)
            destinationVC.divisaoEm = divisaoEm
        }
    }
}

