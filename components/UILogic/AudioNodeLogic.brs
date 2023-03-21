sub InitAudioNode()
    m.audio = m.top.findNode("AudioNode")
    m.titleSong = m.top.FindNode("title")
      m.timeLapsed = m.top.FindNode("timeLapsed")

      m.progressBarProgress = m.top.FindNode("progressBarProgress")
      m.progressDot = m.top.FindNode("progressDot")
      m.lastTime = 0
      m.audio.notificationInterval = 1
end sub


'-----------------------FIX BUG IN AUDIO NODE (WHEN SCREEN IS NOT VISIBAL)-------------------------



sub PlayAudio(content as object)

    m.progressBarProgress.width = 0 
    m.progressDot.translation = [90, 77]
    m.lastTime = 0
    

    audiocontent = createObject("RoSGNode", "ContentNode")
    
      m.titleSong.text = content.title
      
      m.audio.content = content
      m.audio.ObserveField("state", "runing")
      m.audio.ObserveField("contentIndex", "runing")
      m.audio.contentIsPlaylist = true
      m.audio.control = "play"
    
  end sub

  
  
  sub runing()
    
    if(m.audio.state = "playing")

      
        m.titleSong.text = m.audio.content.title
      

    m.increment = 1090 / m.audio.duration
    m.audio.ObserveField("position", "increaseProgressBar")

    end if

    if(m.audio.state = "finished")
      m.timeLapsed.text = "00:00"
      m.titleSong.text = ""
      m.audio.unObserveField("position")
      m.progressBarProgress.width = 0 
      m.progressDot.translation = [90, 77]
    end if

  end sub

  sub increaseProgressBar()
      
    ' m.thisTime = Fix(m.audio.position) 

    ' if (m.thisTime > m.lastTime)

    
    m.timeLapsed.text =  StrI(m.audio.position / 60) + ":" + StrI(m.audio.position MOD 60)
    m.progressBarProgress.width = m.increment * m.audio.position
    m.progressDot.translation = [(m.increment * m.audio.position) + 90, 77]
    ' m.lastTime = m.thisTime
    

    ' end if
  
  end sub