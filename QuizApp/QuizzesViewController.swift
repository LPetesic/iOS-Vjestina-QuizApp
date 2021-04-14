//
//  QuizzesViewController.swift
//  QuizApp
//
//  Created by five on 14.04.2021..
//

import Foundation
import SwiftUI

class QuizzesViewController : UIViewController{
    class TopView: UIView {
        
        override var intrinsicContentSize: CGSize {
            return CGSize(width: 200, height: 100)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        var topView = TopView()
        var botView = UIView(frame: CGRect(x:0, y:100, width:200, height:100))
        var midView = UIView()
        view.addSubview(topView)
        view.addSubview(botView)
        view.addSubview(midView)
        
        topView.backgroundColor = .blue
        botView.backgroundColor = .red
        midView.backgroundColor = .gray
        topView.translatesAutoresizingMaskIntoConstraints = false
        botView.translatesAutoresizingMaskIntoConstraints = false
        //let widthConstraint1 = topView.rightAnchor.constraint(equalTo: view.rightAnchor)
        //let widthConstraint2 = botView.rightAnchor.constraint(equalTo: view.rightAnchor)
        //let widthConstraint3 = topView.leftAnchor.constraint(equalTo: view.leftAnchor)
        //let widthConstraint4 = botView.leftAnchor.constraint(equalTo: view.leftAnchor)
        
        //let widthConstraint2 = midView.widthAnchor.constraint(equalTo: view.widthAnchor)
        
        //let verticalConstraint1 = botView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //let verticalConstraint2 = botView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        /*let borderConstraint1 = midView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        let borderConstraint2 = midView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100)
      */
        
            //NSLayoutConstraint.activate([verticalConstraint2])//, widthConstraint2, widthConstraint1, widthConstraint3])//, borderConstraint1, borderConstraint2])
        
        addElements()
        
       
        

    }
    func addElements(){
        var fetchButton = UIButton()
        fetchButton.setTitle("Get Quiz", for: .normal)
        var funFactLabel = UILabel(frame: CGRect(x:0, y:200, width: view.bounds.width, height: view.bounds.height))
        funFactLabel.text = "Fun fact"
        fetchButton.target(forAction: #selector(showLabel), withSender: view)
        
        var countLabel = UILabel()
        var quizTable = UITableView()
   
    }
    
    @objc
    func showLabel(sender: UIView){
        var label = UILabel(frame: CGRect(x: 0, y: sender.bounds.height - 100, width: sender.bounds.width, height: 100))
        label.text = "Fun fact"
        sender.addSubview(label)
    }
    
    func getNumber() -> Int{
        var ds = DataService()
        var questions = [Question]()
        for i in 0...ds.fetchQuizes().count-1{
            questions.append(contentsOf: ds.fetchQuizes()[i].questions)
        }
        return(questions.filter{(q:Question) in return q.question.contains("NBA")}.count)
        
    }
}
