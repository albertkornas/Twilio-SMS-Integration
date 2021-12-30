//
//  VerifyPage.swift
//  TwilioSample
//
//  Created by Albert Kornas on 12/29/21.
//

import SwiftUI

struct VerifyView: View {
    @EnvironmentObject var model: VerificationModel
    @State var codeInput: String
    @State var resultMessage: String?
    @State var countryCode: String?
    @State var phoneNumber: String?
    @State var errorMessage: String = ""

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Enter the verification code sent to your phone number")
            TextField("Verification code", text: $codeInput)
            NavigationLink(destination: ResultView(resultMessage: resultMessage)) {
                Text("Submit code")
            }.simultaneousGesture(TapGesture().onEnded{
                model.smsVerified = true
                VerifyAPI.validateVerificationCode(self.countryCode ?? "", self.phoneNumber ?? "", codeInput) { checked in
                                if (checked.success) {
                                    resultMessage = "Success! Your phone number is now verified"
                                   
                                } else {
                                    self.errorMessage = checked.message
                                }
                    }
            })
            Text(errorMessage)
        }.environmentObject(model)
    }
}
