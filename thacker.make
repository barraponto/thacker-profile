core = 6.x
api = 2

;Include base and usual features
includes[tecidobase] = http://github.com/barraponto/tecido-drupal-starterkit/raw/master/tecidobase.make
includes[tecidoimage] = http://github.com/barraponto/tecido-drupal-starterkit/raw/master/tecidoimage.make
includes[tecidodate] = http://github.com/barraponto/tecido-drupal-starterkit/raw/master/tecidodate.make
includes[tecidoprofile] = http://github.com/barraponto/tecido-drupal-starterkit/raw/master/tecidoprofile.make
includes[tecidogeo] = http://github.com/barraponto/tecido-drupal-starterkit/raw/master/tecidogeo.make
includes[tecidowysiwyg] = http://github.com/barraponto/tecido-drupal-starterkit/raw/master/tecidowysiwyg.make
includes[tecidocaptcha] = http://github.com/barraponto/tecido-drupal-starterkit/raw/master/tecidocaptcha.make
;includes[tecidodev] = http://github.com/barraponto/tecido-drupal-starterkit/raw/master/tecidodev.make

;themes for thacker
projects[] = fusion
projects[thacker_theme][type] = theme
projects[thacker_theme][download][type] = git
projects[thacker_theme][download][url] = git://github.com/barraponto/thacker-thacker-theme.git
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
projects[] = realname

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
projects[] = semanticviews
projects[] = openid_selector
