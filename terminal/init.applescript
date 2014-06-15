#!/usr/bin/env osascript

set profile to "Pro Ext"
tell application "Terminal"

  # remove old profile
  try
    set setting to settings set profile
    delete setting
  end try
 
  # import new profile
  tell application "Finder"
    open file (profile & ".terminal") of folder of (path to me)
  end tell

  # set new profile as default
  set default settings to settings set profile
  set startup settings to settings set profile 

end tell



