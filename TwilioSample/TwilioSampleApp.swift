//
//  TwilioSampleApp.swift
//  TwilioSample
//
//  Created by Albert Kornas on 12/29/21.
//

import SwiftUI

@main
struct TwilioSampleApp: App {
    @StateObject var model = VerificationModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
