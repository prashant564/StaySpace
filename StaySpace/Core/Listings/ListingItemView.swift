//
//  ListingItemView.swift
//  StaySpace
//
//  Created by PrashantDixit on 04/05/24.
//

import SwiftUI

struct ListingItemView: View {

    var body: some View {
        VStack(spacing: 8){
            //images
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //listing details
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Maimi Florida")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3-10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$23")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .font(.footnote)
                    .foregroundColor(.black)
                    
                }
                
                Spacer()

                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.35")
                }
                .foregroundColor(.black)
                    
            }
        }
    }
}

#Preview {
    ListingItemView()
}
