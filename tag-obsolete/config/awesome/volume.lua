-------------------------------------------------
-- Volume Widget for Awesome Window Manager
-- Shows the current volume level
-- More details could be found here:
--

-- @author
-- @copyright
-------------------------------------------------

function readAudio(sink, ...)
end


function volumeInfo(sink)
   return " #"..sink.." "
end
