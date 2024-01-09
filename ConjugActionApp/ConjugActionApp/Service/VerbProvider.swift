//
//  verbProvider.swift
//  ConjugActionApp
//
//  Created by Bruno Lopes on 2023-11-26.
//

import Foundation

class VerbProvider{
        
    static func toStringIndicatifPresent(inputVerb: FrenchVerbIndicatifPresent) -> String{
        
        var conjugation = ""
        
        conjugation += "\(inputVerb.i ?? "not applied")\n"
        conjugation += "\(inputVerb.you ?? "not applied")\n"
        conjugation += "\(inputVerb.heSheIt ?? "not applied")\n"
        conjugation += "\(inputVerb.we ?? "not applied")\n"
        conjugation += "\(inputVerb.youAll ?? "not applied")\n"
        conjugation += "\(inputVerb.they ?? "not applied")"
            
        return conjugation
        
    }
    
    static func toStringIndicatifPasseSimple(inputVerb: FrenchVerbIndicatifPasseSimple) -> String{
        
        var conjugation = ""
        
        conjugation += "\(inputVerb.i ?? "not applied")\n"
        conjugation += "\(inputVerb.you ?? "not applied")\n"
        conjugation += "\(inputVerb.heSheIt ?? "not applied")\n"
        conjugation += "\(inputVerb.we ?? "not applied")\n"
        conjugation += "\(inputVerb.youAll ?? "not applied")\n"
        conjugation += "\(inputVerb.they ?? "not applied")"
            
        return conjugation
        
    }
    
    static func toStringIndicatifImparfait(inputVerb: FrenchVerbIndicatifImparfait) -> String{
        
        var conjugation = ""
        
        conjugation += "\(inputVerb.i ?? "not applied")\n"
        conjugation += "\(inputVerb.you ?? "not applied")\n"
        conjugation += "\(inputVerb.heSheIt ?? "not applied")\n"
        conjugation += "\(inputVerb.we ?? "not applied")\n"
        conjugation += "\(inputVerb.youAll ?? "not applied")\n"
        conjugation += "\(inputVerb.they ?? "not applied")"
            
        return conjugation
        
    }
    
    static func toStringIndicatifFuturAnterieur(inputVerb: FrencVerbIndicatifFuturAnterieur) -> String{
        
        var conjugation = ""
        
        conjugation += "\(inputVerb.i ?? "not applied")\n"
        conjugation += "\(inputVerb.you ?? "not applied")\n"
        conjugation += "\(inputVerb.heSheIt ?? "not applied")\n"
        conjugation += "\(inputVerb.we ?? "not applied")\n"
        conjugation += "\(inputVerb.youAll ?? "not applied")\n"
        conjugation += "\(inputVerb.they ?? "not applied")"
            
        return conjugation
        
    }
    
    static func toStringIndicatifPasseCompose(inputVerb: FrencVerbIndicatifPasseCompose) -> String{
        
        var conjugation = ""
        
        conjugation += "\(inputVerb.i ?? "not applied")\n"
        conjugation += "\(inputVerb.you ?? "not applied")\n"
        conjugation += "\(inputVerb.heSheIt ?? "not applied")\n"
        conjugation += "\(inputVerb.we ?? "not applied")\n"
        conjugation += "\(inputVerb.youAll ?? "not applied")\n"
        conjugation += "\(inputVerb.they ?? "not applied")"
            
        return conjugation
        
    }
    
    static func toStringIndicatifFuturSimple(inputVerb: FrencVerbIndicatifFuturSimple) -> String{
        
        var conjugation = ""
        
        conjugation += "\(inputVerb.i ?? "not applied")\n"
        conjugation += "\(inputVerb.you ?? "not applied")\n"
        conjugation += "\(inputVerb.heSheIt ?? "not applied")\n"
        conjugation += "\(inputVerb.we ?? "not applied")\n"
        conjugation += "\(inputVerb.youAll ?? "not applied")\n"
        conjugation += "\(inputVerb.they ?? "not applied")"
            
        return conjugation
        
    }
    
    static func toStringIndicatifPasseAnterieur(inputVerb: FrencVerbIndicatifPasseAnterieur) -> String{
        
        var conjugation = ""
        
        conjugation += "\(inputVerb.i ?? "not applied")\n"
        conjugation += "\(inputVerb.you ?? "not applied")\n"
        conjugation += "\(inputVerb.heSheIt ?? "not applied")\n"
        conjugation += "\(inputVerb.we ?? "not applied")\n"
        conjugation += "\(inputVerb.youAll ?? "not applied")\n"
        conjugation += "\(inputVerb.they ?? "not applied")"
            
        return conjugation
        
    }
    
    static func toStringIndicatifPlusQueParfait(inputVerb: FrencVerbIndicatifPlusQueParfait) -> String{
        
        var conjugation = ""
        
        conjugation += "\(inputVerb.i ?? "not applied")\n"
        conjugation += "\(inputVerb.you ?? "not applied")\n"
        conjugation += "\(inputVerb.heSheIt ?? "not applied")\n"
        conjugation += "\(inputVerb.we ?? "not applied")\n"
        conjugation += "\(inputVerb.youAll ?? "not applied")\n"
        conjugation += "\(inputVerb.they ?? "not applied")"
            
        return conjugation
        
    }

}
