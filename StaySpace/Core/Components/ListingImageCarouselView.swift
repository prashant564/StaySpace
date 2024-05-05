//
//  ListingImageCarouselView.swift
//  StaySpace
//
//  Created by PrashantDixit on 05/05/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .scaledToFit()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}
