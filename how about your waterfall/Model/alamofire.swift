//
//  alamofire.swift
//  how about your waterfall
//
//  Created by calmkeen on 2022/04/18.
//
import SwiftUI
import Foundation
import Alamofire

//접근하고자 하는 URL 정보
let UR1L = "http://openapi.seoul.go.kr:8088/595646644a73746f37377752577577/json/WPOSInformationTime/1/1/"

// MARK: - Welcome
struct Welcome: Codable {
    let wposInformationTime: WPOSInformationTime
    enum CodingKeys: String, CodingKey {
        case wposInformationTime = "WPOSInformationTime"
    }
}

// MARK: - WPOSInformationTime
struct WPOSInformationTime: Codable {
    let listTotalCount: Int?
    let result: Result
    let row: [Row]

    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case row
    }
    init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
        listTotalCount = try values.decode(Int.self, forKey: .listTotalCount)
            row = try values.decode(Array.self, forKey: .row)
            result = try values.decode(Result.self, forKey: .result)
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
        
        init(from decoder: Decoder) throws {
           self = try CodingKeys(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .siteID
        }
    }
}


struct alamofire: View {
    
    var body: some View {
        Button(action: getRoutineList) {
            Text("Button")
        }
    }
}


func getRoutineList() {
    guard let url = URL(string: "http://openapi.seoul.go.kr:8088/595646644a73746f37377752577577/json/WPOSInformationTime/1/1/") else {
                fatalError("Invalid URL")
            }
    
    AF.request(url).validate().responseData { (response) in
        print("response: \(response)")
        do {
            let decoder = JSONDecoder()
            
            
            switch (response.result) {
                
                // 성공/실패 구분
            case .success:
                
                let dataRow = try decoder.decode(Row.self, from: response.data!)
                print("routines: \(dataRow)")
            case .failure(let error):
                print("errorCode: \(error._code)")
                print("errorDescription: \(error.errorDescription!)")
            }
        } catch let parsingError {
            print("Error:", parsingError)
        }
    }.resume()
}
struct alamofire_Previews: PreviewProvider {
    static var previews: some View {
        alamofire()
    }
}
