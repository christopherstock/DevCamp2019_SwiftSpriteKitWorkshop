
    /**
    *   Sets up the 3D transition effect for the main container.
    */
    function setup3Dtransitions()
    {
        let SPEED_ANIMATION         = 1.25;
        let INTERVAL                = 10;
        let UPPER_EDGE_Y_MULTIPLIER = 2;

        let mainContainer = document.querySelector( ".container-main" );

        let currentX  = 0;
        let currentY  = 0;

        let targetX   = 0;
        let targetY   = 0;

        //add mouse move listener
        document.addEventListener(
            "mousemove",
            function( e )
            {
                let x = getComputedStyle( document.documentElement ).width.slice(  0, -2 );
                let y = getComputedStyle( document.documentElement ).height.slice( 0, -2 );

                targetX = ( x / 2 - e.pageX ) / 25;
                targetY = ( y / 2 - e.pageY ) / 25;

                if ( targetY > 0 ) targetY *= UPPER_EDGE_Y_MULTIPLIER;
            }
        );

        //start game loop
        setInterval(
            function()
            {
                // reach target X
                if ( currentX < targetX )
                {
                    currentX += SPEED_ANIMATION;
                    if ( currentX > targetX ) currentX = targetX;
                }
                else if ( currentX > targetX )
                {
                    currentX -= SPEED_ANIMATION;
                    if ( currentX < targetX ) currentX = targetX;
                }

                // reach target Y
                if ( currentY < targetY )
                {
                    currentY += SPEED_ANIMATION;
                    if ( currentY > targetY ) currentY = targetY;
                }
                else if ( currentY > targetY )
                {
                    currentY -= SPEED_ANIMATION;
                    if ( currentY < targetY ) currentY = targetY;
                }

                // apply transformation to main-containert and main-image
                mainContainer.style.transform = "rotateX("     + currentY + "deg) rotateY(" + -currentX + "deg)";
            },
            INTERVAL
        );
    }

    /**
    *   Initializes JS WOW effects.
    */
    function initWowEffects()
    {
        new WOW().init();
    }

    /**
    *   Show the main container delayed.
    */
    function showPanelDelayed()
    {
        //show panel in 0.5 sec
        window.setTimeout(
            function()
            {
                //show main panel
                let theMainContainer = document.querySelector( ".container-main" );
                theMainContainer.style.visibility = "visible";
            },
            100
        );
    }

    /**
    *   Being invoked when the website is loaded.
    */
    window.onload = function()
    {
        setup3Dtransitions();
        initWowEffects();
        showPanelDelayed();
    };
