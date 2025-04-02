//
//  StarWarsModel.swift
//  test_app
//
//  Created by Julian Silvestri on 2025-04-01.
//

class StarWarsModel: Codable {
    let name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, homeworld, created, edited, url: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    
    static var StarWarsDataPeople:StarWarsModel? = nil
//    static var StarWarsDataVehicles = [StarWarsModel]()
//    static var StarWarsDataPlanets = [StarWarsModel]()
    
    enum CodingKeys: String, CodingKey{
        case name, height, mass, gender, homeworld, created, edited, url, starships, vehicles, species, films
        case hair_color = "hair_color"
        case skin_color = "skin_color"
        case eye_color = "eye_color"
        case birth_year =  "birth_year"

        
    }
    
    init(name: String, height: String, mass: String, hair_color: String, skin_color: String, eye_color: String, birth_year: String, gender: String, homeworld: String, created: String, edited: String, url: String, films: [String], species: [String], vehicles: [String], starships: [String]) {
        self.name = name
        self.height = height
        self.mass = mass
        self.hair_color = hair_color
        self.skin_color = skin_color
        self.eye_color = eye_color
        self.birth_year = birth_year
        self.gender = gender
        self.homeworld = homeworld
        self.created = created
        self.edited = edited
        self.url = url
        self.films = films
        self.species = species
        self.vehicles = vehicles
        self.starships = starships
    }
}
