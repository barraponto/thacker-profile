<?php
// $Id: default.profile,v 1.22 2007/12/17 12:43:34 goba Exp $

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *   An array of modules to enable.
 */
function thacker_profile_modules() {
  return array(
    //install profile api
    'install_profile_api',

    //core modules
    'comment', 'help', 'menu', 'path', 'search', 'taxonomy',

    //build modules
    'ctools', 'context', 'features', 'views',

    //base cck modules
    'content', 'text', 'number', 'optionwidgets',

    //captcha modules
    'captcha', 'recaptcha',

    //image modules
    'filefield', 'filefield_paths', 'imagefield', 'imageapi', 'imageapi_gd', 'imagecache', 'imagefield_tokens', 

    //date modules
    'date_api', 'date', 'date_timezone', 'date_popup', 'calendar', 'jquery_ui',

    //wysiwyg modules
    'wysiwyg',

    //thacker project feature
    'link', 'og', 'og_views', 'thacker_project',

    //thacker content profile
    'content_profile', 'content_profile_registration', 'context_content_profile', 
    'geo', 'geo_field', 'geocode', 'postal', 'postal_field', 'geocode_widget', 
    'imagecache_profiles', 'realname', 'thacker_profile',

    //thacker event feature
    'signup', 'thacker_event',
    
    //thacker heartbeat feature
    'heartbeat', 'rules', 'hrules', 'shouts', 'og_activity', // 'thacker_heartbeat',

    //thacker page feature
    'thacker_page',

    //thacker distro
    'thacker_distro',

    //other contrib modules
    'admin', 'adminrole', 'openid_selector', 'pathauto', 'path_redirect', 'semanticviews', 'skinr', 'token', 'transliteration', 'vertical_tabs',
  );
}

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 *   An array with keys 'name' and 'description' describing this profile,
 *   and optional 'language' to override the language selection for
 *   language-specific profiles.
 */
function thacker_profile_details() {
  return array(
    'name' => 'Thacker.com.br',
    'description' => 'Select this profile to have Thacker.com.br installed.'
  );
}

/**
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function thacker_profile_task_list() {
}

/**
 * Perform any final installation tasks for this profile.
 *
 * The installer goes through the profile-select -> locale-select
 * -> requirements -> database -> profile-install-batch
 * -> locale-initial-batch -> configure -> locale-remaining-batch
 * -> finished -> done tasks, in this order, if you don't implement
 * this function in your profile.
 *
 * If this function is implemented, you can have any number of
 * custom tasks to perform after 'configure', implementing a state
 * machine here to walk the user through those tasks. First time,
 * this function gets called with $task set to 'profile', and you
 * can advance to further tasks by setting $task to your tasks'
 * identifiers, used as array keys in the hook_profile_task_list()
 * above. You must avoid the reserved tasks listed in
 * install_reserved_tasks(). If you implement your custom tasks,
 * this function will get called in every HTTP request (for form
 * processing, printing your information screens and so on) until
 * you advance to the 'profile-finished' task, with which you
 * hand control back to the installer. Each custom page you
 * return needs to provide a way to continue, such as a form
 * submission or a link. You should also set custom page titles.
 *
 * You should define the list of custom tasks you implement by
 * returning an array of them in hook_profile_task_list(), as these
 * show up in the list of tasks on the installer user interface.
 *
 * Remember that the user will be able to reload the pages multiple
 * times, so you might want to use variable_set() and variable_get()
 * to remember your data and control further processing, if $task
 * is insufficient. Should a profile want to display a form here,
 * it can; the form should set '#redirect' to FALSE, and rely on
 * an action in the submit handler, such as variable_set(), to
 * detect submission and proceed to further tasks. See the configuration
 * form handling code in install_tasks() for an example.
 *
 * Important: Any temporary variables should be removed using
 * variable_del() before advancing to the 'profile-finished' phase.
 *
 * @param $task
 *   The current $task of the install system. When hook_profile_tasks()
 *   is first called, this is 'profile'.
 * @param $url
 *   Complete URL to be used for a link or form action on a custom page,
 *   if providing any, to allow the user to proceed with the installation.
 *
 * @return
 *   An optional HTML string to display to the user. Only used if you
 *   modify the $task, otherwise discarded.
 */
