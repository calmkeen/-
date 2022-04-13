//
//  testVIew.swift
//  how about your waterfall
//
//  Created by calmkeen on 2022/04/13.
//

import SwiftUI
import Combine

struct apiResult: Codable{
    var code: String
    var message: String
}
//한강물 api
struct APItest : Codable{
    var MSR_TIME : String
    var SITE_ID: String
    var W_TEMP:String
    var MSR_DATE:String
}
struct ApiTesting: Codable{
    let row : [APItest]
}
//let url: String = "595646644a73746f37377752577577"
//url = 595646644a73746f37377752577577
//예시
//https://data.seoul.go.kr/dataList/OA-15488/S/1/datasetView.do;jsessionid=52E023ECEBCEE40C12AF350F55FEE2D2.new_portal-svr-21
struct Res : Codable{
    let api: [APItest]
    let result: apiResult
    var list_total_count: Int
}

struct testVIew: View {
    
    var body: some View {
        Button(action: loadData) {
            Text("Button")
        }
    }
}


func loadData() {
    let KEY = "595646644a73746f37377752577577"
    let TYPE = "json"
    let SERVICE = "WPOSInformationTime"
    guard let url = URL(string: "http://openapi.seoul.go.kr:8088/\(KEY)/\(TYPE)/\(SERVICE)/4/4/") else {
        fatalError("Invalid URL")
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else{
            return
        }
        print("hey")
        
        let decoder = JSONDecoder()
        
        
        do{
//             let json = try
//                decoder.decode(ApiTesting.self, from: data)
//            print(json)
            let error = try
               decoder.decode(apiResult.self, from: data)
            print(error)
            print(error.code)
            print(error.message)
            print("error")
            print("왜안돼")
//            print(json.W_TEMP)
//            print(json.MSR_DATE)
//            print(json.MSR_TIME)
//            print(json.SITE_ID)
//                print(json.MSR_DATE)
//                print(json.W_TEMP)
//                print(json.SITE_ID)
        } catch {
//            let error = try
//               decoder.decode(apiResult.self, from: data)
//            print(error.code)
//            print(error.message)
            print("error")
            
        }
        
        //                        let result = try? JSONDecoder().decode(Res.self, from: data)
        //                        if let result = result {
        //                            print(result)
        //                            result.api.forEach {
        //                                print($0.MSR_TIME)
        //                                print($0.SITE_ID)
        //                                print($0.W_TEMP)
        //                            }
        //                        }
        //
        
    }.resume()
}

struct testVIew_Previews: PreviewProvider {
    static var previews: some View {
        testVIew()
    }
}
