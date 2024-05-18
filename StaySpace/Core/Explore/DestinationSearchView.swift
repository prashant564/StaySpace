//
//  DestinationSearchView.swift
//  StaySpace
//
//  Created by PrashantDixit on 17/05/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var showDestinationSearchView : Bool
    @State private var destination =  ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var fromDate = Date()
    @State private var toDate = Date()
    @State private var numOfGuests = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    withAnimation(.snappy) {
                        showDestinationSearchView.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                })
                    
                Spacer()
                    
                if !destination.isEmpty {
                    Button("Clear") {
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destination", text: $destination)
                            .font(.headline)
                            
                    }
                    .frame(height: 44, alignment: .leading)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
                
            }
            .modifier(CollapsableViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selectedOption = .location
                }
                
            }

            // date selection view
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $fromDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $toDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsableViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selectedOption = .dates
                }
            }
        
            // num guests view
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numOfGuests) Adults")
                    } onIncrement: {
                        numOfGuests += 1
                    } onDecrement: {
                        guard numOfGuests > 0 else { return }
                        numOfGuests -= 1
                    }
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsableViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selectedOption = .guests
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(showDestinationSearchView: .constant(false))
}

struct CollapsableViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        }
    }
}
