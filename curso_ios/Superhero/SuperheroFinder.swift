//
//  SuperheroFinder.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 11/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroFinder: View {
    
    @State var text: String = ""
    
    @State var heroResponse: ApiNetwork.HeroResponse? = nil
    
    @State var isLoading: Bool = false
    
    var body: some View {
        
        VStack {
            
            TextField(
                "",
                text: $text,
                prompt: Text("Search...")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.gray)
            )
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .padding(16)
            .border(.purple, width: 0.5)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                isLoading = true
                Task { /*@MainActor in*/
                    do {
                        heroResponse = try await ApiNetwork().getHeroesByQuery(query: text)
                    } catch {
                        print("Error!!!")
                    }
                    isLoading = false
                }
                
            }
            
            if(isLoading) {
                Spacer()
                ProgressView()
                    .tint(.white)
                Spacer()
            }
            
            NavigationStack {
                List(heroResponse?.results ?? []) { hero in
                    ZStack {
                        SuperheroItem(hero: hero)
                        NavigationLink(destination: SuperheroDetail(id: hero.id))
                        {EmptyView()}
                            .opacity(0)
                    }
                    .listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

struct SuperheroItem: View {
    
    let hero: ApiNetwork.Superhero
    
    var body: some View {
        ZStack {
            //Rectangle()
            
            WebImage(url: URL(string: hero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            
            VStack {
                Spacer()
                Text(hero.name)
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }
        .frame(height: 200)
        .cornerRadius(32)
        //.listRowBackground(Color.backgroundApp)
    }
}

#Preview {
    SuperheroFinder()
}
