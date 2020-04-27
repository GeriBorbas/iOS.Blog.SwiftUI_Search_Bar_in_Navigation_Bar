//
//  ContentView.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 04. 27..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI



struct ContentView: View
{
    
    
    var planets = ["Mercury", "Venus", "Earth", "Mars", "Ceres", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto", "Haumea", "Makemake", "Eris"]
    @State var searchText: String = ""
    
    
    var body: some View
    {
        NavigationView
        {
            List
            {                
                ForEach(planets.filter{ searchText.isEmpty || $0.localizedStandardContains(searchText) }, id: \.self)
                {
                    eachPlanet in
                    Text(eachPlanet)
                }
            }
                .navigationBarTitle("Planets")
                .overlay(
                    ViewControllerResolver
                    {
                        viewController in
                        viewController.navigationItem.searchController = UISearchController(searchResultsController: nil)
                    }
                        .frame(width: 0, height: 0)
                )
        }
    }
}
