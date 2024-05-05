//
//  ExploreView.swift
//  StaySpace
//
//  Created by PrashantDixit on 04/05/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            VStack {
                SearchAndFilterBar()
                
                ScrollView {
                    LazyVStack(spacing: 32) {
                        ForEach(0 ... 10, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                                     .frame(height: 420)
                                     .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                           
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
