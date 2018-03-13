function ducks
    # Shows the size of all the items in a folder.
    du -cks * | sort -rn | head
end
