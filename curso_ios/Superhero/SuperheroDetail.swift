//
//  SuperheroDetail.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 13/11/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
    
    let id: String
    
    @State var hero: ApiNetwork.SuperherCompleted? = nil
    
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            if(isLoading) {
                ProgressView().tint(.white)
            } else if let hero  = hero{
                
                WebImage(url: URL(string: hero.image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                
                
                Text(hero.name)
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                
                ForEach(hero.biography.aliases, id: \.self) { alias in
                    Text(alias)
                        .foregroundColor(.gray)
                        .font(.title2)
                        .italic()
                }
                
                SuperheroStats(stats: hero.powerstats)
                
                Spacer()
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(.backgroundApp)
        .onAppear {
            Task {
                do {
                    hero = try await ApiNetwork().getSuperheroById(id: id)
                } catch {
                    print("Error!!!")
                }
            }
        }
    }
}

struct SuperheroStats: View {
    
    let stats: ApiNetwork.PowerStats
    
    var body: some View {
        VStack {
            
            Chart {
                
                SectorMark(
                    angle: .value("Count", Int(stats.combat) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(16)
                .foregroundStyle(by: .value("Category", "Combat"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.durability) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(16)
                .foregroundStyle(by: .value("Category", "Durability"))
                
                
                SectorMark(
                    angle: .value("Count", Int(stats.power) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(16)
                .foregroundStyle(by: .value("Category", "Power"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.speed) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(16)
                .foregroundStyle(by: .value("Category", "Speed"))
                
                
                SectorMark(
                    angle: .value("Count", Int(stats.intelligence) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(16)
                .foregroundStyle(by: .value("Category", "Intelligence"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.strength) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                )
                .cornerRadius(16)
                .foregroundStyle(by: .value("Category", "Strength"))
                
            }
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: 350)
        .background(.white)
        .cornerRadius(16)
        .padding(16)
    }
}

#Preview {
    SuperheroDetail(id: "1")
}
