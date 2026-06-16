<?php

use StubsGenerator\Finder;

return Finder::create()
    ->in( array(
        'source/edd-recurring/',
    ) )
    ->notPath( 'vendor' )
    ->notPath( 'assets' )
    ->sortByName( true );
