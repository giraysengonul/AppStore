//
//  AppsService.swift
//  AppStore
//
//  Created by hakkı can şengönül on 3.04.2023.
//

import Foundation
import Alamofire
struct AppsService {
    static func fetchData(urlString: String, completion: @escaping(Feed)->Void){
        guard let url = URL(string: urlString) else { return }
        AF.request(url,method: .get).responseData { responseData in
            if let error = responseData.error{
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else{ return }
            do{
                let response = try JSONDecoder().decode(AppModel.self, from: data)
                completion(response.feed)
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
    static func fetchHeaderData(urlString: String, completion: @escaping([AppHeaderModel])->Void){
        guard let url = URL(string: urlString) else { return }
        AF.request(url,method: .get).responseData { responseData in
            if let error = responseData.error{
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else{ return }
            do{
                let response = try JSONDecoder().decode([AppHeaderModel].self, from: data)
                completion(response)
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
    static func fetchRatingsData(id: String, completion: @escaping([Entry])->Void){
        guard let url = URL(string: "https://itunes.apple.com/rss/customerreviews/page=1/id=\(id)/sortbt=mostrecent/json?1=en&cc=us") else { return }
        AF.request(url,method: .get).responseData { responseData in
            if let error = responseData.error{
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else{ return }
            do{
                let response = try JSONDecoder().decode(RatingsModel.self, from: data)
                completion(response.feed.entry)
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
}
