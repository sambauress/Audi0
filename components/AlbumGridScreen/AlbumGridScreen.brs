sub init()

    m.top.ObserveField("visible", "OnVisibleChange")
    m.AlbumGridNode = m.top.findNode("AlbumGrid")

end sub

sub OnVisibleChange() 
    if m.top.visible = true
        m.AlbumGridNode.SetFocus(true)
    end if
end sub