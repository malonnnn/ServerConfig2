bind('world_changed', null, null, @event,

    @player = player()

    set_timeout(1000,closure(
        if(has_permission(@player,'cmi.command.fly.*')){
            runas(@player,'/cmi fly true')
        }
        include('/home/minecraft/server/plugins/CommandHelper/includes/getHeroClass.ms')
        @class = _getheroclass(@player)
        if(@class == 'mortal' || has_permission(@player,'is.fanfic')){
            runas('~console','/undisguiseplayer '.@player)
        }else{
            @skinNum = import(@player.'skinNum')
            if(@skinNum != null){
                runas(@player,'/setcostume '.@skinNum)
            }
        }
    ))

)
