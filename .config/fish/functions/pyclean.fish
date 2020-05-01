function pyclean -- removes all .pyc files, .pyo files and __pycache__ directories in the given subdirectory
    find . -type f -name '*.py[co]' -delete
    find . -type d -name __pycache__ -delete
end
