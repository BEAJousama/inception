<?php
define('FS_METHOD','direct');
if (!function_exists('getenv_docker')) {
	function getenv_docker($env, $default) {
		if ($fileEnv = getenv($env . '_FILE')) {
			return rtrim(file_get_contents($fileEnv), "\r\n");
		}
		else if (($val = getenv($env)) !== false) {
			return $val;
		}
		else {
			return $default;
		}
	}
}
define( 'DB_NAME', getenv_docker('WORDPRESS_DB_NAME', 'wordpress') );
define( 'DB_USER', getenv_docker('WORDPRESS_DB_USER', 'obeaj') );
define( 'DB_PASSWORD', getenv_docker('WORDPRESS_DB_PASSWORD', '123456') );
define( 'DB_HOST', getenv_docker('WORDPRESS_DB_HOST', 'mariadb') );
define( 'DB_CHARSET', getenv_docker('WORDPRESS_DB_CHARSET', 'utf8') );
define( 'DB_COLLATE', getenv_docker('WORDPRESS_DB_COLLATE', '') );

define( 'AUTH_KEY',         getenv_docker('WORDPRESS_AUTH_KEY',         'a7ccb9220e796af61470020020a2917a5e69ed44') );
define( 'SECURE_AUTH_KEY',  getenv_docker('WORDPRESS_SECURE_AUTH_KEY',  '413ca45524b1ba243b4b8670f580173d1d4f3015') );
define( 'LOGGED_IN_KEY',    getenv_docker('WORDPRESS_LOGGED_IN_KEY',    '972c76db84cfd7f1653755ee09ba9e55d97f018a') );
define( 'NONCE_KEY',        getenv_docker('WORDPRESS_NONCE_KEY',        'eb97b9d0948e6879341ad2e0906b45037e67530f') );
define( 'AUTH_SALT',        getenv_docker('WORDPRESS_AUTH_SALT',        'ccb4b54d51af11d01e273467bc3d3b360de12b2c') );
define( 'SECURE_AUTH_SALT', getenv_docker('WORDPRESS_SECURE_AUTH_SALT', 'f9146bfe10ed47715be355c7e58a0dbf5e442900') );
define( 'LOGGED_IN_SALT',   getenv_docker('WORDPRESS_LOGGED_IN_SALT',   '3e40f159d5d6773f49def11c4d236f9e05243de5') );
define( 'NONCE_SALT',       getenv_docker('WORDPRESS_NONCE_SALT',       '9ed229c1dc402c3c90d9aa7b3684911214e8870d') );


define('FORCE_SSL_ADMIN', true);
if (strpos($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') !== false)
	$_SERVER['HTTPS']='on';
if ( $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' ) {
    $_SERVER['HTTPS'] = 'on';
    $_SERVER['SERVER_PORT'] = 443;
}
define( 'WP_SITEURL', 'https://' . $_SERVER['HTTP_HOST'] );
define( 'WP_HOME',    'https://' . $_SERVER['HTTP_HOST'] );



define('NONCE_SALT', getenv_docker('WORDPRESS_NONCE_SALT','123456789'));


define('WP_CACHE_KEY_SALT', getenv_docker('WORDPRESS_CACHE_KEY_SALT','123456789'));
define('WP_CACHE', true);
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);
define('WP_REDIS_TIMEOUT', 1);
define('WP_REDIS_READ_TIMEOUT', 1);
define('WP_REDIS_DATABASE', 0);

$table_prefix = getenv_docker('WORDPRESS_TABLE_PREFIX', 'wp_');

define( 'WP_DEBUG', !!getenv_docker('WORDPRESS_DEBUG', '') );

if ($configExtra = getenv_docker('WORDPRESS_CONFIG_EXTRA', '')) {
	eval($configExtra);
}

define('ADMIN_COOKIE_PATH', '/');

define('COOKIE_DOMAIN', '');

define('COOKIEPATH', '');

define('SITECOOKIEPATH', '');
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
