<?php

if(!defined('ABSPATH')){
    exit;
}

if(!class_exists('acfe_performance_ultra_fields')):

class acfe_performance_ultra_fields{
    
    /**
     * construct
     */
    function __construct(){
    
        add_action('acf/render_field_settings', array($this, 'render_field_settings'));
        add_filter('acf/validate_field',        array($this, 'validate_field'), 20);
        
    }
    
    
    /**
     * render_field_settings
     *
     * @param $field
     */
    function render_field_settings($field){
        
        // validate
        if(!acfe_is_performance_enabled() || acfe_get_performance_config('engine') !== 'ultra'){
            return;
        }
        
        // vars
        $exclude = array('acfe_button', 'acfe_column', 'acfe_recaptcha', 'acfe_dynamic_render', 'accordion', 'message', 'tab');
        
        // check if excluded
        if(in_array($field['type'], $exclude)){
            return;
        }
        
        // settings
        acf_render_field_setting($field, array(
            'label'             => __('Save as individual meta'),
            'key'               => 'acfe_save_meta',
            'name'              => 'acfe_save_meta',
            'instructions'      => __('Save the field as an individual meta.'),
            'type'              => 'true_false',
            'required'          => false,
            'conditional_logic' => false,
            'wrapper' => array(
                'width' => '',
                'class' => '',
                'id'    => '',
            ),
            'message'           => '',
            'default_value'     => false,
            'ui'                => true,
            'ui_on_text'        => '',
            'ui_off_text'       => '',
        ));
        
    }
    
    
    /**
     * validate_field
     *
     * @param $field
     *
     * @return mixed
     */
    function validate_field($field){
        
        // cleanup setting if set and empty
        if(isset($field['acfe_save_meta']) && empty($field['acfe_save_meta'])){
            unset($field['acfe_save_meta']);
        }
        
        return $field;
        
    }
    
    
}

acf_new_instance('acfe_performance_ultra_fields');

endif;