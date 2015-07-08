<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'marsaec');

/** MySQL database username */
define('DB_USER', 'marsaec');

/** MySQL database password */
define('DB_PASSWORD', 'mars@123456');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Abb_#n,u#RNgIwM* 3|`H,^/xO-[%~B5/crv i1>iSh.B^s^b-}D0yi8dETH-e-g');
define('SECURE_AUTH_KEY',  'J+=qd+L+2*+TEq_F/W9iOE,@$jA=V.biHRPdY;9CA{>em#(h%t;5AC?.{+Go{u{I');
define('LOGGED_IN_KEY',    '+66|5WFXp5Koeq0nH1 ,.Q!jpI4Vvs%vf[Uq8]mT%nB[N?Zx1]i0ovc*<12a>zoJ');
define('NONCE_KEY',        '/Gdj]`|Ww=RZ-MrI_We Z$0b-(R>%$b2;se8Wcj6^<QAYttTr-#g)I EyuKp>{f9');
define('AUTH_SALT',        'nmOJmjqaZq`D`+6xSMKAFl;CtEok@!*|$|y|JDw=2*<yx?u$8IY|SSI{v3Q]*o#$');
define('SECURE_AUTH_SALT', '+fwggqoLhi VD( Ck=IY%Iu?I/v%)cTOz)jk?VACRWD?9K4>TB.CM7io=1Fnfg7g');
define('LOGGED_IN_SALT',   'q^X-j;0X|:E,RaR.+Bue8Ut[-Bb!&iB<+DVM]PCU3l cSYBBC>^Za+Y`GIDjHZg?');
define('NONCE_SALT',       'm,j1Ot{>Z[Nhg 81OU0=|@WRqg;|3[zWV`N:+wG`H_DTg<3u@j`T![/|+IF`xUwy');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'aec_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
