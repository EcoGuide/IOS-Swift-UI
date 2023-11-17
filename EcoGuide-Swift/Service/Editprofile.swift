//
//  Editprofile.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-15.
//

import Foundation
class   Editprofile{
    func Editprofile(email:String,password: String, name: String, completion: @escaping (Bool, String) -> Void) {
        let url = URL(string: "http://192.168.8.103:3000/EditProfile")!
        var request = URLRequest(url: url)
        print(url)
        request.httpMethod = "POST"
        if let accessToken = UserDefaults.standard.string(forKey: "tokenAuth") {
            print(accessToken)
            
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        print("Endpoint Headers : \(request.allHTTPHeaderFields ?? [:])")
        
        let body: [String: Any] = ["email": email,"password": password, "name": name]
        print(body)
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        do {
             let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
            request.httpBody = jsonData
            
             if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("JSON String : \(jsonString)")
            }
            
        } catch {
            print("Error: \(error.localizedDescription)")
            completion(false, "Failed to create JSON body")
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(false, error.localizedDescription)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                completion(true, "Password has been successfully reset.")
            } else {
                completion(false, "Failed to reset password.")
            }
        }.resume()
    }
    
    func logoutUser(token: String) {
        guard let url = URL(string: "http://192.168.8.103:3000/logout") else {
            print("URL invalide")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        if let accessToken = UserDefaults.standard.string(forKey: "tokenAuth") {
            print(accessToken)
            
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erreur de requête : \(error)")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Réponse serveur non valide.")
                return
            }

            if let mimeType = response.mimeType, mimeType == "application/json", let data = data {
                let stringData = String(data: data, encoding: .utf8)
                print("Réponse : \(stringData ?? "Pas de données")")
            }
        }

        task.resume()
    }

//    func logout( completion: @escaping (Bool, String) -> Void) {
//        let url = URL(string: "http://192.168.1.129:3000/logout")!
//        var request = URLRequest(url: url)
//        print(url)
//        request.httpMethod = "GET"
//        if let accessToken = UserDefaults.standard.string(forKey: "tokenAuth") {
//            print(accessToken)
//
//            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        }
//        print("Endpoint Headers : \(request.allHTTPHeaderFields ?? [:])")
//
//         request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//        do {
//             let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
//            request.httpBody = jsonData
//
//             if let jsonString = String(data: jsonData, encoding: .utf8) {
//                print("JSON String : \(jsonString)")
//            }
//
//        } catch {
//            print("Error: \(error.localizedDescription)")
//            completion(false, "Failed to create JSON body")
//            return
//        }
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(false, error.localizedDescription)
//                return
//            }
//
//            if let httpResponse = response as? HTTPURLResponse {
//                print(httpResponse.statusCode)
//                completion(true, "Password has been successfully reset.")
//            } else {
//                completion(false, "Failed to reset password.")
//            }
//        }.resume()
//    }
//
    
    
}
