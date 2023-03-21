' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowAlbumMarkupScreen(content as object)
    ' create new instance of details screen
    m.AlbumMarkupScreen = CreateObject("roSGNode", "AlbumMarkupScreen")
    m.AlbumMarkupScreen.content = content
    m.AlbumMarkupScreen.album = content.hdgridposterurl
    m.AlbumMarkupScreen.ObserveField("albummarkuplistSelected", "onItemSelected")
    ShowScreen(m.AlbumMarkupScreen)
end sub

sub onItemSelected()

    PlayAudio(m.AlbumMarkupScreen.content.getChild(m.AlbumMarkupScreen.albummarkuplistSelected))

end sub

