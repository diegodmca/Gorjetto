//
//  ResultViewController.swift
//  Gorjetto
//
//  Created by Diego Carvalho on 13/06/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var labelTotalPessoa: UILabel!
    @IBOutlet weak var labelResumoCalculo: UILabel!
    
    var totalFinal = "0.0"
    var gorjetaSelecionada = 10
    var divisaoEm = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(totalFinal)
        labelTotalPessoa.text = "R$ \(totalFinal)"
        labelResumoCalculo.text = "Divisão contabilizada para \(divisaoEm) pessoas, aplicando \(gorjetaSelecionada)% de gorjeta."
    }
    
    @IBAction func botaoRecalcularPressionado(_ sender: UIButton) {
        self.dismiss(animated: true)
        
    }
}
