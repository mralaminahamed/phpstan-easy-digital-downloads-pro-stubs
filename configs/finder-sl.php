<?php

use StubsGenerator\Finder;

return Finder::create()
    ->in( array(
        'source/edd-software-licensing/',
    ) )
    ->notPath( 'vendor' )
    ->notPath( 'assets' )
    ->sortByName( true );
