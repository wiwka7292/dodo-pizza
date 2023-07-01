//
//  StoriesServices.swift
//  homeWorkMenu
//
//  Created by Жека on 12/03/2023.
//

import UIKit

class Story {
    var image: String
    
    init(image: String) {
        self.image = image
    }
}

class StoriesServiсe{
    var stories = [
        Story(image: "story1"),
        Story(image: "story2"),
        Story(image: "story3"),
        Story(image: "story1"),
        Story(image: "story2"),
        Story(image: "story3")
        
    ]
    
    func fetchProducts() -> [Story] {
        
        return stories
    }
}
