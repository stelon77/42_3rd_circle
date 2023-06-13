<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', '42_ft_services' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'moa' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'password' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ';YRCzN_2F`AY1vV4rG02?s&PVBcbuB-u:+}iGY-3h-]70ddMqu|H6sRTyU&WB,mC');
define('SECURE_AUTH_KEY',  'y$ZP(r&bq?$&iKc-{=haRs!v9;Xh4z!BcddD1i.SnyKcn-uZ4SDC*F*a@bAk:m.o');
define('LOGGED_IN_KEY',    'u6,.f8%,7|83T!h.CA- m5ogVd3s_RSb|<n+i*wT(&;6l,wQ-Y0#eH#?|JzF|7+7');
define('NONCE_KEY',        'HsLm;c|Z~+7OjmAFs-ImNDUFgHgFa#r&n@yUE6I;rUXxc8rZ]oyz(S8~L4rn4d ?');
define('AUTH_SALT',        'wUaYX+2H[HN-%Y@}PVONI7[G-nM&m<W-on[%-h^sd2nmY0 .: m=++mqpsX-wtD`');
define('SECURE_AUTH_SALT', 'taQV{.k%GxoyYbW2Y|:*Y;=dP,d6h ]9.|X]=W4sS;6xN_r4-1!08lYKyECXHdq]');
define('LOGGED_IN_SALT',   'qsQv 8-)=W:E3+!TINvu|v:@k>U`|^X!D]O9db|_0D=q/z2c!XQ&+??w|eHV/T&c');
define('NONCE_SALT',       '>>hf+0Q0f9a$1kFbCg96x0ES*n+,+FBb7s4~[.q1<$S9D#UgAd>/*3-mB0dGG,`-');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

define( 'WP_USE_THEMES', true );


/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}


/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once ABSPATH . 'wp-settings.php' ;