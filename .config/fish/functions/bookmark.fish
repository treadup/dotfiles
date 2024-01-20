function bookmark
    set CATEGORY "$argv[1]"
    set APP_DIR (realpath ~/code/python/personal-website)
    set BOOKMARK_DIR "$APP_DIR/website/templates/website/bookmarks"
    set BOOKMARK_FILE "$BOOKMARK_DIR/$CATEGORY.html"
    set TITLE (capitalize "$CATEGORY")

    if test -e "$BOOKMARK_FILE"
        emacsclient $BOOKMARK_FILE
    else
        echo "Bookmark file for $CATEGORY does not exist"
        if confirm "Do you want to create it?"
            echo "Creating bookmark file for category $CATEGORY"
            echo '{% extends "website/base.html" %}' > $BOOKMARK_FILE
            echo "{% block title %}$TITLE{% endblock %}" >> $BOOKMARK_FILE
            echo >> $BOOKMARK_FILE
            echo '{% block content %}' >> $BOOKMARK_FILE
            echo '<div class="content">' >> $BOOKMARK_FILE
            echo >> $BOOKMARK_FILE
            echo '</div>' >> $BOOKMARK_FILE
            echo '{% endblock %}' >> $BOOKMARK_FILE

            emacsclient $BOOKMARK_FILE
        end
    end
end
