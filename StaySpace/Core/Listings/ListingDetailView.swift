//
//  ListingDetailView.swift
//  StaySpace
//
//  Created by PrashantDixit on 05/05/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            ScrollView {
                ZStack(alignment: .topLeading) {
                    ListingImageCarouselView()
                        .frame(height: 320)
                    
                    Button(action: {
                       dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .background {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 36, height: 36)
                            }
                            .padding(32)
                    })
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Miami Villa")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 2) {
                            Image(systemName: "star.fill")
                            Text("4.35")
                            Text("-")
                            Text("28 reviews")
                                .underline()
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        
                        .foregroundStyle(.black)
                        
                        Text("Miami, Florida")
                    }
                    .font(.caption)
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                // host info view
                HStack {
                    VStack(alignment: .leading) {
                        Text("Entire villa hosted by")
                            .font(.headline)
                        Text("John Smith")
                            .font(.headline)
                        
                        HStack(spacing: 2) {
                            Text("4 guests -")
                            Text("4 bedrooms -")
                            Text("4 beds -")
                            Text("3 baths")
                        }
                        .font(.caption)
                    }
                    
                    Spacer()
                    
                    Image("listing-1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                .padding()
                
                Divider()
                
                // listing features
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(0 ..< 2) { feature in
                        HStack(spacing: 12) {
                            Image(systemName: "medal")
                            
                            VStack(alignment: .leading) {
                                Text("Superhost")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                
                                Text("Superhosts are experience, highly rated hosts who are commited to provided great stars for guests")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                        }
                    }
                }
                .padding()
                
                Divider()
                
                //bedrooms view
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll sleep")
                        .font(.headline)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(1 ..< 7) { bedroom in
                                VStack {
                                    Image(systemName: "bed.double")
                                    Text("Bedroom \(bedroom)")
                                }
                                .padding(24)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                    }
                    .scrollTargetBehavior(.paging)
                }
                .padding()
                
                Divider()
                
                // listing amenities
                VStack(alignment: .leading, spacing: 16, content: {
                    Text("What this place offers")
                        .font(.headline)
                    
                    ForEach(0 ..< 5) { feature in
                        HStack {
                            Image(systemName: "wifi")
                                .frame(width: 32)
                            
                            Text("Wifi")
                                .font(.footnote)
                            
                            Spacer()
                        }
                    }
                })
                .padding()
                
                Divider()
                
                //map view
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll be")
                        .font(.headline)
                    
                    Map()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
                
            }
            .ignoresSafeArea()
            .padding(.bottom, 84)
            .overlay(alignment: .bottom) {
                VStack {
                    Divider()
                        .padding()
                    
                    HStack {
                        VStack(alignment: .leading) {
                           Text("$500")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Total before taxes")
                                .font(.footnote)
                            
                            Text("Oct 15-20")
                                .underline()
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Reserve")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 140, height: 40)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                    }
                    .padding(.horizontal, 32)
                }
                .background(.white)
            }
    }
}

#Preview {
    ListingDetailView()
}
