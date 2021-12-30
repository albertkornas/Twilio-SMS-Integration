//
//  ResultView.swift
//  TwilioSample
//
//  Created by Albert Kornas on 12/29/21.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var model: VerificationModel
    @State var resultMessage: String?
    var body: some View {
        Text(String(model.smsVerified == true ? "Your phone number is now verified!" : "Something went wrong"))
    }
}
