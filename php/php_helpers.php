<?php
/**
 * A few helper functions for debugging PHP
 * See: http://top-frog.com/2011/09/27/a-few-php-dev-helper-functions/ for info
 */

if (PHP_SAPI === 'cli' && function_exists('xdebug_disable')) {
	xdebug_disable();
}

if (PHP_SAPI === 'cli' && strpos($_SERVER['_'], 'bin/phpunit') !== false) {
	error_reporting(E_ERROR);
}

function pp() {
	prettyDumper::create(func_get_args(), 'print_r');
}

function dp() {
	prettyDumper::create(func_get_args(), 'var_dump');
}

function ep() {
	$msg_array = explode("\n", prettyDumper::buildMessage(func_get_args()));
	foreach ($msg_array as $line) {
		error_log('**: '.str_replace("\t", '  ', $line));
	}
}

class prettyDumper {
	
	protected static $instances = array();
	
	private static $styles = array(
		'white-space: pre',
		'text-align: left',
		'margin: 10px 2%',
		'font: normal normal 11px/1.4 menlo, monaco, monospaced',
		'background: white',
		'color: black',
		'padding: 8px',
		'letter-spacing: normal',
		'word-spacing: normal',
		'box-shadow: 0px 0px 3px rgba(187, 187, 187, 0.5)'
	);
		
	private static $js = '
<script type="text/javascript"> 
	var _body = document.getElementsByTagName("body")[0];
	_body.insertBefore(document.getElementById("%s"), _body.firstChild);
</script>';

	private static $pre = '<pre id="%s" style="%s">%s</pre>';

	private $vars;
	private $func;

	public static function create($vars, $func) {
		return self::$instances[] = new self($vars, $func);
	}

	public function __construct($vars, $func) {
		$this->vars = $vars;
		$this->func = $func;
	}

	public static function buildMessage($vars, $func = 'print_r', $sep = ', ') {
		$msgs = array();
	
		if (!empty($vars)) {
			foreach ($vars as $var) {
				if (is_bool($var)) {
					$msgs[] = ($var ? 'true' : 'false');
				} elseif (is_scalar($var)) {
					$msgs[] = $var;
				} else {
					switch ($func) {
						case 'print_r':
						case 'var_export':
							$msgs[] = $func($var, true);
							break;
						case 'var_dump':
							ob_start();
							var_dump($var);
							$msgs[] = ob_get_clean();
							break;
					}
				}	
			}
		}
	
		return implode($sep, $msgs);
	}
		
	public function __destruct() {
		$msg = self::buildMessage($this->vars, $this->func);
		$id = implode('-', array($this->func, mt_rand()));
		printf(self::$pre, $id, implode(';', self::$styles), htmlspecialchars($msg, ENT_COMPAT, 'UTF-8'));
		printf(self::$js, $id);
	}
}