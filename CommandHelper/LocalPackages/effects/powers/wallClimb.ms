bind('player_toggle_sneak',null,null,@event){
    @player = player()
    
    if(import(@player.'wallClimbStatus') && has_permission(@player, "powers.wallclimb")){
        include('/home/minecraft/server/plugins/CommandHelper/includes/getHeroClass.ms')
        @class = _getheroclass(@player)
        @eventID = associative_array('id': @player.'climbwalls')
        @isSneaking = @event['sneaking']
        
        if(@isSneaking){
        
            include('/home/minecraft/server/plugins/CommandHelper/includes/wallClimb.ms')
            @blocksChanged = _spidermanVinePlacement(ploc(),"minecraft:vine",@player)
            export(@player."blocksChanged",@blocksChanged)
        
            @realID = bind('player_move', @eventID, associative_array('player': @player), @event,
            @player, @eventID, @isSneaking){
                
                @blocksChanged = import(@player."blocksChanged")
                foreach(@val in @blocksChanged){
                    psend_block_change(@val,"AIR")
                }

                @blocksChanged = _spidermanVinePlacement(ploc(),"minecraft:vine",@player)
                export(@player."blocksChanged",@blocksChanged)
            }
            export(@eventID['id'],@realID)
        }else{
            unbind(import(@eventID['id']))
            @blocksChanged = import(@player."blocksChanged")
            foreach(@val in @blocksChanged){
                psend_block_change(@val,"AIR")
            }
        }
    
    }
}
