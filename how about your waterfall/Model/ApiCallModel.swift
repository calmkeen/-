import SwiftUI
import Combine


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

    enum CodingKeys: String, CodingKey {
        case msrDate = "MSR_DATE"
        case msrTime = "MSR_TIME"
        case siteID = "SITE_ID"
        case wTemp = "W_TEMP"
    }
}

 


struct testView: View {
     var body: some View {
        Button(action: loadData) {
            Text("Button")
        }

     }
 }

func loadData() {
    
    guard let url = URL(string: "http://openapi.seoul.go.kr:8088/595646644a73746f37377752577577/json/WPOSInformationTime/1/1/") else {
        fatalError("Invalid URL")
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            return
        }
        
        let result = try? JSONDecoder().decode(Welcome.self, from: data)
        if let result = result {
            print(result.wposInformationTime.listTotalCount)
            result.wposInformationTime.row.forEach {
                print($0.wTemp)
                print($0.msrDate)
                print($0.siteID)
            }
        }
        
        
    }.resume()
}



struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
