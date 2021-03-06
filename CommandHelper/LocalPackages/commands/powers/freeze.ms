register_command('freeze', 
    array(
        'description': 'Freeze a player',
        'permission': 'ch.alias.freeze',
        'noPermMsg': 'Sorry you don\'t have permission to use this command.',
    
        'executor': closure(@alias, @sender, @args) {
        
            if (array_size(@args) != 2) {
            
                msg(color('RED').color('BOLD').'Improper Usage!');
                msg(color('RED').'Usage: /freeze <player> <time>');
                die(); # No need to go further					
            
            }
            
            @vic = @args[0]
            @vic = player(@vic)
            @plr = player()
            @time = @args[1]

            set_pvelocity(@vic,0,0.2,0)
            set_timeout(50,closure(
                set_pflight(@vic,true)
                set_pflying(@vic,true)
                set_pflyspeed(@vic,0)
                set_pwalkspeed(@vic,0)
                runas('~console','/minecraft:effect give '.@vic.' minecraft:levitation 9999 255 true')
                runas('~console','/lp user '.@vic.' permission settemp -cmi.command.fly.* true '.(@time / 1000))
            ))


            set_timeout(@time,closure(
                set_pflight(@vic,false)
                runas('~console','/speed fly 1 '.@vic)
                runas('~console','/speed walk 1 '.@vic)
                runas('~console','/minecraft:effect clear '.@vic.' minecraft:levitation')
            ))
                
        }
    )
)
