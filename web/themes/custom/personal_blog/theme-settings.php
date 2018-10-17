<?php

/**
 * @file
 * Theme settings form for Personal Blog theme.
 */

/**
 * Implements hook_form_system_theme_settings_alter().
 */
function personal_blog_form_system_theme_settings_alter(&$form, &$form_state) {

  $form['personal_blog'] = [
    '#type' => 'details',
    '#title' => t('Personal Blog'),
    '#open' => TRUE,
  ];

  $form['personal_blog']['font_size'] = [
    '#type' => 'number',
    '#title' => t('Font size'),
    '#min' => 12,
    '#max' => 18,
    '#default_value' => theme_get_setting('font_size'),
  ];

}
