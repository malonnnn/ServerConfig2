register_command('tpradius', 
    array(
        'description': 'Power',
        'permission': 'ch.alias.tpradius',
        'noPermMsg': 'Sorry you don\'t have permission to use this command.',
        'executor': closure() {        
            
            @plr = player()
            @ploc = ploc()

            for(@i = 0,@i < 10, @i++){
                @x = rand(-5,6)
                @z = rand(-5,6)

                @ploc['x'] = @ploc['x'] + @x
                @ploc['y'] = @ploc['y'] + 1
                @ploc['z'] = @ploc['z'] + @z
                @ploc2 = @ploc
                @ploc2['y'] = @ploc2['y'] + 1
                @arrLoc = array(@ploc['x'],@ploc['y'],@ploc['z'],@ploc['world'])
                @arrLoc2 = array(@ploc['x'],@ploc['y'] + 1,@ploc['z'],@ploc['world'])
                if(get_block(@arrLoc) == 'AIR' && get_block(@arrLoc2) == 'AIR'){
                    @ploc['y'] = @ploc['y'] - 2
                    set_ploc(@plr,@ploc)
                    tmsg(@plr,color('RED').'Short ranged tp!')
                    die()
                }
            }
            tmsg(@plr,color('RED').'No safe places found for tp!')
                
        }
    )
)