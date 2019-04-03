
    import SpriteKit
    import Foundation

    /**
        The custom SpriteKit scene.
    */
    class Scene : SKScene
    {
        /** The width of the scene. */
        static let WIDTH  :Int = 800
        /** The height of the scene. */
        static let HEIGHT :Int = 600

        /** The SpriteKit view reference. */
        var skView   :SKView
        /** The SpriteKit camera reference. */
        var skCamera :SKCameraNode
        /** A reference to the game loop. */
        var gameLoop :GameLoop?

        /**
            Creates the custom camera, adds it to the scene and assigns it to the SpriteKitScene.
        */
        override init()
        {
            skView = SKView()
            skCamera = SKCameraNode()

            super.init( size: ( CGSize( width: Scene.WIDTH, height: Scene.HEIGHT ) ) )

            skView.frame = self.frame
            skView.presentScene( self )
            skView.showsFPS = true

            addChild( skCamera )
            self.camera = skCamera
            constraintCamera()
        }

        /**
            This failable initializer is required to be specified in derived classes.
            It must be specified as a convenience initializer though it delegates
            the initialization to init().

            - parameter decoder: Supports coding and decoding functionality via NSKeyedArchiver.
        */
        required convenience init?( coder decoder: NSCoder )
        {
            self.init()
        }

        /**
            Sets the GameLoop callback for this scene.

            - parameter gameLoop: The game loop callback.
        */
        func setGameLoop( _ gameLoop: Workshop ) -> Void
        {
            self.gameLoop = gameLoop
        }

        /**
            Tells your app to perform any app-specific logic to update your scene.

            - parameter timeInterval: The passed time since the last update invocation.
        */
        override open func update( _ timeInterval: TimeInterval ) -> Void
        {
            self.gameLoop?.render()
        }

        /**
            Sets the scene camera to the specified target.

            - parameter target: The target point to set the camera to.
        */
        func moveCameraTo( target: CGPoint ) -> Void
        {
            skCamera.position = target
        }

        /**
            Sets constraints to the camera in order to clip its position inside the level bounds.
        */
        private func constraintCamera() -> Void
        {
            let constraintX = SKConstraint.positionX(
                SKRange(
                    lowerLimit: size.width / 2,
                    upperLimit: CGFloat( Level.WIDTH ) - size.width / 2
                )
            )
            let constraintY = SKConstraint.positionY(
                SKRange(
                    lowerLimit: size.height / 2,
                    upperLimit: CGFloat( Level.HEIGHT ) - size.height / 2
                )
            )

            skCamera.constraints = [
                constraintX,
                constraintY,
            ]
        }
    }
