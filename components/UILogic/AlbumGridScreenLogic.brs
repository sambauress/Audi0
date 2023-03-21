' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowAlbumGridScreen(content as object)
    
    m.AlbumGridScreen = CreateObject("roSGNode", "AlbumGridScreen")

    m.AlbumGridScreen.content = content

    m.grid = m.AlbumGridScreen.findNode("AlbumGrid")
    m.grid.SetFocus(true)

    m.AlbumGridScreen.ObserveField("selected", "OnAlbumGridScreenItemSelected")
    ShowScreen(m.AlbumGridScreen) ' show GridScreen
    
    
end sub 

sub OnAlbumGridScreenItemSelected(event as Object)

    

    ShowAlbumMarkupScreen((m.AlbumGridScreen.content).getChild(m.AlbumGridScreen.selected))

end sub