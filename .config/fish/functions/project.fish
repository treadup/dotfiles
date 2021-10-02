function project -d "Create projects from templates on GitHub"
    if [ (count $argv) -ne "2" ]
	echo "Usage: project <kind> <project name>"
	echo "where <project name> is the name of the project"
	echo "and <kind> is the kind of project you want to create."
	echo "The following kinds of projects are supported:"
	echo "django - Creates a django project"
	return 1
    end

    switch "$argv[1]"
	case "django"
	    echo Creating django project
	    gh repo create treadup/$argv[2] -p treadup/django-project-template
	case "*"
	    echo "Unknown project type: $argv[2]"
    end
end
