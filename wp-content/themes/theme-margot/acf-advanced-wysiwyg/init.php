<?php
/**
 * Registration logic for the new ACF field type.
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

add_action( 'init', 'app_include_acf_field_advanced_wysiwyg' );
/**
 * Registers the ACF field type.
 */
function app_include_acf_field_advanced_wysiwyg() {
	if ( ! function_exists( 'acf_register_field_type' ) ) {
		return;
	}

	require_once __DIR__ . '/class-app-acf-field-advanced-wysiwyg.php';

	acf_register_field_type( 'app_acf_field_advanced_wysiwyg' );
}
