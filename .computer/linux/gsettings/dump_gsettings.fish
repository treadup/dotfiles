#!/usr/bin/fish

for schema in (gsettings list-schemas)
    for key in (gsettings list-keys $schema)
	echo $schema $key (gsettings get $schema $key)
    end
end
