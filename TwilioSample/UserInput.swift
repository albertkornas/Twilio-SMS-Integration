//
//  ContentView.swift
//  TwilioSample
//
//  Created by Albert Kornas on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    @State var countryCode: String = ""
    @State var phoneNumber: String = ""
    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            TextField("Country code", text: $countryCode)
            TextField("Phone Number", text: $phoneNumber)
            Button("Send code", action: {
                    sendVerificationCode(countryCode, phoneNumber)
            }
            )
        }
        .padding()
    }
}

func sendVerificationCode(_ countryCode: String, _ phoneNumber: String) {
    print("sending verification code")
    let configPath = Bundle.main.path(forResource: "Config", ofType: "plist")
    let config = NSDictionary(contentsOfFile: configPath!)
    let baseURLString = config!["serverUrl"] as! String
    
       let parameters = [
           "via": "sms",
           "country_code": countryCode,
           "phone_number": phoneNumber
       ]
       
       let path = "start"
       let method = "POST"
       
       let urlPath = "\(baseURLString)/\(path)"
       var components = URLComponents(string: urlPath)!
       
       var queryItems = [URLQueryItem]()
       
       for (key, value) in parameters {
           let item = URLQueryItem(name: key, value: value)
           queryItems.append(item)
       }
       
       components.queryItems = queryItems
       
       let url = components.url!
       
       var request = URLRequest(url: url)
       request.httpMethod = method
       
       let session: URLSession = {
           let config = URLSessionConfiguration.default
           return URLSession(configuration: config)
       }()
       
       let task = session.dataTask(with: request) {
           (data, response, error) in
           if let data = data {
               do {
                   let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                   
                   print(jsonSerialized!)
               }  catch let error as NSError {
                   print(error.localizedDescription)
               }
           } else if let error = error {
               print(error.localizedDescription)
           }
       }
       task.resume()
   }

struct ContentView_Previews: PreviewProvider {
    @State var codePreview:String = "1"
    @State var numberPreview:String = "1234567890"
    static var previews: some View {
        ContentView(countryCode: "1", phoneNumber:"1234567890")
    }
}
