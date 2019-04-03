
    import Foundation
    import SpriteKit

    /**
        The game level that manages all game objects.
    */
    class Level
    {
        /** Level width in px. */
        static let WIDTH  :Int = 5120
        /** Level height in px. */
        static let HEIGHT :Int = 720

        /** Non collidable decoration. */
        private var decos  :[GameObject]
        /** Collidable static walls. */
        private var walls  :[GameObject]
        /** Collidable dynamic boxes objects. */
        private var boxes  :[GameObject]
        /** Collectable game items. */
        private var items  :[GameObject]

        /** The game object being controlled by the user. */
        private var player :Player

        /**
            Creates a new instance of the game level.
            Adds all game objects from farest to nearest.

            - parameter scene: The custom implementation of the SKScene.
        */
        init( scene: SKScene )
        {
            decos = []
            walls = []
            boxes = []
            items = []

            // background decoration
            decos.append( GameObject( scene: scene, x: 0,    y: 0, imageFile: "sky.png",        physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 1280, y: 0, imageFile: "sky.png",        physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 2560, y: 0, imageFile: "sky.png",        physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 3840, y: 0, imageFile: "sky.png",        physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 0,    y: 0, imageFile: "background.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 1280, y: 0, imageFile: "background.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 2560, y: 0, imageFile: "background.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 3840, y: 0, imageFile: "background.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 0,    y: 0, imageFile: "middle.png",     physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 1280, y: 0, imageFile: "middle.png",     physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 2560, y: 0, imageFile: "middle.png",     physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 3840, y: 0, imageFile: "middle.png",     physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 0,    y: 0, imageFile: "foreground.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 1280, y: 0, imageFile: "foreground.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 2560, y: 0, imageFile: "foreground.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 3840, y: 0, imageFile: "foreground.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 5120, y: 0, imageFile: "foreground.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 0,    y: 0, imageFile: "ground.png",     physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 1280, y: 0, imageFile: "ground.png",     physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 2560, y: 0, imageFile: "ground.png",     physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 3840, y: 0, imageFile: "ground.png",     physic: Physic.none ) )

            // stones
            walls.append( GameObject( scene: scene, x: 1545, y: -25, imageFile: "ice1.png",   physic: Physic.wall ) )
            walls.append( GameObject( scene: scene, x: 1500, y: -5,  imageFile: "stone1.png", physic: Physic.wall ) )
            walls.append( GameObject( scene: scene, x: 2875, y: 0,   imageFile: "ice2.png",   physic: Physic.wall ) )
            walls.append( GameObject( scene: scene, x: 2800, y: 0,   imageFile: "stone2.png", physic: Physic.wall ) )
            walls.append( GameObject( scene: scene, x: 4100, y: 0,   imageFile: "ice3.png",   physic: Physic.wall ) )
            walls.append( GameObject( scene: scene, x: 4150, y: -30, imageFile: "stone3.png", physic: Physic.wall ) )

            // boxes
            boxes.append( GameObject( scene: scene, x: 2100, y: 0,   imageFile: "box1.png", physic: Physic.box ) )
            boxes.append( GameObject( scene: scene, x: 3100, y: 0,   imageFile: "box2.png", physic: Physic.box ) )
            boxes.append( GameObject( scene: scene, x: 3228, y: 0,   imageFile: "box1.png", physic: Physic.box ) )
            boxes.append( GameObject( scene: scene, x: 3356, y: 0,   imageFile: "box2.png", physic: Physic.box ) )
            boxes.append( GameObject( scene: scene, x: 3164, y: 128, imageFile: "box1.png", physic: Physic.box ) )
            boxes.append( GameObject( scene: scene, x: 3292, y: 128, imageFile: "box2.png", physic: Physic.box ) )
            boxes.append( GameObject( scene: scene, x: 3228, y: 256, imageFile: "box1.png", physic: Physic.box ) )

            // items
            items.append( GameObject( scene: scene, x: 500,  y: 200, imageFile: "raspberry.png",  physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 625,  y: 200, imageFile: "raspberry.png",  physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 750,  y: 200, imageFile: "raspberry.png",  physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 1500, y: 200, imageFile: "blackberry.png", physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 1625, y: 200, imageFile: "blackberry.png", physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 1500, y: 300, imageFile: "blackberry.png", physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 1625, y: 300, imageFile: "blackberry.png", physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 1500, y: 400, imageFile: "blackberry.png", physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 1625, y: 400, imageFile: "blackberry.png", physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 3000, y: 200, imageFile: "peach.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 3100, y: 300, imageFile: "peach.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 3200, y: 400, imageFile: "peach.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 3350, y: 400, imageFile: "plum.png",       physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 3450, y: 300, imageFile: "plum.png",       physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 3550, y: 200, imageFile: "plum.png",       physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4350, y: 200, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4500, y: 200, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4650, y: 200, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4800, y: 200, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4950, y: 200, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4350, y: 300, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4500, y: 300, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4650, y: 300, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4800, y: 300, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4950, y: 300, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4350, y: 400, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4500, y: 400, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4650, y: 400, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4800, y: 400, imageFile: "apple.png",      physic: Physic.none ) )
            items.append( GameObject( scene: scene, x: 4950, y: 400, imageFile: "apple.png",      physic: Physic.none ) )

            // player
            player = Player( scene: scene, x: 250, y: 0 )

            // foreground decoration
            decos.append( GameObject( scene: scene, x: 500,  y: 0, imageFile: "mushroom2.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 750,  y: 0, imageFile: "bush1.png",     physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 1900, y: 0, imageFile: "mushroom1.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 2350, y: 0, imageFile: "flower1.png",   physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 3750, y: 0, imageFile: "mushroom2.png", physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 3900, y: 0, imageFile: "flower2.png",   physic: Physic.none ) )
            decos.append( GameObject( scene: scene, x: 4400, y: 0, imageFile: "bush2.png",     physic: Physic.none ) )

            // level bounds
            createLevelBounds( scene: scene )

            // randomize item startup rotation
            for item in items
            {
                item.node.zRotation = CGFloat.random( in: 0...360 )
            }
        }

        /**
            Renders one game loop cycle for the level.

            - parameter keySystem: The app's key system to determine currently pressed keys.
        */
        func render( keySystem: KeySystem ) -> Void
        {
            // render the player
            player.render( keySystem: keySystem )

            // rotate all items
            for item in items
            {
                item.node.zRotation += 0.01
            }

            // check target overlap for all items
            player.checkItemCollision( items: items )
        }

        /**
            Returns the current poistion of the player node.

            - return: The point of the current player position.
        */
        func getPlayerPosition() -> CGPoint
        {
            return player.node.position
        }

        /**
            Applies parallax scrolling to all 'foreground' layers.

            This is a specimen for Techncial Debt. The method adds functionality
            at the cost of a very brittleness implementation.

            - parameter camera: The SpriteKit camera to get the current position from.
        */
        func applyParallaxScrolling( camera: SKCameraNode ) -> Void
        {
            var cameraX        = camera.position.x
            let halfSceneWidth = CGFloat( Scene.WIDTH / 2 )

            if ( cameraX < halfSceneWidth )
            {
                cameraX = halfSceneWidth
            }
            else if ( cameraX > CGFloat( Level.WIDTH ) - halfSceneWidth )
            {
                cameraX = CGFloat( Level.WIDTH ) - halfSceneWidth
            }

            let parallaxScrollX = -( cameraX / 20 )

            // applies parallax scrolling to all 'foreground' layers.
            decos[ 12 ].node.position.x = parallaxScrollX + 0
            decos[ 13 ].node.position.x = parallaxScrollX + 1280
            decos[ 14 ].node.position.x = parallaxScrollX + 2560
            decos[ 15 ].node.position.x = parallaxScrollX + 3840
            decos[ 16 ].node.position.x = parallaxScrollX + 5120
        }

        /**
            Creates the four level bounds that surround this level.

            - parameter scene: The SpriteKit scene to apply the level bounds to.
        */
        private func createLevelBounds( scene:SKScene ) -> Void
        {
            let physicsBodies :[SKPhysicsBody] = [
                SKPhysicsBody( edgeFrom: CGPoint( x: 0,           y: 0            ), to: CGPoint( x: Level.WIDTH, y: 0            ) ),
                SKPhysicsBody( edgeFrom: CGPoint( x: 0,           y: 0            ), to: CGPoint( x: 0,           y: Level.HEIGHT ) ),
                SKPhysicsBody( edgeFrom: CGPoint( x: Level.WIDTH, y: 0            ), to: CGPoint( x: Level.WIDTH, y: Level.HEIGHT ) ),
                SKPhysicsBody( edgeFrom: CGPoint( x: 0,           y: Level.HEIGHT ), to: CGPoint( x: Level.WIDTH, y: Level.HEIGHT ) ),
            ]

            for physicsBody in physicsBodies
            {
                let ground = SKShapeNode()

                ground.physicsBody = physicsBody
                ground.physicsBody?.friction = 0.0

                scene.addChild( ground )
            }
        }
    }
