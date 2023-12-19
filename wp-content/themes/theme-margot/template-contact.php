<?php

/**
 * Template Name: Contact
 */

$context = \Timber\Timber::context();
$timber_post = new \Timber\Post();
$context['post'] = $timber_post;

Timber::render([
    'page-' . $post->post_name . '.twig'
], $context);