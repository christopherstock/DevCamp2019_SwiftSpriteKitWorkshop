
    import SpriteKit
    import Foundation

    /**
        Specifies different behaviours for a physical body.
    */
    struct Physic
    {
        /** Uncollidable physics. */
        static var none   :Physic = Physic( enabled: false, isDynamic: false, mass: 0.0,  restitution: 0.0, friction: 0.0 )
        /** The player body. */
        static var player :Physic = Physic( enabled: true,  isDynamic: true,  mass: 25.0, restitution: 0.0, friction: 0.0 )
        /** Non movable colliding walls. */
        static var wall   :Physic = Physic( enabled: true,  isDynamic: false, mass: 0.0,  restitution: 0.0, friction: 0.2 )
        /** The wooden crate. */
        static var box    :Physic = Physic( enabled: true,  isDynamic: true,  mass: 40.0, restitution: 0.0, friction: 1.0 )

        /** If physics are enabled for this behaviour. */
        var enabled     :Bool
        /** If the body is movable. */
        var isDynamic   :Bool

        /** The physical mass (weight) in kg. */
        var mass        :CGFloat
        /** The body restitution (bouncyness) from 0.0 to 1.0. */
        var restitution :CGFloat
        /** The edge roughness from 0.0 to 1.0. */
        var friction    :CGFloat
    }
