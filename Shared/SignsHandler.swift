//
//  SignsHandler.swift
//  CastleRockCodeChallenge2022
//
//  Created by Bri on 2/1/22.
//

import SwiftUI

struct SignsHandler<Content: View>: View {
    
    @ViewBuilder var content: (_ signs: [Sign], _ refresh: @escaping () async throws -> ()) -> Content
    
    @StateObject var observer = SignsObserver()
    
    var body: some View {
        content(observer.signs, observer.getSigns)
    }
}

struct SignsHandler_Previews: PreviewProvider {
    static var previews: some View {
        SignsHandler() { signs, refresh in
            ContentView(signs: signs, loadSigns: refresh)
        }
    }
}
