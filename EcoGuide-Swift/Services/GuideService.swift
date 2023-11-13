//
//  GuideService.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 13/11/2023.
//

import Foundation
import Alamofire
import SwiftUI

struct Guideservice {
    
    func fetchGuides(completion: @escaping(Result<fetchGuidesResponse?, AuthError>) -> Void) {
        AF.request("\(Network.fetchGuideUrl)",
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: HTTPHeaders([
                    "Authorization": "\(UserDefaults.standard.string(forKey: "token") ?? "")",
                   ]))
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                do {
                    let parsedData = try JSONDecoder().decode(fetchGuidesResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
    }
    
}
