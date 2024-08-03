//
//  LocalResultsManager.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 02/08/24.
//

import Foundation
import CoreData

class LocalResultsManager{
    let monitor = NetworkMonitor()
    
    private var resultList: [TestResult] = []
    private var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        loadResults()
    }
    
    //Read the list from a file
    func loadResults(){
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let resultsURL = documentsDirectory.appending(path: "results.json")
        
        //Check if file exists
        if fileManager.fileExists(atPath: resultsURL.path){
            do{
                let jsonData = fileManager.contents(atPath: resultsURL.path)
                //Decode json file into array
                self.resultList = try JSONDecoder().decode([TestResult].self, from: jsonData!)
            }
            
            catch let error{
                print("Error loading: ",error)
            }
        }
        
        else{
            print("Unable to load file")
        }
    }
    
    
    //CRUD: Create
    func createResult(result: TestResult){
        resultList.append(result)
    }
    
    //CRUD: Read
    func getResultsList() -> [TestResult]{
        return resultList
    }
    
    func getResultAt(at index : Int) -> TestResult{
        return resultList[index]
    }
        
    
    func getResultCount() -> Int{
        return resultList.count
    }
    
    
    //CRUD: Update
    func updateResult(at index:Int, result : TestResult){
        resultList[index] = result
    }
    
    func saveCocktails(){
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        print("Documents Directory: ", documentsDirectory)
        
        let resultsURL = documentsDirectory.appending(path: "results.json")
        //print("ResultURL: ", resultsURL)
        
        //Save [Cocktail] to JSON file
        do{
            let jsonData = try JSONEncoder().encode(resultList)
            fileManager.createFile(atPath: resultsURL.path, contents: jsonData)
        }
        catch let error{
            print(error)
        }
    }
    
    
    //CRUD: Delete
    func deleteCocktail(at index : Int){
        resultList.remove(at: index)
    }
}
