<?php
/**
 * Get filetype from file path/name
 */
function smarty_modifier_filetype($path=""){

  $path_parts = pathinfo( $path );

  return $path_parts[ "extension" ];
}