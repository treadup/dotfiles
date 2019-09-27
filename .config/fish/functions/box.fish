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
	    echo "Cleaning up localignore files"
	    rm -f ~/work/flowbox/localignore-docker-compose.yml
	    rm -f ~/work/flowbox/flask-app/localignore_Dockerfile
	    rm -f ~/work/flowbox/flask-app/localignore-docker-entrypoint.sh
	case "patch"
	    _box_local clean
	    echo "Creating patched localignore files"
	    _box_patch_docker_compose_yml
	    _box_patch_check_poetry_dependencies
    end
end

function _box_compose
    if test -e ~/work/flowbox/localignore-docker-compose.yml
	docker-compose -f ~/work/flowbox/localignore-docker-compose.yml $argv
    else
	docker-compose -f ~/work/flowbox/docker-compose.yml $argv
    end
end

function _box_start
    switch "$argv[1]"
	case "frontend"
	    # eval "cd ~/work/frontend && yarn check --integrity && yarn start"
	    eval "cd ~/work/frontend && yarn start"
	case "backend"
	    eval "cd ~/work/flowbox && docker-compose up flask-app"
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
	    eval "cd ~/work/flowbox/flask-app/ && fab test web deploy "
	case "webprod"
	    echo "Deploying web to production"
	    eval "cd ~/work/flowbox/flask-app/ && fab live web deploy "
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
	    echo "psqltest - connect to the test database"
	    echo "pdqlprod - connect to the production database"
	case "*"
	    echo "Unknown db command: $argv[1]"
    end
end
