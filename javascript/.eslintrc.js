const OFF = 0;
const WARN = 1;
const ERROR = 1;

module.exports = {

	root: true,
	parser: '@typescript-eslint/parser',
	parserOptions: {
		//tsconfigRootDir: __dirname,
		project: ['/Users/mambo/site/python/specify7/specifyweb/frontend/js_src/tsconfig.json'],
		ecmaVersion: 2018,
		sourceType: 'module',
		ecmaFeatures: {
			jsx: true,
		},
	},
	plugins: ['@typescript-eslint'],
	extends: [
		'eslint:recommended',
		'plugin:react/recommended',
		'plugin:@typescript-eslint/recommended',
		'plugin:@typescript-eslint/recommended-requiring-type-checking',
		// 'prettier',
		// 'prettier/@typescript-eslint',
	],
	rules: {
		"no-non-null-assertion": OFF,
		"react/display-name": WARN,
		"@typescript-eslint/ban-ts-comment": WARN,
		"@typescript-eslint/no-unused-vars": WARN,
		"@typescript-eslint/no-misused-promises": OFF,
		"@typescript-eslint/no-empty-interface": OFF,
		"@typescript-eslint/require-await": OFF,
	},
	settings: {
		react: {
			createClass: 'createReactClass', // Regex for Component Factory to use,
			// default to "createReactClass"
			pragma: 'React', // Pragma to use, default to "React"
			fragment: 'Fragment', // Fragment to use (may be a property of <pragma>), default to "Fragment"
			version: 'detect', // React version. "detect" automatically picks the version you have installed.
			// You can also use `16.0`, `16.3`, etc, if you want to override the detected value.
			// default to latest and warns if missing
			// It will default to "detect" in the future
			flowVersion: '0.53', // Flow version
		},
		propWrapperFunctions: [
			// The names of any function used to wrap propTypes, e.g. `forbidExtraProps`. If this isn't set, any propTypes wrapped in a function will be skipped.
			'forbidExtraProps',
			{ property: 'freeze', object: 'Object' },
			{ property: 'myFavoriteWrapper' },
		],
		linkComponents: [
			// Components used as alternatives to <a> for linking, eg. <Link to={ url } />
			'Hyperlink',
			{ name: 'Link', linkAttribute: 'to' },
		],
		"import/core-modules": ["styled-jsx/css"]
	},
};
