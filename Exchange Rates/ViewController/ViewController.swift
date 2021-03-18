//
//  ViewController.swift
//  Exchange Rates
//
//  Created by Jonathan Ng on 16/03/2021.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {
    
    var moneyPickerArray: [(money: String, value: Double)] = []

    
    @IBOutlet weak var fromCurrencyLabel: UILabel!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    var currencyFrom: (money: String, value: Double) = ("",0.0)
    var currencyDesired: (money: String, value: Double) =  ("",0.0)
    var valueOfCurrencyFrom: Double = 0.0
    var valueOfCurrencyDesired: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadInitialValues()
    }
    
    func loadInitialValues(){
        AF.request("https://api.exchangeratesapi.io/latest").responseDecodable { (response: DataResponse<ExchangeRate,AFError>) in
            if let data = response.value {
                self.currencyFrom = (data.base , 0.0)
                self.moneyPickerArray = data.rates.map { ($0, $1) }.sorted { $0.0 < $1.0 }
                if self.moneyPickerArray.count > 0 {
                    self.currencyFrom = self.moneyPickerArray[0]
                    self.fromCurrencyLabel.text = self.currencyFrom.0
                    self.toCurrencyLabel.text = self.currencyDesired.0
                }
            }
        }
    }
    
    func loadMoedaSelecionada(money: (money: String, value: Double) ) {
        self.currencyFrom = money
        self.fromCurrencyLabel.text = money.money
        
        AF.request("https://api.exchangeratesapi.io/latest?base=\(self.currencyFrom.money)").responseDecodable { (response: DataResponse<ExchangeRate,AFError>) in
            if let data = response.value {
                self.moneyPickerArray = data.rates.map { ($0, $1) }.sorted { $0.0 < $1.0 }
                self.currencyDesired = self.moneyPickerArray[0]
                self.toCurrencyLabel.text = self.currencyDesired.0
            }
        }
    }
    
    func loadMoedaDesejada(money: (money: String, value: Double)){
        self.currencyDesired = money
        self.toCurrencyLabel.text = self.currencyDesired.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                openSheetMoeda(origem: true)
            } else if indexPath.row == 1 {
                self.fromCurrencyTextField.becomeFirstResponder()
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                openSheetMoeda(origem: false)
            } else if indexPath.row == 1 {
                self.toCurrencyTextField.becomeFirstResponder()
            }
        }
    }
    
    func openSheetMoeda(origem: Bool) {
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        let alert = UIAlertController(title: "Currency", message: "", preferredStyle: .alert)
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alert in
            if origem {
                self.loadMoedaSelecionada(money: self.moneyPickerArray[pickerView.selectedRow(inComponent: 0)])
            } else {
                self.loadMoedaDesejada(money: self.moneyPickerArray[pickerView.selectedRow(inComponent: 0)])
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func refreshClicked(_ sender: UIBarButtonItem) {
        loadInitialValues()
        let alert = UIAlertController(title: "", message: "Refresh Completed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func ConvertClicked(_ sender: UIButton) {
        let valueString = (fromCurrencyTextField?.text?.isEmpty == true) ? "0.0" : fromCurrencyTextField?.text ?? "0.0"
        
        let valueFinal = Double(valueString)! * currencyDesired.value
        toCurrencyTextField.text = String(valueFinal)
//        CoreDataManager.shared.saveHistorico(data: Date(),
//                                                 moedaDestino: moedaDesejada.moeda,
//                                                 moedaDestinoValor: moedaDesejada.valor,
//                                                 moedaOrigem: moedaSelecionada.moeda,
//                                                 valorInformado: Double(valorString)!)
    }
    

}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.moneyPickerArray[row].money
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.moneyPickerArray.count
    }
    
}

