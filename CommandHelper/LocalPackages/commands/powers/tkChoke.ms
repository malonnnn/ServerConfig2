register_command('tkchoke', 
    array(
        'description': 'Choke a player',
        'permission': 'powers.tkchoke',
        'noPermMsg': 'Sorry you don\'t have permission to use this command.',
        'executor': closure(@alias, @sender, @args) {
        
            if (array_size(@args) != 1) {
                msg(color('RED').color('BOLD').'Improper Usage!');
                msg(color('RED').'Usage: /tkchoke <player>');
                return(false)
            }
            
            @vic = @args[0]
            @vic = player(@vic)

            if(has_permission(@vic,'is.criminal')){
                tmsg(@sender,color('RED').'You cannot do this to a prisoner')
                die()
            }
            
            include('/home/minecraft/server/plugins/CommandHelper/includes/distanceBetween.ms')
            @dist = _distanceBetween(ploc(@sender),ploc(@vic))
            
            if(@dist < 20){
                include('/home/minecraft/server/plugins/CommandHelper/includes/coolDown.ms')
                if(_coolDown('tkChoke',10,@sender)){
                    return()
                }
                sudo('/freeze '.@vic.' 6000')
                runas('~console','/minecraft:effect give '.@vic.' minecraft:wither 5 6 true')
                runas('~console','/minecraft:effect give '. @vic.' minecraft:poison 5 6 true')
                broadcast(@sender . " is now telekinetically choking " . @vic)
            }else{
                tmsg(@sender,color('RED').'You are not close enough to that player.')
            }
        }
    )
)
