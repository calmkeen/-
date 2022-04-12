//
//  ApiCall.swift
//  how about your waterfall
//
//  Created by calmkeen on 2022/04/12.
//

import Foundation

class RequestAPI: ObservableObject {
    static let apicall = RequestAPI()
    @Published var info = [API]()
    func loadData() {
        
        guard let url = URL(string: "http://openapi.seoul.go.kr:8088/595646644a73746f37377752577577/json/how_about_your_waterfall/1/1/") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            let result = try? JSONDecoder().decode(WaterAPI.self, from: data)
            if let result = result {
                print(result)
                result.api.forEach {
                    print($0.MSR_TIME)
                    print($0.SITE_ID)
                    print($0.W_TEMP)
                }
            }
            
            
        }.resume()
    }
}
//한강물 api
struct API : Codable, Hashable{
    var MSR_TIME : String
    var SITE_ID: String
    var W_TEMP:String
}
struct WaterAPI: Codable{
    let api: [API]
}
let url: String = "595646644a73746f37377752577577"
//url = 595646644a73746f37377752577577
//예시
//https://data.seoul.go.kr/dataList/OA-15488/S/1/datasetView.do;jsessionid=52E023ECEBCEE40C12AF350F55FEE2D2.new_portal-svr-21

