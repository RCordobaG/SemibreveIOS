//
//  ResultListViewController.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 03/08/24.
//

import UIKit

class ResultListViewController: UIViewController {

    @IBOutlet weak var ResultListTable: UITableView!
    
    let context = (UIApplication.shared .delegate as! AppDelegate).persistentContainer.viewContext
    var resultManager : LocalResultsManager?
    
    var resultJSONList : [TestResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultManager = LocalResultsManager(context: context)
        resultManager?.loadResults()

        // Do any additional setup after loading the view.
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

extension ResultListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if resultManager?.getResultCount() == 0{
            
        }
        else{
            
        }
        return resultManager!.getResultCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        resultJSONList = (resultManager?.getResultsList())!
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? ResultCell
        cell?.IDLabel.text = resultJSONList[indexPath.row].id
        cell?.DateLabel.text = resultJSONList[indexPath.row].date
        cell?.CorrectAnswerLabel.text = String(resultJSONList[indexPath.row].correctAnswers)
        cell?.IncorrectAnswerLabel.text = String(resultJSONList[indexPath.row].incorrectAnswers)
        return cell!
    }
    
    
}
