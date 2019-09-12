function prodcelerylog --description "Fetch the remote Celery logs and store them in ~/logs/"

    echo Fetching remote celery log files and storing them the ~/log/ folder
    ssh prod-celery1 "tail -f /var/log/celeryd/worker-celery.log" >> ~/log/prod-celery1.log &
    ssh prod-celery2 "tail -f /var/log/celeryd/worker-celery.log" >> ~/log/prod-celery2.log &
    ssh prod-celery3 "tail -f /var/log/celeryd/worker-celery.log" >> ~/log/prod-celery3.log &
end
