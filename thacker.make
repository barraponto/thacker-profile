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
projects[thacker-theme][type] = theme
projects[thacker-theme][download][type] = git
projects[thacker-theme][download][url] = git://github.com/barraponto/thacker-thacker-theme.git
projects[] = skinr

;thacker_project feature and dependencies
projects[thacker-project][type] = module
projects[thacker-project][download][type] = git
projects[thacker-project][download][url] = git://github.com/barraponto/thacker-project-feature.git
projects[] = og
projects[] = link 

;thacker_profile feature and dependencies
projects[thacker-profile][type] = module
projects[thacker-profile][download][type] = git
projects[thacker-profile][download][url] = git://github.com/barraponto/thacker-profile-feature.git
projects[] = realname

;thacker_page feature and dependencies
projects[thacker-page][type] = module
projects[thacker-page][download][type] = git
projects[thacker-page][download][url] = git://github.com/barraponto/thacker-page-feature.git

;thacker_event feature and dependencies
projects[thacker-event][type] = module
projects[thacker-event][download][type] = git
projects[thacker-event][download][url] = git://github.com/barraponto/thacker-event-feature.git

;thacker_heartbeat feature and dependencies
projects[thacker-heartbeat][type] = module
projects[thacker-heartbeat][download][type] = git
projects[thacker-heartbeat][download][url] = git://github.com/barraponto/thacker-heartbeat-feature.git
projects[] = heartbeat
projects[] = rules

;extra modules
projects[] = semanticviews
projects[] = openid_selector
