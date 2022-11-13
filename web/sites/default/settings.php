<?php

// @codingStandardsIgnoreFile

/**
 * @file
 * Settings will be shared between all instances of the site.
 */

/**
 * Set db config.
 */
if (getenv('MYSQL_DATABASE')) {
    $databases['default']['default'] = [
      'database' => getenv('MYSQL_DATABASE'),
      'driver' => 'mysql',
      'host' => getenv('MYSQL_HOSTNAME'),
      'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
      'password' => getenv('MYSQL_PASSWORD'),
      'port' => getenv('MYSQL_PORT'),
      'prefix' => '',
      'username' => getenv('MYSQL_USER'),
    ];
}

/**
 * Set solr config.
 */
if (getenv('SOLR_SERVER')) {
    $config['search_api.server.' . getenv('SOLR_SERVER')] = [
      'backend_config' => [
        'connector_config' => [
          'host' => getenv('SOLR_HOSTNAME'),
          'path' => getenv('SOLR_PATH'),
          'core' => getenv('SOLR_CORE'),
          'port' => getenv('SOLR_PORT'),
        ],
      ],
    ];
}

/**
 * Defaults.
 */
$settings['hash_salt'] = hash('sha256', $app_root);
$settings['update_free_access'] = FALSE;
$settings['container_yamls'][] = $app_root . '/' . $site_path . '/services.yml';
$settings['file_scan_ignore_directories'] = [
  'node_modules',
  'bower_components',
];
$settings['entity_update_batch_size'] = 50;
$config_directories['sync'] = '../config/sync';
// This is supported in 8.8, but required in 9.0
$settings["config_sync_directory"] = '../config/sync';
$settings['install_profile'] = 'minimal';

/**
 * Load local development override configuration, if available.
 *
 * Use settings.local.php to override variables on secondary (staging,
 * development, etc) installations of this site. Typically used to disable
 * caching, JavaScript/CSS compression, re-routing of outgoing emails, and
 * other things that should not happen on development and testing sites.
 *
 * Keep this code block at the end of this file to take full effect.
 */
if (file_exists($app_root . '/' . $site_path . '/settings.local.php')) {
    include $app_root . '/' . $site_path . '/settings.local.php';
}
