function box
    switch "$argv[1]"
	case "db"
	    _box_db $argv[2..-1]
	case "start"
	    _box_start $argv[2..-1]
	case "deploy"
	    _box_deploy $argv[2..-1]
	case "local"
	    _box_local $argv[2..-1]
	case ""
	    echo "Usage: box <command>"
	    echo "where <command> can be one of the following."
	    echo "db     - perform database commands"
	    echo "deploy - perform deploy commands"
	    echo "start  - perform start commands"
	case "*"
	    # echo "Unknown command: $argv[1]"
	    eval "cd ~/work/flowbox/ && make $argv"
    end
end


function _box_local
    switch "$argv[1]"
	case "clean"
	    echo "Removing local patches"
	    git checkout ~/work/flowbox/flask-app/docker-entrypoint.sh
	case "patch"
	    _box_local clean
	    echo "Applying local patches"
	    cat ~/bin/check_packages_and_database_versions.sh > ~/work/flowbox/flask-app/localignore-docker-entrypoint.sh
	    cat ~/work/flowbox/flask-app/docker-entrypoint.sh >> ~/work/flowbox/flask-app/localignore-docker-entrypoint.sh
	    mv ~/work/flowbox/flask-app/localignore-docker-entrypoint.sh ~/work/flowbox/flask-app/docker-entrypoint.sh
	case ""
	    echo "Usage: box local <command>"
	    echo "where <command> can be one of the following."
	    echo "clean - clean up the local patched files"
	    echo "patch - apply patches to local files"
	case "*"
	    echo "Unknown command: $argv[1]"
    end
end


function _box_start
    switch "$argv[1]"
	case "frontend"
	    # Checking integrity is now done in the main project
	    # yarn --cwd ~/work/frontend check --integrity && yarn --cwd ~/work/frontend start
	    yarn --cwd ~/work/frontend start
	case "backend"
	    docker-compose -f ~/work/flowbox/docker-compose.yml up flask-app
	case ""
	    echo "Usage: box start <command>"
	    echo "where <command> can be one of the following."
	    echo "frontend - start frontend application"
	    echo "backend  - start backend application"
	case "*"
	    echo "Unknown start command: $argv[1]"
    end
end


function _box_deploy
    switch "$argv[1]"
	case "celerytest"
	    echo "Deploying celery to test"
	    eval "cd ~/work/flowbox/flask-app/ && fab test celery deploy"
	case "celeryprod"
	    echo "Deploying celery to production"
	    eval "cd ~/work/flowbox/flask-app/ && fab live celery deploy"
	case "webtest"
	    echo "Deploying web to test"
	    eval "cd ~/work/flowbox/flask-app/ && fab test web deploy"
	case "webprod"
	    echo "Deploying web to production"
	    eval "cd ~/work/flowbox/flask-app/ && fab live web deploy"
	case ""
	    echo "Usage: box deploy <command>"
	    echo "where <command> can be one of the following."
	    echo "celerytest - deploy celery to test"
	    echo "celeryprod - deploy celery to prod"
	    echo "webtest    - deploy web to test"
	    echo "webprod    - deploy web to prod"
	case "*"
	    echo "Unknown deploy command: $argv[1]"
    end
end


function _box_db
    switch "$argv[1]"
	case "psql"
	    _box_db_psql $argv[2..-1]
	case "upgrade"
	    eval "cd ~/work/flowbox/ && docker-compose exec flask-app python manage.py db upgrade"
	case "downgrade"
	    eval "cd ~/work/flowbox/ && docker-compose exec flask-app python manage.py db downgrade"
	case ""
	    echo "Usage: box db <command>"
	    echo "where <command> can be one of the following."
	    echo "psql - use psql to connect to a server"
	    echo "upgrade - upgrade the database"
	    echo "downgrade - downgrade the databse"
	case "*"
	    echo "Unknown db command: $argv[1]"
    end
end
