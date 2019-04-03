
    import SpriteKit
    import Foundation

    /**
        Manages the game loop callback.
    */
    protocol GameLoop
    {
        /**
            Being invoked when one iteration of the game loop shall occur.
        */
        func render() -> Void
    }
