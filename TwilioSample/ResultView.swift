//
//  ResultView.swift
//  TwilioSample
//
//  Created by Albert Kornas on 12/29/21.
//

import SwiftUI

struct ResultView: View {
    @State var resultMessage: String?
    var body: some View {
        Text(resultMessage ?? "Something went wrong")
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
