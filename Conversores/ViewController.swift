//
//  ViewController.swift
//  Conversores
//
//  Created by Fuze  on 08/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
    }

    @IBAction func showNext(_ sender: UIButton) {
        //como text é um optional preciso desembrulhar todo o conteudo
        //presente nele, logo usamos "!"
        //depois disso, realmente ele estará comparando um texto
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dolar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilometros", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    @IBAction func convert(_ sender: UIButton?) {
        //Aqui vai ser um optional de butão, pois vou chamar
        //o método de conversão logo acima
        
        //desembrulhando um optional de maneira segura
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            //quando o botão for clicado o alpha volta pra 1
            sender.alpha = 1.0
        }
        
        //começando as conversões
        switch lbUnit.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        view.endEditing(true)
        //quando terminar a edição da view
        //o teclado irá sumir
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else {return}
        //guard let, irei poder usar no retante do código,
        //desembrulha o optional do tfvalue e transforma em double, se nao retorna e sai da function
        if btUnit1.alpha == 1.0{
            //se o botão que estiver com o alpha 1.0, que é o mais escuro tiver precionado, a label la de baixo, que mostra o resultado coloca o contrário
            lbResultUnit.text = "Farenheint"
            //cálculo
            lbResult.text = String(temperature * 1.8 + 32.0)
            
        } else {
            lbResultUnit.text = "Celsius"
            lbResult.text = String((temperature - 32.0) / 1.8)
            
        }
    }
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Libra"
            lbResult.text = String(weight / 2.2046)
            
        } else {
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(weight * 2.2046)
            
        }
        
    }
    func calcCurrency() {
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Dólar"
            lbResult.text = String(currency / 5.0)
            
        } else {
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 5.0)
            
        }
        
    }
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Kilometros"
            lbResult.text = String(distance / 1000.0)
            
        } else {
            lbResultUnit.text = "Metros"
            lbResult.text = String(distance * 1000.0)
            
        }
        
    }
    
}

