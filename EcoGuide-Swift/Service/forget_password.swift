//
//  forget_password.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-08.
//

import Foundation
 
class forget_password{
//    ----------------------------------------  OTP mailling  ----------------------------------------

    func forgetpassword(email: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "http://192.168.8.103:3000:3000/forgot-password") else {
            completion(.failure(URLError(.badURL)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let parameters: [String: Any] = [
            "email": email,
         ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let mimeType = httpResponse.mimeType, mimeType == "application/json",
                  let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let code = json["Code"] as? String {  // Make sure this key matches what your API sends
                    completion(.success(code))
                } else {
                    completion(.failure(URLError(.cannotParseResponse)))
                }
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func forgetpasswordsms(telephone: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "http://192.168.8.103:3000/forgot-password-sms") else {
            completion(.failure(URLError(.badURL)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let parameters: [String: Any] = [
            "telephone": telephone,
         ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let mimeType = httpResponse.mimeType, mimeType == "application/json",
                  let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let token = json["Token"] as? String {
                    // put token in prefs
                    UserDefaults.standard.set(token, forKey: "tokenverificationcode")
                    completion(.success(token))
                } else {
                    completion(.failure(URLError(.cannotParseResponse)))
                }
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
 
}
