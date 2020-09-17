//
//  QuizViewController.swift
//  Quiz
//
//  Created by Haruko Okada on 9/5/20.
//  Copyright © 2020 Haruko Okada. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    
    var quizArray = [Any]()
    var correctAnswer:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizArray.append(["我愛羅はどこの忍者ですか？","木の葉隠れ", "砂がくれ", "霧隠れ", 2])
        quizArray.append(["ひなたの父の名前は","日向ミナト", "日向ヒザシ", "日向ヒアシ", 3])
        quizArray.append(["２代目火影の名前","千手柱間", "千手猿飛", "千手扉間", 3])
        quizArray.append(["鬼鮫の武器の名前","鮫刃", "鮫肌", "鮫布", 2])
        quizArray.append(["木の葉隠れの相談役のおじいさんの方の名前","水戸門ホムラ", "エビゾウ爺", "うたたねホムラ", 1])
        
        quizArray.shuffle()
        choiceQuiz()
        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz(){
        
        //一時的にクイズ取り出す (per question) since index 0 is the question
        let tmpArray = quizArray[0] as! [Any]
        
        //view question. 
        quizTextView.text = tmpArray[0] as? String
        
        //set button text inside for each question
        choiceOne.setTitle(tmpArray[1] as? String, for: .normal)
        choiceTwo.setTitle(tmpArray[2] as? String, for: .normal)
        choiceThree.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    func performSegueToResult() {
              performSegue(withIdentifier: "toResultView", sender: nil)
          }
    
    //preparing for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            
            //make instance of resultViewController
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag{
            correctAnswer += 1
        }
        
        //remove answered quiz from quizArray
        quizArray.remove(at: 0)
        
        //問題無くなったから結果の表示へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
