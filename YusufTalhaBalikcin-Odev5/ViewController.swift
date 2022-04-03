//
//  ViewController.swift
//  YusufTalhaBalikcin-Odev5
//
//  Created by yusufmac on 4.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sonucLabel: UILabel!
    
    var sonuc = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonClicked(_ sender: UIButton) {
        if sender.tag == 0{
            sonuc = sonuc + "0"
        }
        if sender.tag == 1{
            sonuc = sonuc + "1"
        }
        if sender.tag == 2{
            sonuc = sonuc + "2"
        }
        if sender.tag == 3{
            sonuc = sonuc + "3"
        }
        if sender.tag == 4{
            sonuc = sonuc + "4"
        }
        if sender.tag == 5{
            sonuc = sonuc + "5"
        }
        if sender.tag == 6{
            sonuc = sonuc + "6"
        }
        if sender.tag == 7{
            sonuc = sonuc + "7"
        }
        if sender.tag == 8{
            sonuc = sonuc + "8"
        }
        if sender.tag == 9{
            sonuc = sonuc + "9"
        }
        if sender.tag == 10{
            sonuc = ""
        }
        if sender.tag == 11{
            if sonuc.last != "/" && sonuc.last != "+" && sonuc.last != "-" && sonuc.last != "*"{
                sonuc = sonuc + "/"
            }
        }
        if sender.tag == 12{
            if sonuc.last != "/" && sonuc.last != "+" && sonuc.last != "-" && sonuc.last != "*"{
                sonuc = sonuc + "*"
            }
        }
        if sender.tag == 13{
            if sonuc.last != "/" && sonuc.last != "+" && sonuc.last != "-" && sonuc.last != "*"{
                sonuc = sonuc + "-"
            }
        }
        if sender.tag == 14{
            if sonuc.last != "/" && sonuc.last != "+" && sonuc.last != "-" && sonuc.last != "*"{
                sonuc = sonuc + "+"
            }
        }
        if sender.tag == 15{
            sonuc = hesapla(myString: sonuc)
        }
        if sender.tag == 16{
            if sonuc.isEmpty == false{
                sonuc.removeLast()
            }
        }
        sonucLabel.text = sonuc
    }
    
    func hesapla(myString: String) -> String{
        var myStr = myString
        while myStr.last == "/" || myStr.last == "+" || myStr.last == "-" || myStr.last == "*" || myStr.last == "."{
            myStr.removeLast()
        }
        while myStr.first == "/" || myStr.first == "+" || myStr.first == "*"{
            myStr.removeFirst()
        }
        var negatifKontrol = 0
        if myStr.first == "-"{
            myStr.removeFirst()
            negatifKontrol = 1
        }
      
        let myCharacterSets = CharacterSet(charactersIn: "+-*/")
        let myCharacterSets2 = CharacterSet(charactersIn: "1234567890.")

        var myNumberArray = myStr.components(separatedBy: myCharacterSets)
        var myOperatorsArray = myStr.components(separatedBy: myCharacterSets2)
        myNumberArray.removeAll(where: { $0 == "" })
        myOperatorsArray.removeAll(where: { $0 == "" })
        
        if negatifKontrol == 1{
            let firstNumberTemp = myNumberArray[0]
            if var firstNumberTemp2 = Int(firstNumberTemp){
                firstNumberTemp2 = firstNumberTemp2 * -1
                myNumberArray[0] = String(firstNumberTemp2)
            }
            if var firstNumberTemp2 = Double(firstNumberTemp){
                firstNumberTemp2 = firstNumberTemp2 * -1
                myNumberArray[0] = String(firstNumberTemp2)
            }
        }
        
        
        var i = 0
        var sayac = 0
        var dongu = myOperatorsArray.count
        while sayac < dongu{
            if myOperatorsArray[i] == "*" || myOperatorsArray[i] == "/"{
                if myOperatorsArray[i] == "*"{
                    let result = Float(myNumberArray[i])! * Float(myNumberArray[i + 1])!
                    myNumberArray[i] = String(result)
                    myNumberArray.remove(at: (i + 1))
                    myOperatorsArray.remove(at: i)
                    i = i - 1
                }else if myOperatorsArray[i] == "/"{
                    let result = Float(myNumberArray[i])! / Float(myNumberArray[i + 1])!
                    myNumberArray[i] = String(result)
                    myNumberArray.remove(at: (i + 1))
                    myOperatorsArray.remove(at: i)
                    i = i - 1
                }
            }
            i = i + 1
            sayac = sayac + 1
        }

        i = 0
        sayac = 0
        dongu = myOperatorsArray.count
        while sayac < dongu{
            if myOperatorsArray[i] == "+" || myOperatorsArray[i] == "-"{
                if myOperatorsArray[i] == "+"{
                    let result = Float(myNumberArray[i])! + Float(myNumberArray[i + 1])!
                    myNumberArray[i] = String(result)
                    myNumberArray.remove(at: (i + 1))
                    myOperatorsArray.remove(at: i)
                }else if myOperatorsArray[i] == "-"{
                    let result = Float(myNumberArray[i])! - Float(myNumberArray[i + 1])!
                    myNumberArray[i] = String(result)
                    myNumberArray.remove(at: (i + 1))
                    myOperatorsArray.remove(at: i)
                }
            }
            sayac = sayac + 1
        }


        let result = myNumberArray.joined(separator: "")
        
        print(result)
        var resultString = String(result)
        if resultString.contains(".0"){
            resultString.removeLast()
            resultString.removeLast()
        }
        return resultString
    }
}