function thacker_profile_tasks(&$task, $url) {

  install_include(thacker_profile_modules());

  //instead of zen, use the project sub-theme
  install_disable_theme('garland');
  install_admin_theme('cube');
  install_default_theme('thacker');

  //restrict user creation to administrators
  variable_set('user_register',0);

  //set pathauto update action to path redirect
  variable_set('pathauto_update_action', 3);

  //set default captcha to recaptcha
  variable_set('captcha_default_challenge','recaptcha/reCAPTCHA');

  //set recaptcha api key
  variable_set('recaptcha_public_key', '6Lfqc8ASAAAAACjJ2c6a2xjdcs7pqrQh-2YigNub');
  variable_set('recaptcha_private_key', '6Lfqc8ASAAAAALBfxPKgJLFxtUAge90HQ8dHccui');

  //set dt_project as a group node
  variable_set('og_content_type_usage_dt_project','group');

  //create taxonomies and add terms
  $skills_vocabulary_content_types = array(
    'dt_project' => 'dt_project',
    'profile' => 'profile',
  );
  $skills_vocabulary_properties = array(
    'tags' => 1,
    'description' => 'The skills associated with a Project or User.',
    'help' => 'Design, Drupal, HTML, Copy writing, etc.',
  );
  install_taxonomy_add_vocabulary('skills', $skills_vocabulary_content_types, $skills_vocabulary_properties);


  $status_vocabulary_content_types = array('dt_project' => 'dt_project');
  $status_vocabulary_properties = array(
    'description' => 'The status of Data Transparency projects.',
    'help' => 'Mark whether your project is done, in progress, active or still an idea.',
  );
  $status_vocabulary = install_taxonomy_add_vocabulary('status', $status_vocabulary_content_types, $status_vocabulary_properties);

  //set profile as a content_profile and load settings
  variable_set('content_profile_use_profile', 1);
  $content_profile_profile_settings =  array(
      'weight' => 0,
      'user_display' => 'full',
      'edit_link' => 1,
      'edit_tab' => 'top',
      'add_link' => 1,
      'registration_use' => 1,
      'admin_user_create_use' => 0,
      'registration_hide' => array(
        0 => 'field_user_geocode',
        1 => 'other',
      ),
    );
  variable_set('content_profile_profile', $content_profile_profile_settings);

  //create terms for status
  $status_vocabulary_terms = array('ideia', 'em andamento', 'ativo', 'fechado');
  foreach ($status_vocabulary_terms as $term) {
    install_taxonomy_add_term($status_vocabulary, $term);
  }

  //set event as a signup enabled content type and set date field to field_event_date
  variable_set('signup_node_default_state_dt_event','enabled_on');
  variable_set('signup_date_field_dt_event','field_event_date');

  //set wysiwyg variables
  db_query("INSERT INTO {wysiwyg} (format, editor, settings) VALUES ('%d', '%s', '%s')", 2, 'tinymce', thacker_wysiwyg_settings('tinymce'));

  // Update the menu router information.
  menu_rebuild();
}

/**
 * Implementation of hook_form_alter().
 *
 * Allows the profile to alter the site-configuration form. This is
 * called through custom invocation, so $form_state is not populated.
 */
function thacker_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'install_configure') {
    // Set default for site name field.
    $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  }
}

/**
 * Thacker Profile Wisywyg settings support
 *
 * Returns settings for wysiwyg editors
 */
function thacker_wysiwyg_settings($editor) {
  switch($editor) {
    case 'tinymce':
      $settings = array(
      'default' => 1,
      'user_choose' => 0,
      'show_toggle' => 1,
      'theme' => 'advanced',
      'language' => 'en',
      'buttons' => array(
        'default' => array(
          'bold' => 1,
          'italic' => 1,
          'underline' => 1,
          'strikethrough' => 1,
          'justifyleft' => 1,
          'justifycenter' => 1,
          'justifyright' => 1,
          'justifyfull' => 1,
          'bullist' => 1,
          'numlist' => 1,
          'outdent' => 1,
          'indent' => 1,
          'undo' => 1,
          'redo' => 1,
          'link' => 1,
          'unlink' => 1,
          'blockquote' => 1, ), ),
      'toolbar_loc' => 'top',
      'toolbar_align' => 'left',
      'path_loc' => 'bottom',
      'resizing' => 1,
      'verify_html' => 1,
      'preformatted' => 0,
      'convert_fonts_to_spans' => 1,
      'remove_linebreaks' => 1,
      'apply_source_formatting' => 0,
      'paste_auto_cleanup_on_paste' => 1,
      'block_formats' => 'p,address,pre,h2,h3,h4,h5,h6,div',
      'css_setting' => 'theme',
      'css_path' => '',
      'css_classes' => '', );
      break;
    default:
      $settings = array();
      break;
    }
  return serialize($settings);
}
