//
//  ProfileHeader.swift
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 27/12/2024.
//
import SwiftUI

struct ProfileHeader: View {
    let userProfile: UserProfile
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(.secondary)
            Text("\(userProfile.name)")
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    @Previewable @State var userProfile = UserProfile.defaultProfile()
    
    List {
        ProfileHeader(userProfile: userProfile)
    }
}
