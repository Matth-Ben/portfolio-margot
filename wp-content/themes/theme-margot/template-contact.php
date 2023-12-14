<?php

/**
 * Template Name: Contact
 */

$timber_post = new \Timber\Post();
$context['post'] = $timber_post;

Timber::render([
    'page-' . $post->post_name . '.twig'
], $context);