//
//  Service.swift
//  AppStore
//
//  Created by ericzero on 12/30/22.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func FetchData(searchTerm: String, completion: @escaping ([Result], Error?) -> ()){
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch apps", error)
                completion([], nil)
                return
            }
            guard let data = data else { return }
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
               
                completion(searchResult.results, nil)
                
            }catch let jsonError {
                print("Failed to parse Json", jsonError)
                completion([], jsonError)
            }
            
        }.resume()
        
    }
    
    // Fetching free games List
    func fetchGames(completion: @escaping (AppResult?, Error?) -> ()) {
        let urlString =  "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    // fetching paid games List
    func fetchPaidGames(completion: @escaping (AppResult?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/10/apps.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    // Helper function for fetching..
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppResult?, Error?) -> Void){
        
        guard let url = URL(string: urlString) else { return }
        
       URLSession.shared.dataTask(with: url) { data, response, error in
           
           if let error = error {
               completion(nil, error)
               return
           }
           
           do{
               let searchApp = try JSONDecoder().decode(AppResult.self, from: data!)
               completion(searchApp, nil)
          }
           
           catch{
               completion(nil, error)
           }
       }.resume()
    }
    
    // This function is responsible for fetching header data..
    func fetchingHeaderApp(completion: @escaping([SocialApp]?, Error?) -> Void) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            do{
                let object = try JSONDecoder().decode([SocialApp].self, from: data!)
                completion(object, nil)
           }
            
            catch{
                completion(nil, error)
            }
        }.resume()
        
    }
}
