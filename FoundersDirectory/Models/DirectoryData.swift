//
//  DirectoryData.swift
//  FoundersDirectory
//
//  Created by Victor Lazaro on 9/23/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import Foundation
import UIKit

class DirectoryData {
    
    private init() {}
    
    static let sharedInstance = DirectoryData()
    
    var foundersData: [Int:Founder] = [0:
        Founder(firstName: "Chewbacca", lastName: "Wookiee", fullName: "Chewie Wookiee", preferredName: "Chewie", phone: "801-473-8981", email: "chewie@gmail.com", bio: "Chewbacca, nicknamed \"Chewie\", is a fictional character in the Star Wars franchise. He is a Wookiee, a tall, hirsute biped and intelligent species from the planet Kashyyyk. Chewbacca is the loyal friend and associate of Han Solo, and serves as co-pilot on Solo's ship, the Millenium Falcon.", status: "Gold", year: "1984", address: "125 Sailing Along Now", image: UIImage(named: "founder1")!, spouse: nil, companyName: "Chewie's"),
                            1: Founder(firstName: "Leia", lastName: "Princess", fullName: "Leia Organa", preferredName: "Your Highness", phone: "385-555-1212", email: "leia@gmail.com", bio: "Princess Leia Organa of Alderaan (also Senator Leia Organa or General Leia Organa) is a fictional character in the Star Wars franchise, portrayed in films by Carrie Fisher. Introduced in the original Star Wars film in 1977, Leia is princess of the planet Alderaan, a member of the Imperial Senate and an agent of the Rebel Alliance. She thwarts the sinister Sith Lord Darth Vader and helps bring about the destruction of the Empire's cataclysmic superweapon, the Death Star. In The Empire Strikes Back (1980), Leia commands a Rebel base and evades Vader as she falls in love with the smuggler, Han Solo. In Return of the Jedi (1983), Leia leads the operation to rescue Han from the crime lord Jabba the Hutt, and is revealed to be Vader's daughter and the twin sister of Luke Skywalker. The prequel film Revenge of the Sith (2005) establishes that the twins' mother is Senator (and former queen) Padmé Amidala of Naboo, who dies after childbirth. Leia is adopted by Senator Bail and Queen Breha Organa of Alderaan. In The Force Awakens (2015), Leia is the founder and General of the Resistance against the First Order and has a son with Han named Ben, who goes by the name Kylo Ren.", status: "Platinum", year: "1984", address: nil, image: UIImage(named: "founder2")!, spouse: "Han Solo", companyName: "The Senate"),
                            2: Founder(firstName: "Han", lastName: "Solo", fullName: "Han Solo", preferredName: "Han", phone: "214-555-1212", email: "han@gmail.com", bio: "Han Solo is a character in the Star Wars franchise. In the original film trilogy, Han and his co-pilot, Chewbacca, became involved in the Rebel Alliance's struggle against the Galactic Empire. During the course of the Star Wars narrative, he becomes a chief figure in the Alliance and succeeding galactic governments. Star Wars creator George Lucas described the character as \"a loner who realizes the importance of being part of a group and helping for the common good\". Harrison Ford portrayed the character in the original Star Wars trilogy as well as The Force Awakens. Alden Ehrenreich will portray a young Han Solo in an upcoming, as yet untitled spinoff film.", status: "Silver", year: "1984", address: nil, image: UIImage(named: "founder3")!, spouse: "Leia Organa", companyName: "The Rebel Alliance"),
                            3:Founder(firstName: "Luke", lastName: "Skywalker", fullName: "Luke Skywalker", preferredName: "Luke", phone: "408-555-1212", email: "luke@gmail.com", bio: "Luke Skywalker is a fictional character and the main protagonist of the original film trilogy of the Star Wars franchise created by George Lucas. The character, portrayed by Mark Hamill, is an important figure in the Rebel Alliance's struggle against the Galactic Empire. He is the twin brother of Rebellion leader Princess Leia Organa of Alderaan, a friend and brother-in-law of smuggler Han Solo, an apprentice to Jedi Masters Obi-Wan \"Ben\" Kenobi and Yoda, the son of fallen Jedi Anakin Skywalker (Darth Vader) and Queen of Naboo/Republic Senator Padmé Amidala and maternal uncle of Kylo Ren / Ben Solo. The now non-canon Star Wars expanded universe depicts him as a powerful Jedi Master, husband of Mara Jade, the father of Ben Skywalker and maternal uncle of Jaina, Jacen and Anakin Solo.", status: "Bronze", year: "1984", address: nil, image: UIImage(named: "founder4")!, spouse: nil, companyName: "The Force")]
}
