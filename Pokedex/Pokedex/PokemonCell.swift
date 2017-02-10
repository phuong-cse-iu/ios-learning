//
//  PokemonCell.swift
//  Pokedex
//
//  Created by TranTPhuong on 12/22/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    @IBOutlet weak var pokemonThumb: UIImageView!
    @IBOutlet weak var lblPokemonName: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon) {
        lblPokemonName.text = pokemon.name
        pokemonThumb.image = UIImage(named: "\(pokemon.pokedexId)")
    }
}
