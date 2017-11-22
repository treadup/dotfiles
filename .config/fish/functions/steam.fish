function steam 
  set -l LD_PRELOAD '/usr/$LIB/libstdc++.so.6'
  steam
end
