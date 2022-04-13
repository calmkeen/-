//
//  test.swift
//  how about your waterfall
//
//  Created by calmkeen on 2022/04/13.
//

import SwiftUI

struct apiResultg: Codable{
    var code: String
    var message: String
}
//한강물 api
struct APItestt : Codable{
    var MSR_TIME : String
    var SITE_ID: String
    var W_TEMP:String
    var MSR_DATE:String
}
struct ApiTestingt: Codable{
    let row : [APItestt]
}

struct Rest : Codable{
    let api: [APItestt]
    let result: apiResultg
    var list_total_count: Int
}

class testing: ObservableObject {
    
    static let sharedd = testing()
    private init() { }
    @Published var posts = [APItestt]()
    
    private let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    
    func fetchData(){
        
        let key = "595646644a73746f37377752577577"
        guard let url = URL(string: "http://openapi.seoul.go.kr:8088/\(key)/json/WPOSInformationTime/4/4/") else {
            fatalError("Invalid URL")
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                // 실패
                return
            }
            guard let data = data else{
                return
            }
            do{
                let apiResponse = try JSONDecoder().decode(ApiTestingt.self, from: data)
                print(apiResponse)
                
                // 성공
            }catch(let err){
                print(err.localizedDescription)
            }
        }
        task.resume()
    }
}



struct test: View {
    @StateObject private var network = testing.sharedd
        

    var body: some View {
        
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
