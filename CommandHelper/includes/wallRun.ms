proc('_wallRun', @player,
    
    include('/home/minecraft/server/plugins/CommandHelper/includes/facingDirection.ms')
    
    @ploc = ploc(@player)
    @ploc['y'] += 1
    @ploc[1] += 1
    @facing = _facingDirection(@ploc)
        
    if(@facing == "north"){
        @wallCheck = @ploc
        @footPosition = get_block(@ploc)
        @wallCheck['z'] = @wallCheck['z'] - 1
        @wallBlockFront = get_block(@wallCheck)
        @wallCheck['z'] = @wallCheck['z'] + 2
        @wallBlockBack = get_block(@wallCheck)
        @wallCheck['z'] = @wallCheck['z'] - 1

        @wallCheck['x'] = @wallCheck['x'] - 1
        @wallBlockLeft = get_block(@wallCheck)
        @wallCheck['x'] = @wallCheck['x'] + 2
        @wallBlockRight = get_block(@wallCheck)

        if(@footPosition[0] == "0"){
            if(
                @wallBlockFront[0].@wallBlockFront[1] != "0:" && 
                @wallBlockFront[0].@wallBlockFront[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }else if(
                @wallBlockBack[0].@wallBlockBack[1] != "0:" && 
                @wallBlockBack[0].@wallBlockBack[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }else if(
                @wallBlockLeft[0].@wallBlockLeft[1] != "0:" && 
                @wallBlockLeft[0].@wallBlockLeft[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }else if(
                @wallBlockRight[0].@wallBlockRight[1] != "0:" && 
                @wallBlockRight[0].@wallBlockRight[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }
        }
    }else if(@facing == "east"){
        assign(@wallCheck, @ploc)
        @footPosition = get_block(@ploc)
        @wallCheck['x'] = @wallCheck['x'] + 1
        @wallBlockFront = get_block(@wallCheck)
        @wallCheck['x'] = @wallCheck['x'] - 2
        @wallBlockBack = get_block(@wallCheck)

        @wallCheck['z'] = @wallCheck['z'] - 1
        @wallBlockLeft = get_block(@wallCheck)
        @wallCheck['z'] = @wallCheck['z'] + 2
        @wallBlockRight = get_block(@wallCheck)
        if(@footPosition[0] == "0"){
            if(
                @wallBlockFront[0].@wallBlockFront[1] != "0:" && 
                @wallBlockFront[0].@wallBlockFront[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }else if(
                @wallBlockBack[0].@wallBlockBack[1] != "0:" && 
                @wallBlockBack[0].@wallBlockBack[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }else if(
                @wallBlockLeft[0].@wallBlockLeft[1] != "0:" && 
                @wallBlockLeft[0].@wallBlockLeft[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }else if(
                @wallBlockRight[0].@wallBlockRight[1] != "0:" && 
                @wallBlockRight[0].@wallBlockRight[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }
        }
    }else if(@facing == "south"){
        assign(@wallCheck, @ploc)
        @footPosition = get_block(@ploc)
        @wallCheck['z'] = @wallCheck['z'] + 1
        @wallBlockFront = get_block(@wallCheck)
        @wallCheck['z'] = @wallCheck['z'] - 2
        @wallBlockBack = get_block(@wallCheck)

        @wallCheck['x'] = @wallCheck['x'] + 1
        @wallBlockLeft = get_block(@wallCheck)
        @wallCheck['x'] = @wallCheck['x'] - 2
        @wallBlockRight = get_block(@wallCheck)
        if(@footPosition[0] == "0"){
            if(
                @wallBlockFront[0].@wallBlockFront[1] != "0:" && 
                @wallBlockFront[0].@wallBlockFront[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }else if(
                @wallBlockBack[0].@wallBlockBack[1] != "0:" && 
                @wallBlockBack[0].@wallBlockBack[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }else if(
                @wallBlockLeft[0].@wallBlockLeft[1] != "0:" && 
                @wallBlockLeft[0].@wallBlockLeft[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }else if(
                @wallBlockRight[0].@wallBlockRight[1] != "0:" && 
                @wallBlockRight[0].@wallBlockRight[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }
        }
    }else{
        assign(@wallCheck, @ploc)
        @footPosition = get_block(@ploc)
        @wallCheck['x'] = @wallCheck['x'] - 1
        @wallBlockFront = get_block(@wallCheck)
        @wallCheck['x'] = @wallCheck['x'] + 2
        @wallBlockBack = get_block(@wallCheck)

        @wallCheck['z'] = @wallCheck['z'] + 1
        @wallBlockLeft = get_block(@wallCheck)
        @wallCheck['z'] = @wallCheck['z'] - 2
        @wallBlockRight = get_block(@wallCheck)
        if(@footPosition[0] == "0"){
            if(
                @wallBlockFront[0].@wallBlockFront[1] != "0:" && 
                @wallBlockFront[0].@wallBlockFront[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }else if(
                @wallBlockBack[0].@wallBlockBack[1] != "0:" && 
                @wallBlockBack[0].@wallBlockBack[1] != "9:" 
            ){
                @magnitude = 1.0;
                @yaw = @ploc['yaw'] + 90;
                @pitch = neg(@ploc['pitch']);
                @vector = associative_array();
                @vector['x'] = @magnitude * (cos(to_radians(@yaw)) * cos(to_radians(@pitch)));
                @vector['y'] = @magnitude * sin(to_radians(@pitch));
                @vector['z'] = @magnitude * (sin(to_radians(@yaw)) * cos(to_radians(@pitch)));
                set_pvelocity(@player, @vector)
            }
        }
    }
)