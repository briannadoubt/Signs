//
//  ContentView.swift
//  Shared
//
//  Created by Bri on 2/1/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    var signs: [Sign]
    var loadSigns: () async throws -> ()
    
    fileprivate let displayingMessageValue = "DISPLAYING_MESSAGE"
    
    var sortedSigns: [Sign] {
        signs.sorted(by: { $0.lastUpdated > $1.lastUpdated })
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedSigns) { sign in
                    if sign.status == displayingMessageValue {
                        let lines = sign.display.pages.map({ $0.lines.joined(separator: " ") }).joined(separator: " ").replacingOccurrences(of: "  ", with: " ")
                        NavigationLink {
                            List {
                                Text(lines)
                            }
                            .navigationTitle("Message")
                        } label: {
                            Text(sign.name)
                                .foregroundColor(.primary)
                        }
                    } else {
                        Text(sign.name)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        Task {
                            do {
                                try await loadSigns()
                            } catch {
                                // TODO: Handle errors in UI
                                assertionFailure(error.localizedDescription)
                            }
                        }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }
            }
            #if !os(watchOS)
            .listStyle(.sidebar)
            #endif
            .navigationTitle("Signs")
            .refreshable {
                do {
                    try await loadSigns()
                } catch {
                    // TODO: Handle errors in UI
                    assertionFailure(error.localizedDescription)
                }
            }
        }
        .task {
            do {
                try await loadSigns()
            } catch {
                // TODO: Handle errors in UI
                assertionFailure(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignsHandler { signs, loadSigns in
            ContentView(signs: signs, loadSigns: loadSigns)
        }
    }
}
