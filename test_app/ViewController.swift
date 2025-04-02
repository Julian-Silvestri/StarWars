//
//  ViewController.swift
//  test_app
//
//  Created by Julian Silvestri on 2025-04-01.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var hairColor: UILabel!
    
    @IBOutlet weak var eyeColor: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var skinColor: UILabel!
    
    @IBOutlet weak var starWarsRandomizerButton: StarWarsRandomizerButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNextRandomImage(completionHandler: {[self]status in
        
            if(status == true){
                updateDisplay()
            } else {
                displayError()
            }
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }

    @IBAction func randomizerButtonAction(_ sender: Any) {
        getNextRandomImage(completionHandler: {[self]status in
        
            if(status == true){
                updateDisplay()
            } else {
                displayError()
            }
            
        })
    }
    
    func updateDisplay(){
        if(StarWarsModel.StarWarsDataPeople != nil){
            DispatchQueue.main.async{
                self.name.text = "Name:\(StarWarsModel.StarWarsDataPeople?.name ?? "null")"
                self.height.text = "Height: \(StarWarsModel.StarWarsDataPeople?.height ?? "null")"
                self.mass.text = "Mass: \(StarWarsModel.StarWarsDataPeople?.mass ?? "null")"
                self.hairColor.text = "Hair Color: \(StarWarsModel.StarWarsDataPeople?.hair_color ?? "null")"
                self.skinColor.text = "Skin Color: \(StarWarsModel.StarWarsDataPeople?.skin_color ?? "null")"
                self.eyeColor.text = "Eye Color: \(StarWarsModel.StarWarsDataPeople?.eye_color ?? "null")"
                self.birthYear.text = "Birth Year: \(StarWarsModel.StarWarsDataPeople?.birth_year ?? "null")"
                self.gender.text = "Gender: \(StarWarsModel.StarWarsDataPeople?.gender ?? "null")"
            }

        }
        
    }
    
    func displayError(){
        DispatchQueue.main.async{
            let errorAlert = UIAlertController(title: "Error", message: "Could not load data", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(errorAlert, animated: true, completion: {
                print("OK!")
            })
        }

    }
    
    
    func getNextRandomImage(completionHandler: @escaping(Bool)->Void){
        let randomNumber = Int.random(in: 1...40)
        NetworkService.sharedService.getStarWarsPeople(id: randomNumber, completionHandler: {status in
            completionHandler(status)
        })
    }
    
}

