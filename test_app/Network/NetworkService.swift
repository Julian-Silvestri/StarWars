//
//  NetworkService.swift
//  test_app
//
//  Created by Julian Silvestri on 2025-04-01.
//

import Foundation


class NetworkService {
    public static let sharedService = NetworkService()
    let baseUrl = "https://swapi.dev/api/"
    let baseUrlPeople = "people/"
    let baseUrlPlanets = "planets/"
    let baseUrlStarShips = "starships/"
    
    func getStarWarsPeople(id: Int, completionHandler: @escaping(Bool) -> Void){
        let peopleUrl = "\(baseUrl)\(baseUrlPeople)/\(id)"
        var urlRequest = URLRequest(url: URL(string: peopleUrl)!, timeoutInterval: Double.infinity)
        urlRequest.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            guard let responseData = data else {
                //data is null
                print(String(describing: error))
                return
                
            }
            
            do {
                let jsonData = try JSONDecoder().decode(StarWarsModel.self, from: responseData)
                StarWarsModel.StarWarsDataPeople = jsonData
                completionHandler(true)
            } catch let err {
                print(String(describing: err))
                completionHandler(false)
            }
        
            
        }
        
        task.resume()
        
    }
    
    
    /// ** NOT WORKING**
    /// the model associated with this function needs to be updateds
    /// - Parameters:
    ///   - id: the number associated with said planet. Unsure of the total number
    ///   - completionHandler: returns status in boolean value
    func getStarWarsPlanets(id: Int, completionHandler: @escaping(Bool)->Void){
        let starWarsPlanetsUrl = "\(baseUrl)\(baseUrlPlanets)\(id)"
        
        var urlRequest = URLRequest(url: URL(string: starWarsPlanetsUrl)!, timeoutInterval: Double.infinity)
        urlRequest.httpMethod = "GET"
        let urlSession = URLSession.shared.dataTask(with: urlRequest){data, response, error in
            guard let jsonData = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let jsonDecoder = try JSONDecoder().decode(StarWarsModel.self, from: jsonData)
//                StarWarsModel.StarWarsDataPlanets.append(jsonDecoder)
                
                completionHandler(true)
            } catch let err {
                print(String(describing: err))
                completionHandler(false)
                return
            }
            
        }
        urlSession.resume()
    }
    
    
    
    ///  NOT WORKING
    ///  The model associated with this call needs to be updated
    /// - Parameters:
    ///   - id: the number associated to the starship. There are X number of starships
    ///   - completionHandler:  returns the stats of the call in boolean values. True means x y and z, and False means total failure
    func getStarWarsStarships(id: Int, completionHandler: @escaping(Bool)->Void){
        
        let urlString = "\(baseUrl)\(baseUrlStarShips)\(id)"
        
        var urlRequest = URLRequest(url: URL(string: urlString)!, timeoutInterval: Double.infinity)
        
        urlRequest.httpMethod = "GET"
        
        let urlSession = URLSession.shared.dataTask(with: urlRequest){data, response, error in
        
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(StarWarsModel.self, from: data)
//                StarWarsModel.StarWarsDataVehicles.append(jsonData)
                completionHandler(true)
                
            } catch let err {
                print(String(describing: err))
                completionHandler(false)
                return
            }
            
        }
        urlSession.resume()
        
    }
    
    
}
