register_command('camo', 
    array(
        'description': 'Hide',
        'permission': 'ch.alias.camo',
        'noPermMsg': 'Sorry you don\'t have permission to use this command.',
        'executor': closure() {        
            
            @player = player()
            @eventID = associative_array('id': @player.'invis')
            @filter = associative_array('player': @player)
            try(
                bind('player_move', @eventID, @filter, @event, @player,
                    sudo("/minecraft:effect ". @player ." 14 0")
                    unbind()
                )
                sudo("/minecraft:effect ". @player ." minecraft:invisibility 9999 1 true")
            ,
                tmsg(@player,"You're already invisible!")
            )
                
        }
    )
)

register_command('invis', 
    array(
        'description': 'Hide',
        'permission': 'ch.alias.invis',
        'noPermMsg': 'Sorry you don\'t have permission to use this command.',
        'executor': closure() {        
            
            @player = player()
            sudo("/minecraft:effect ". @player ." minecraft:invisibility 9999 1 true")
            runas('~console',"/disguiseplayer ". @player ." Creeper setInvisible true")
                
        }
    )
)

register_command('vis', 
    array(
        'description': 'Show yourself',
        'permission': 'ch.alias.vis',
        'noPermMsg': 'Sorry you don\'t have permission to use this command.',
        'executor': closure() {        
            
            @player = player()
            include('/home/minecraft/server/plugins/CommandHelper/includes/getHeroClass.ms')
            @class = _getheroclass(@player)
            sudo("/minecraft:effect ". @player ." 14 0")
            try(
                @contents = read('/home/minecraft/server/plugins/CommandHelper/LocalPackages/commands/chars/'.@class.'.yml')
                @hero = yml_decode(@contents)
                include('/home/minecraft/server/plugins/CommandHelper/includes/changeSkin.ms')
                _changeSkin(@player, @hero['costumes'][0]['sig'], @hero['costumes'][0]['val'])
                unbind(associative_array('id': @player.'invis'))
            ,
                sudo("/undisguise")
                unbind(associative_array('id': @player.'invis'))
            )
                
        }
    )
)
register_command('shadowhide', 
    array(
        'description': 'Hide',
        'permission': 'ch.alias.shadowhide',
        'noPermMsg': 'Sorry you don\'t have permission to use this command.',
        'executor': closure() {        
            
            @player = player()
            @ploc = ploc(@player)
            @ploc['y'] = @ploc['y'] + 1
            @lightLevel = get_light_at(@ploc)
            if(@lightLevel > 4){
                tmsg(@player,color('RED')."Sorry, it's not dark enough to hide here")
                die()
            }

            @filter = associative_array('player': @player)
            try(
                bind('player_move', null, @filter, @event, @player,
                    @ploc = ploc(@player)
                    @ploc['y'] = @ploc['y'] + 1
                    @lightLevel = get_light_at(@ploc)
                    if(@lightLevel > 4){
                        tmsg(@player,color('RED')."You are no longer hidden, it is too bright")
                        include('/home/minecraft/server/plugins/CommandHelper/includes/getHeroClass.ms')
                        @class = _getheroclass(@player)
                        sudo("/minecraft:effect ". @player ." 14 0")
                        @contents = read('/home/minecraft/server/plugins/CommandHelper/LocalPackages/commands/chars/'.@class.'.yml')
                        @hero = yml_decode(@contents)
                        include('/home/minecraft/server/plugins/CommandHelper/includes/changeSkin.ms')
                        _changeSkin(@player, @hero['costumes'][0]['sig'], @hero['costumes'][0]['val'])
                        unbind()
                    }
                )
                sudo("/minecraft:effect ". @player ." minecraft:invisibility 9999 1 true")
                runas('~console',"/disguiseplayer ". @player ." Creeper setInvisible true")
            ,
                tmsg(@player,"You're already invisible!")
            )
                
        }
    )
)
