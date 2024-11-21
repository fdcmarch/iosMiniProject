import Foundation

struct Teacher: Codable, Identifiable {
    let id: Int
    let name: String
    let nameEng: String
    let status: Int
    let coin: Int?
    let rating: Float?
    let kidsRating: Float?
    let lessons: Int
    let favorite: Int
    let imageMain: String
}

struct TeachersResponse: Decodable {
    let teachers: [Teacher]
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func getAllTeachers(completion: @escaping (TeachersResponse?) -> Void) {
        let urlString = "https://english-staging.fdc-inc.com/api/teachers/search?src_view=home"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = [
            "order": 2,
            "users_api_token": "0ca7736d9ca84bc025bee488f72e82d9",
            "account_status": 3,
            "conditions": [
                "avatar_flg": 0,
                "hide_native_teacher": 0
            ],
            "pagination": 1,
            "api_version": 30,
            "app_version": "4.9.4",
            "device_type": 1
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            print("Error: Unable to serialize parameters")
            completion(nil)
            return
        }
        
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedResponse = try decoder.decode(TeachersResponse.self, from: data)
//                print(decodedResponse)
                completion(decodedResponse)
            } catch {
                print("Error decoding teachers: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}

