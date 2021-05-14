"use strict";

module.exports = {
  extends: ["stylelint-config-standard", "stylelint-config-prettier"],
  rules: {
    // Some rules are disabled as they conflict with `prettier`
    // They should be enabled if you don't use `prettier`

    "color-no-invalid-hex": true,
    "font-family-no-duplicate-names": true,
    "font-family-no-missing-generic-family-keyword": true,
    //'named-grid-areas-no-invalid': true,  // seems to not exist
    "function-calc-no-invalid": true,
    "function-calc-no-unspaced-operator": true,
    "function-linear-gradient-no-nonstandard-direction": true,
    "string-no-newline": true,
    "unit-no-unknown": true,
    "property-no-unknown": true,
    "keyframe-declaration-no-important": true,
    // seems to not exits
    //'declaration-block-no-duplicate-custom-properties': true,
    "declaration-block-no-duplicate-properties": true,
    "declaration-block-no-shorthand-property-overrides": true,
    "block-no-empty": true,
    "selector-pseudo-class-no-unknown": true,
    "selector-pseudo-element-no-unknown": true,
    "selector-type-no-unknown": true,
    "media-feature-name-no-unknown": true,
    "at-rule-no-unknown": true,
    "comment-no-empty": true,
    "no-descending-specificity": true,
    "no-duplicate-at-import-rules": true,
    "no-duplicate-selectors": true,
    "no-empty-source": true,
    //'no-extra-semicolons': true,
    "no-invalid-double-slash-comments": true,
    "alpha-value-notation": "number",
    "hue-degree-notation": "angle",
    "color-function-notation": "modern",
    "color-named": "never",
    "length-zero-no-unit": true,
    "font-weight-notation": "numeric",
    "function-url-scheme-allowed-list": ["https", "data"],
    "keyframes-name-pattern": "[a-z]+(-[a-z]+)*",
    "number-max-precision": 2,
    "shorthand-property-no-redundant-values": true,
    "custom-property-pattern": "[a-z]+(-[a-z]+)*",
    "declaration-block-single-line-max-declarations": 1,
    "selector-class-pattern": "[a-z]+(-[a-z]+)*",
    "selector-id-pattern": "[a-z]+(-[a-z]+)*",
    //'selector-max-empty-lines': 0,
    "selector-pseudo-element-colon-notation": "double",
    "comment-word-disallowed-list": ["FIXME:"],
    "no-unknown-animations": true,
    //'color-hex-case': 'lower',
    "font-family-name-quotes": "always-unless-keyword",
    //'function-comma-space-after': 'always',
    //'function-comma-space-before': 'never',
    //'function-max-empty-lines': 0,
    "function-name-case": "lower",
    "function-url-quotes": "always",
    "function-whitespace-after": "always",
    //'number-leading-zero': 'always',
    //'number-no-trailing-zeros': true,
    //'string-quotes': 'double',
    //'unit-case': 'lower',
    "value-keyword-case": "lower",
    //'value-list-comma-space-after': true,
    //'value-list-comma-space-before': false,
    //'value-list-max-empty-lines': 0,
    "custom-property-empty-line-before": "always",
    //'property-case': 'lower',
    "declaration-bang-space-after": "never",
    "declaration-bang-space-before": "always",
    //'declaration-colon-space-after': 'always',
    //'declaration-colon-space-before': 'never',
    "declaration-empty-line-before": "never",
    //'declaration-block-semicolon-newline-after': 'always',
    //'declaration-block-semicolon-newline-before': 'never',
    //'declaration-block-semicolon-space-after': 'always-single-line',
    //'declaration-block-semicolon-space-before': 'never',
    //'declaration-block-trailing-semicolon': 'always',
    //'block-closing-brace-newline-after': 'always',
    //'block-closing-brace-newline-before': 'always',
    //'block-closing-brace-space-after': 'always-single-line',
    //'block-closing-brace-space-before': 'always-single-line',
    //'block-opening-brace-newline-after': 'always',
    //'block-opening-brace-space-after': 'always',
    //'block-opening-brace-space-before': 'always-single-line',
    "selector-attribute-brackets-space-inside": "never",
    "selector-attribute-operator-space-after": "never",
    "selector-attribute-operator-space-before": "never",
    "selector-attribute-quotes": "always",
    //'selector-combinator-space-after': 'always',
    //'selector-combinator-space-before': 'always',
    //'selector-descendant-combinator-no-non-space': true,
    //'selector-pseudo-class-case': 'lower',
    "selector-pseudo-class-parentheses-space-inside": "never",
    //'selector-pseudo-element-case': 'lower',
    "selector-type-case": "lower",
    //'selector-list-comma-newline-after': 'always',
    //'selector-list-comma-newline-before': 'never-multi-line',
    //'selector-list-comma-space-before': 'never',
    //'rule-empty-line-before': 'always',
    "media-feature-colon-space-after": "always",
    "media-feature-colon-space-before": "never",
    //'media-feature-name-case': 'lower',
    "media-feature-parentheses-space-inside": "never",
    "media-feature-range-operator-space-after": "always",
    "media-feature-range-operator-space-before": "always",
    //'media-query-list-comma-newline-after': 'always',
    //'media-query-list-comma-newline-before': 'never-multi-line',
    //'at-rule-empty-line-before': 'always',
    //'at-rule-name-case': 'lower',
    //'at-rule-name-newline-after': 'never',
    "at-rule-name-space-after": "always",
    //'at-rule-semicolon-newline-after': 'always',
    "at-rule-semicolon-space-before": "never",
    "comment-whitespace-inside": "always",
    //'indentation': 2,
    //'linebreaks': 'unix',
    //'max-empty-lines': 4,
    //'max-line-length': [
    //  72,
    //  {
    //    'ignore': 'non-comments',
    //  },
    //],
    //'no-eol-whitespace': true,
    //'no-missing-end-of-source-newline': true,
    //'no-empty-first-line': true,
  },
};