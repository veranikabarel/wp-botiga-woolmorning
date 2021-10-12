<?php

// Fix for csv being detected as text/html when importing products

add_filter( 'wp_check_filetype_and_ext', function( $result, $file, $filename, $mimes, $real_mime ) {
    if ( $result['ext'] == false ) {
        $wp_filetype = wp_check_filetype( $filename, $mimes );
        $ext         = $wp_filetype['ext'];

        if ( $ext == 'csv' && $real_mime == 'text/html' ) {
            $result['ext'] = $ext;
            $result['type'] = 'text/csv';
        }
    }
    return $result;
}, 10, 5 );