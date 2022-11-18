//
//  quizViewController.swift
//  quizaap
//
//  Created by ICMMAC05-7528 on 08/11/22.
//

import UIKit

class quizViewController: UIViewController {
    
    
    
    
    @IBOutlet var btopcoes: [UIButton]!
    
   @IBOutlet weak var pergunta: UILabel!
    
    var manager = managerQuiz()
    var questao: quiz!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadOpcoes()
        
        
    }

    @IBAction func opcoes(_ sender: UIButton) {
        
        let index = Int(btopcoes.firstIndex(of: sender) ?? 0)
        manager.checkAswer(posiçao: index)
        if manager.checkFinal(){
            performSegue(withIdentifier: "segueResult", sender: nil)}else{
                reloadOpcoes()
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewresult = segue.destination as! resultViewController
        viewresult.manger = manager
    }
    
    func reloadOpcoes(){
        questao = manager.reloadQuiz()
        pergunta.text = questao.label
        for i in 0...2 {
            btopcoes[i].setTitle(questao.perguntas[i], for: .normal)
        }
    }
    
}
