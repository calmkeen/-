//
//  testVIew.swift
//  how about your waterfall
//
//  Created by calmkeen on 2022/04/13.
//

import SwiftUI
import Combine


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let wposInformationTime: WPOSInformationTime
    
    enum CodingKeys: String, CodingKey {
        case wposInformationTime = "WPOSInformationTime"
    }
}

// MARK: - WPOSInformationTime
struct WPOSInformationTime: Codable {
    let listTotalCount: Int
    let result: Result
    let row: [Row]
    
    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case row
    }
}

// MARK: - Result
struct Result: Codable {
    let code, message: String
    
    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}

// MARK: - Row
struct Row: Codable {
    let msrDate, msrTime, siteID, wTemp: String
    let wPh, wDo, wTn, wTp: String
    let wToc, wPhen, wCN: String
    
    enum CodingKeys: String, CodingKey {
        case msrDate = "MSR_DATE"
        case msrTime = "MSR_TIME"
        case siteID = "SITE_ID"
        case wTemp = "W_TEMP"
        case wPh = "W_PH"
        case wDo = "W_DO"
        case wTn = "W_TN"
        case wTp = "W_TP"
        case wToc = "W_TOC"
        case wPhen = "W_PHEN"
        case wCN = "W_CN"
    }
}



//MARK: - 나누기

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
            return print("data =! data")
        }
        print("hey")
        
        let decoder = JSONDecoder()
        
        let jsonString = String(data: data, encoding: .utf8)
        print("한글\(jsonString)")
        
        do{
            
            let json = try
            decoder.decode(Row.self, from: data)
            print(data)
            print(json.)
            print(json.msrDate)
            print(json.msrTime)
            print(json.siteID)
            print(json.wTemp)
            print("error")
            print("왜안돼")
            
        } catch {
            
            print("error")
            
        }
        
        
    }.resume()
}

struct testVIew_Previews: PreviewProvider {
    static var previews: some View {
        testVIew()
    }
}
