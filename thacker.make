core = 6.x
api = 2

;Include base and usual features
includes[tecidobase] = tecidobase.make
includes[tecidoimage] = tecidoimage.make
includes[tecidodate] = tecidodate.make
includes[tecidoprofile] = tecidoprofile.make
includes[tecidogeo] = tecidogeo.make
includes[tecidowysiwyg] = tecidowysiwyg.make
includes[tecidocaptcha] = tecidocaptcha.make
;includes[tecidodev] = tecidodev.make

;themes for thacker
projects[] = fusion
projects[thacker][type] = theme
projects[thacker][download][type] = git
projects[thacker][download][url] = git://github.com/barraponto/thacker-thacker-theme.git
projects[] = skinr

;thacker_project feature and dependencies
projects[thacker_project][type] = module
projects[thacker_project][download][type] = git
projects[thacker_project][download][url] = git://github.com/barraponto/thacker-project-feature.git
projects[] = og
projects[] = link 

;thacker_profile feature and dependencies
projects[thacker_profile][type] = module
projects[thacker_profile][download][type] = git
projects[thacker_profile][download][url] = git://github.com/barraponto/thacker-profile-feature.git
projects[realname] = 1.4
;patch realname to avoid conflicts with imagecache_profiles
projects[realname][patch][] = http://drupal.org/files/issues/1070102-realname-no-not-destory-user-picture.patch

;thacker_page feature and dependencies
projects[thacker_page][type] = module
projects[thacker_page][download][type] = git
projects[thacker_page][download][url] = git://github.com/barraponto/thacker-page-feature.git

;thacker_event feature and dependencies
projects[thacker_event][type] = module
projects[thacker_event][download][type] = git
projects[thacker_event][download][url] = git://github.com/barraponto/thacker-event-feature.git
projects[] = signup

;thacker_heartbeat feature and dependencies
projects[thacker_heartbeat][type] = module
projects[thacker_heartbeat][download][type] = git
projects[thacker_heartbeat][download][url] = git://github.com/barraponto/thacker-heartbeat-feature.git
projects[] = heartbeat
projects[] = rules

;thacker distro features
projects[thacker_distro][type] = module
projects[thacker_distro][download][type] = git
projects[thacker_distro][download][url] = git://github.com/barraponto/thacker-distro-feature.git

;extra modules
projects[openid_selector] = 1.5
projects[openid_selector][patch][] = http://drupal.org/files/issues/openid_selector-1064298_0.patch 
projects[] = libraries
libraries[openid-selector][download][type] = file
libraries[openid-selector][download][url] = http://openid-selector.googlecode.com/files/openid-selector-1.3.zip
