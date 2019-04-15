
    import Foundation
    import SpriteKit

    /**
        The parent class of all entities that appear in the game.
     */
    class GameObject
    {
        /** The SpriteKit node that represents this game object in the SpriteKit scene. */
        internal var node :SKSpriteNode

        /**
            Creates a new game object.

            - parmeter scene:  The SpriteKit scene to add this game object to.
            - parmeter x:      The startup position x.
            - parmeter y:      The startup position y.
            - parmeter physic: Physical attributes for this game object.
        */
        init( scene: SKScene, x: CGFloat, y: CGFloat, imageFile: String, physic: Physic )
        {
            // load image file
            let image   = NSImage( named: imageFile )!
            let texture = SKTexture( image: image )

            // create SpriteKit node
            node          = SKSpriteNode( texture: texture )
            node.size     = texture.size()
            node.position = CGPoint(
                x: x + ( node.size.width  / 2 ),
                y: y + ( node.size.height / 2 )
            )

            // add a physical body if enabled
            if ( physic.enabled )
            {
                self.addPhysicsBody( physic: physic )
            }

            // add SpriteKit node to the SpriteKit scene
            scene.addChild( node )
        }

        /**
            Creates the physical body for this game object.

            - parameter physic: The physical behaviour to apply to this game object.
        */
        private func addPhysicsBody( physic: Physic ) -> Void
        {
            node.physicsBody = SKPhysicsBody( texture: node.texture!, size: node.size )

            node.physicsBody?.isDynamic   = physic.isDynamic

//            node.physicsBody?.affectedByGravity = false

            node.physicsBody?.mass        = physic.mass
            node.physicsBody?.restitution = physic.restitution
            node.physicsBody?.friction    = physic.friction

            node.physicsBody?.usesPreciseCollisionDetection = true
        }

        /**
            Determines if this game object is vertical resting.

            - returns: *true* if this game object is neither descending nor falling.
                       *false* if the game object is in vertical movement or has no physical body at all.
        */
        internal func isVerticalResting() -> Bool
        {
            guard let physicsBody = node.physicsBody else { return false }

            let RESTING_TOLERANCE:CGFloat = 1.0

            return (
                physicsBody.velocity.dy <= RESTING_TOLERANCE
                && physicsBody.velocity.dy >= -RESTING_TOLERANCE
            )
        }
    }
