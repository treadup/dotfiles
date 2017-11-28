# This function enables or disables the auto mute functionalty
function automute
  switch $argv[1]
    case off
      amixer -c 0 sset 'Auto-Mute Mode' Disabled
    case on
      amixer -c 0 sset 'Auto-Mute Mode' Enabled
    case show
      amixer -c 0 sget 'Auto-Mute Mode'
    case '*'
      echo Unknown option $argv[1]
  end
end
