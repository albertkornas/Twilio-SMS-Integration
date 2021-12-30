//
//  VerificationModel.swift
//  TwilioSample
//
//  Created by Albert Kornas on 12/29/21.
//

import Foundation
import SwiftUI

class VerificationModel: ObservableObject {
    @Published var smsVerified: Bool = false
}

