#!/usr/bin/perl

# Generate some files to simulate the SpaceNavigator device

my $files = {
    'buttons_on' => [
        [ 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00 ], # Left button on
        [ 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00 ], # Right button on
    ],

    'buttons_off' => [
        [ 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ], # Left button off
        [ 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00 ], # Right button off
    ],

    'move' => [
        [ 0x02, 0x00, 0x00, 0x00, 0xBA, 0x01, 0x00, 0x00 ], # X axe = 442
        [ 0x02, 0x00, 0x01, 0x00, 0xBB, 0x01, 0x00, 0x00 ], # Y axe = 443
        [ 0x02, 0x00, 0x02, 0x00, 0xBC, 0x01, 0x00, 0x00 ], # Z axe = 444
        [ 0x02, 0x00, 0x03, 0x00, 0xBD, 0x01, 0x00, 0x00 ], # Pitch = 445
        [ 0x02, 0x00, 0x04, 0x00, 0xBE, 0x01, 0x00, 0x00 ], # Roll  = 446
        [ 0x02, 0x00, 0x05, 0x00, 0xBF, 0x01, 0x00, 0x00 ], # Yaw   = 447
    ], 

    'move_negative' => [
        [ 0x02, 0x00, 0x00, 0x00, 0x0C, 0xFE, 0x00, 0x00 ], # X axe = -500
        [ 0x02, 0x00, 0x01, 0x00, 0x0D, 0xFE, 0x00, 0x00 ], # Y axe = -449
        [ 0x02, 0x00, 0x02, 0x00, 0x0E, 0xFE, 0x00, 0x00 ], # Z axe = -448
        [ 0x02, 0x00, 0x03, 0x00, 0x0F, 0xFE, 0x00, 0x00 ], # Pitch = -447
        [ 0x02, 0x00, 0x04, 0x00, 0x10, 0xFE, 0x00, 0x00 ], # Roll  = -446
        [ 0x02, 0x00, 0x05, 0x00, 0x11, 0xFE, 0x00, 0x00 ], # Yaw   = -445
    ],
};


foreach my $filename (keys %$files) {

    print "Writing $filename ...\n";

    open FIL, "> $filename" || die "$!";
    binmode FIL;

    foreach my $data (@{$files->{$filename}}) {
        print FIL pack("C*", @$data);
    }

    close FIL;
}


    
