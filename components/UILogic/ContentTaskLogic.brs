' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********



sub RunContentTask()
    m.contentTask = CreateObject("roSGNode", "ContentReader") 
    m.contentTask.contenturi = "http://192.168.0.115:8080/run/webapi/myresource"
    m.contentTask.ObserveField("content", "OnMainContentLoaded")
    m.contentTask.control = "run" 
end sub

sub OnMainContentLoaded() 
    ShowAlbumGridScreen(m.contentTask.content )
    
end sub