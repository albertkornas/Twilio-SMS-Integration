//
//  VerifyPage.swift
//  TwilioSample
//
//  Created by Albert Kornas on 12/29/21.
//

import SwiftUI

struct VerifyView: View {
    @State var codeInput: String
    @State var resultMessage: String?
    @State var countryCode: String?
    @State var phoneNumber: String?
    @State var errorMessage: String = ""
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Enter the verification code sent to your phone number")
            TextField("Verification code", text: $codeInput)
            Button("Verify text", action: {
                VerifyAPI.validateVerificationCode(self.countryCode ?? "", self.phoneNumber ?? "", codeInput) { checked in
                                if (checked.success) {
                                    resultMessage = checked.message
                                } else {
                                    self.errorMessage = checked.message
                                }
                    }
            })
            Text(errorMessage)
        }
    }
}

struct VerifyView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyView(codeInput: "123456")
    }
}
