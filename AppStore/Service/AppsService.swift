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
}
