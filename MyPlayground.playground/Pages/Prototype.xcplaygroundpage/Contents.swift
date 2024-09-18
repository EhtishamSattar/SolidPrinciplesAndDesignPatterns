//: [Previous](@previous)

import Foundation

//   The Prototype Design Pattern allows you to create new objects by copying (or "cloning") existing objects rather than creating new instances from scratch. This pattern is particularly useful when object creation is expensive, or when a large number of similar objects are needed.
//


//   Real-World Example: Document Cloning in an Office Suite (e.g., Microsoft Word)
//
// In a word processing software like Microsoft Word, users often need to create new documents that are similar to an existing one, such as:
//
//Creating a new letter based on a previous template.
//Duplicating a formatted report for a different client.
//Copying and modifying a document with custom headers, footers, fonts, and styles.
//Manually recreating a similar document from scratch would be inefficient and error-prone. Instead, the Prototype Pattern can be used to "clone" an existing document and make modifications as needed.

protocol Prototype {
    func clone() -> Prototype
}

enum PatrolBehaviorType {
    case land
    case air
    case underground
}

class AIPatrolCharacter: Prototype {
    
    // MARK: - Properties
    
    private(set) var name: String
    private var sprite: SKSpriteNode?
    var patrolBehaviorType: PatrolBehaviorType
    
    // MARK: - Initializers
    
    init(name: String, sprite: SKSpriteNode?, patrolBehaviorType: PatrolBehaviorType) {
        self.name = name
        self.sprite = sprite
        self.patrolBehaviorType = patrolBehaviorType
    }
    
    // MARK: - Conformance to Prototype prtocol
    
    func clone() -> Prototype {
        return AIPatrolCharacter(name: name, sprite: sprite, patrolBehaviorType: patrolBehaviorType)
    }
}

let landPatroller = AIPatrolCharacter(name: "Patroller", sprite: SKSpriteNode(fileNamed: "Patroller.png"), patrolBehaviorType: .land)
// Land Patroller:  name: Patroller, sprite: nil, patrol behavior type: land

// Prototype the AI character for air:
let airPatroller = landPatroller.clone() as? AIPatrolCharacter // here we just cloneed the landPatroller and changed its duty to Air patroller
airPatroller?.patrolBehaviorType = .air
// Air Patroller:  Optional(name: Patroller, sprite: nil, patrol behavior type: air)


