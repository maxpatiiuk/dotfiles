import eslint from "@eslint/js";
import restrictedGlobals from "confusing-browser-globals";
import typescript from "@typescript-eslint/eslint-plugin";
import markdown from "eslint-plugin-markdown";
import promise from "eslint-plugin-promise";
import sonarjs from "eslint-plugin-sonarjs";
import simpleImportSort from "eslint-plugin-simple-import-sort";
import regexp from "eslint-plugin-regexp";
import tsdoc from "eslint-plugin-tsdoc";
import comments from "eslint-plugin-write-good-comments";
import functional from "eslint-plugin-functional";
import jest from "eslint-plugin-jest";
import * as eslintrc from '@eslint/eslintrc';
import jestDom from "eslint-plugin-jest-dom";
import arrayFunc from "eslint-plugin-array-func";
import eslintConfigPrettier from "eslint-config-prettier";
import { FlatCompat } from "@eslint/eslintrc";
import { defineFlatConfig } from "eslint-define-config";
import tsEslint from "typescript-eslint";
import eslintPluginUnicorn from 'eslint-plugin-unicorn';
import eslintComments from "eslint-plugin-eslint-comments/lib/configs/recommended.js";

const compat = new FlatCompat();

/*
 * Config for unicorn/prevent-abbreviations
 *
 * Exporting this separately in case someone would want to use this
 * as a base but extend it
 */
export const replacementsConfig = {
  props: {
    // `props` are used by React
    properties: false,
  },
  Props: {
    // `props` are used by React
    properties: false,
  },
  ref: {
    // `ref` is used by React
    reference: false,
  },
  i: {
    // in for loops, i is more commonly used then index
    index: false,
  },
  args: {
    // `arguments` is a reserved variable name
    arguments: false,
  },
};

export const testFiles = [
  "**/__tests__/**/*.[jt]s?(x)",
  "**/?(*.)+(spec|test).[tj]s?(x)",
];

export const testRules = {
  "jest/consistent-test-it": ["error", { fn: "test", withinDescribe: "test" }],
  "jest/max-expects": "warn",
  "jest/max-nested-describe": "error",
  "jest/no-test-return-statement": "error",
  "jest/prefer-called-with": "warn",
  "jest/prefer-comparison-matcher": "error",
  "jest/prefer-equality-matcher": "error",
  "jest/prefer-expect-resolves": "warn",
  "jest/prefer-hooks-in-order": "error",
  "jest/prefer-hooks-on-top": "error",
  "jest/prefer-mock-promise-shorthand": "warn",
  "jest/prefer-spy-on": "warn",
  "jest/prefer-todo": "error",
  /**
   * Too many false positives. Has a configuration option for
   * exceptions, but that seems to be ignored.
   */
  "jest/require-hook": "off",
  "jest/require-to-throw-message": "warn",
  "jest/no-large-snapshots": ["warn", { maxSize: 50, inlineMaxSize: 25 }],
  /*
   * This rule needs to know Jest version.
   * Autodetection of Jest version does not always work, thus
   * this had to be disabled.
   * Additionally, this rule wasn't that useful, as the same
   * functionally is built in in most IDEs
   */
  "jest/no-deprecated-functions": "off",
  /*
   * This rule highlights using a string variable as a test name
   * as an error (probably because it is not integrated
   * with TypeScript type checking)
   */
  "jest/valid-title": "off",

  "@typescript-eslint/no-magic-numbers": "warn",
};

const config = defineFlatConfig([
  eslint.configs.recommended,
  ...tsEslint.configs.strictTypeChecked,
  ...tsEslint.configs.stylisticTypeChecked,
  // FIXME: most of these compat should no longer be needed
  eslintPluginUnicorn.configs['flat/recommended'],
  ...compat.config(arrayFunc.configs.all),
  ...compat.config(eslintComments),
  ...compat.config(regexp.configs.recommended),
  functional.configs!.externalTypescriptRecommended,
  functional.configs!.recommended,
  functional.configs!.noOtherParadigms,
  functional.configs!.noStatements,
  functional.configs!.noExceptions,
  functional.configs!.currying,
  functional.configs!.stylistic,
  ...compat.config(promise.configs.recommended),
  ...compat.config(sonarjs.configs.recommended),
  {
    files: ["**/*.ts", "**/*.tsx", "**/*.js"],
    languageOptions: {
      // Requested by eslint-plugin-unicorn
			globals: eslintrc.Legacy.environments.get('es2024'),
		},
    linterOptions: {
      reportUnusedDisableDirectives: true,
    },
    plugins: {
      "@typescript-eslint": typescript,
      "simple-import-sort": simpleImportSort,
      tsdoc,
      "write-good-comments": comments,
      functional,
      arrayFunc,
      unicorn: eslintPluginUnicorn,
      /**
       * An awesome rule, but have to temporarily disable it until
       * https://github.com/BrainMaestro/eslint-plugin-optimize-regex/issues/66
       * is fixed - until then, this rule breaks regular expressions!
       */
      //'optimize-regex': regex,
    },
    rules: {
      "no-eq-null": "error",
      "no-bitwise": "error",
      "no-plusplus": "error",
      "@typescript-eslint/prefer-readonly": "error",
      "@typescript-eslint/prefer-readonly-parameter-types": [
        "warn",
        {
          ignoreInferredTypes: true,
          treatMethodsAsReadonly: true,
        },
      ],

      /**
       * This rule can provide optional optimizations. It might be redundant
       * with TypeScript in some cases, but it provides a less-confusing
       * error message (for example in .reduce())
       */
      "array-callback-return": "error",
      /*
       * "await" in loops might be a mistake or might be intentional, thus this
       * rule is a warning
       */
      "no-await-in-loop": "warn",
      "no-constant-binary-expression": "error",
      "no-constructor-return": "warn",
      // Redundant with TypeScript
      "no-dupe-args": "off",

      // This fires for anonymous functions when not wrapped in {}
      "no-promise-executor-return": "off",
      "no-template-curly-in-string": "error",
      "no-unsafe-optional-chaining": [
        "error",
        { disallowArithmeticOperators: true },
      ],
      complexity: ["warn", { max: 10 }],
      "default-case": "error",
      "default-case-last": "error",
      "no-restricted-syntax": [
        /**
         * To help you build an AST selector, you can use https://astexplorer.net/
         * (be sure to set parser to "@typescript-eslint/parser"). Or, you can use
         * https://typescript-eslint.io/play/
         *
         * Documentation of AST selectors and example selectors:
         * https://eslint.org/docs/latest/extend/selectors
         */
        "error",
        {
          selector: "ForInStatement",
          message:
            "for..in loops iterate over the entire prototype chain, which is virtually never what you want. Instead use for of/.forEach() with Object.keys/values/entries.forEach()",
        },
        {
          selector: "LabeledStatement",
          message: "Labels are not allowed",
        },
        {
          selector:
            'ImportSpecifier[imported.name="createElement"][local.name!="h"]',
          message:
            'Replace with "createElement as h" (this allows using a single tsconfig.json both for Stencil and React)',
        },
        {
          // See https://www.youtube.com/watch?v=jjMbPt_H3RQ
          // Also, there are 16 typescript-eslint rules about incorrect enum usage,
          // because they can be error prone
          // If decide to keep enums allowed, add eslint rules for detecting
          // incorrect usages
          selector: "TSEnumDeclaration",
          message:
            'Enums are considered harmful. Use "as const" objects instead',
        },
        // TODO: emit these as warnings? See https://github.com/eslint/eslint/issues/15620#issuecomment-1048388514
        {
          selector: "Class",
          message:
            "Consider avoiding OOP syntax. Use separate functions, or object full of functions instead if possible. Otherwise, silence this rule",
        },
        {
          selector: "DoWhileStatementView, ForStatement, TryStatement",
          message:
            "Consider avoiding imperative code. Refactor to immutable functional code if possible. Otherwise, silence this rule",
        },
        {
          selector: "SwitchStatement",
          message:
            "Switch statements are imperative and bug-prone. Consider refactoring to objects. See https://ultimatecourses.com/blog/deprecating-the-switch-statement-for-object-literals",
        },
        {
          // Generators can be replaced by more conventional syntax
          // most of the time, resulting in easier to understand code.
          // A few exceptions: https://news.ycombinator.com/item?id=33504700
          selector: "Tools.Generator",
          message:
            "You might not need a generator. You can return a function from your function instead.",
        },
      ],
      // We forbid for-in completely, so no need to detect incorrect usages
      "@typescript-eslint/no-for-in-array": "off",
      // We don't allow labels
      "no-unused-labels": "off",
      "no-alert": "error",
      "no-caller": "error",
      "no-eval": "error",
      "no-extend-native": "error",
      "no-extra-bind": "error",
      "no-implicit-coercion": "error",
      "no-iterator": "error",
      "no-new": "error",
      "no-new-func": "error",
      "no-new-wrappers": "error",
      "no-octal-escape": "error",
      "no-proto": "error",
      "no-return-assign": "error",
      "no-script-url": "error",
      "no-self-compare": "error",
      "no-sequences": "error",
      "no-useless-call": "error",
      "no-useless-concat": "error",
      "no-warning-comments": [
        "error",
        {
          /*
           * By emitting error for these TODOs, you can use them for things you
           * want to do in the current commit (since they will be reported as
           * an error by pre-commit hook). Convenient for not-forgetting to do
           * something
           */
          terms: ["ME"],
          location: "anywhere",
        },
      ],
      "prefer-named-capture-group": "warn",
      "prefer-promise-reject-errors": "error",
      "prefer-regex-literals": ["error", { disallowRedundantWrapping: true }],
      yoda: "error",
      "capitalized-comments": "error",
      "max-lines": [
        "warn",
        {
          max: 300,
          skipBlankLines: true,
          skipComments: true,
        },
      ],
      "max-lines-per-function": [
        "warn",
        {
          max: 100,
          skipBlankLines: true,
          skipComments: true,
        },
      ],
      "max-params": "off",
      // Prefer passing parameters as an object instead to be less error prone
      "@typescript-eslint/max-params": ["warn", { max: 5 }],
      "max-statements": [
        "warn",
        {
          max: 20,
        },
      ],
      // REFACTOR: Remove or use @stylistic/eslint-plugin-js
      "max-statements-per-line": "error",
      "multiline-comment-style": "error",
      "new-cap": "error",
      "no-inline-comments": "error",
      // This makes code more explicit and catches potential bugs
      "no-extra-boolean-cast": "off",
      "no-multi-assign": "error",
      "no-object-constructor": "error",
      "no-unneeded-ternary": "error",
      "no-div-regex": "error",
      "no-empty-static-block": "error",
      "no-fallthrough": "error",
      // Obsolete rule
      "no-inner-declarations": "off",
      // Redundant with Prettier
      "no-unexpected-multiline": "off",
      "one-var": ["error", "never"],
      "prefer-exponentiation-operator": "error",
      "prefer-object-spread": "error",
      // FEATURE: remove or replace with @stylistic/js/spaced-comment
      "spaced-comment": "error",
      "no-useless-computed-key": ["error", { enforceForClassMembers: true }],
      "no-useless-rename": "error",
      // Useless returns are sometimes used for better readability
      // i.e "default: return;"
      "no-useless-return": "off",
      "operator-assignment": "error",
      strict: "error",
      "unicode-bom": "error",
      "no-var": "error",
      "object-shorthand": "error",
      "prefer-const": "error",
      "prefer-numeric-literals": "error",
      "prefer-rest-params": "error",
      "prefer-spread": "error",
      "prefer-template": "error",
      "symbol-description": "error",
      "no-unreachable-loop": "error",
      "no-unmodified-loop-condition": "error",
      // Redundant with TypeScript, but has autofix, so enabled for convenience
      "no-unsafe-negation": "warn",
      // Good rule to have, but many false positives, so only a warning
      "require-atomic-updates": "warn",
      "arrow-body-style": "error",
      "class-methods-use-this": "off",
      "func-names": ["error", "as-needed"],
      "@typescript-eslint/class-methods-use-this": [
        // This rule can have false positives (i.e abstract methods)
        "warn",
        {
          ignoreOverrideMethods: true,
          ignoreClassesThatImplementAnInterface: "public-fields",
        },
      ],
      eqeqeq: ["error", "always", { null: "ignore" }],
      "func-name-matching": "warn",
      "func-style": ["error", "declaration", { allowArrowFunctions: true }],
      "grouped-accessor-pairs": "error",
      "max-depth": ["warn", { max: 6 }],
      "max-nested-callbacks": "warn",
      // FEATURE: remove or replace with  @stylistic/js
      "no-mixed-operators": "error",
      /*
       * Prevent accidental usages of global when forgot to declare a
       * variable
       */
      "no-restricted-globals": [
        "error",
        ...new Set([
          ...restrictedGlobals,
          "event",
          "name",
          "closed",
          "i",
          "index",
          "length",
          "parent",
          "self",
          "status",
          "stop",
          "toolbar",
          "top",
          "Infinity",
          "NaN",
          "isNaN",
          "isFinite",
          "parseFloat",
          "parseInt",
          "keys",
        ]),
      ],
      /*
       * This is already checked by TypeScript
       * TODO: potential use case for this is to forbid access to jest's globals
       *  outside of test files. TypeScript can't yet be fine tuned like that
       */
      "no-undef": "off",
      "prefer-arrow-callback": ["error", { allowNamedFunctions: true }],
      "prefer-object-has-own": "error",
      radix: ["error", "as-needed"],
      "require-unicode-regexp": "error",
      // REFACTOR: use @stylistic/js/semi
      "new-parens": "error",
      "logical-assignment-operators": [
        "error",
        "always",
        {
          enforceForIfStatements: true,
        },
      ],

      /*
       * Potentially super useful rules, but lot's of false positives (report
       * type as "any", even when TypeScript and IDE infer it correctly)
       */
      // '@typescript-eslint/no-unsafe-assignment': 'warn',
      // '@typescript-eslint/no-unsafe-argument': 'warn',
      // '@typescript-eslint/no-unsafe-member-access': 'warn',
      // '@typescript-eslint/no-unsafe-call': 'warn',

      // This rule crashes for me. TODO: reEnable in the future
      "@typescript-eslint/no-unsafe-return": "off",
      // REFACTOR: remove or use @stylistic/ts/no-extra-semi
      "@typescript-eslint/no-extra-semi": "off",
      // Lots of false positives
      "@typescript-eslint/no-base-to-string": "off",
      "@typescript-eslint/no-unsafe-unary-minus": "error",
      "@typescript-eslint/ban-ts-comment": [
        "error",
        {
          "ts-expect-error": "allow-with-description",
          "ts-ignore": false,
          "ts-nocheck": "allow-with-description",
          "ts-check": true,
        },
      ],
      // Redundant with @typescript-eslint/ban-ts-comment
      "@typescript-eslint/prefer-ts-expect-error": "off",
      "@typescript-eslint/array-type": "error",
      "@typescript-eslint/class-literal-property-style": ["error", "fields"],
      "@typescript-eslint/consistent-indexed-object-style": ["error", "record"],
      "@typescript-eslint/consistent-type-assertions": [
        "error",
        {
          assertionStyle: "as",
          objectLiteralTypeAssertions: "allow-as-parameter",
        },
      ],
      "@typescript-eslint/consistent-type-definitions": ["error", "type"],
      "@typescript-eslint/consistent-type-imports": "warn",
      // Providing explicit type improves type-checking performance and
      // catches bugs. It also improves code documentation
      // In some cases, explicit type would be very bloated (i.e in case of
      // mixins), thus you can silence this rule in those cases
      "@typescript-eslint/explicit-function-return-type": [
        "error",
        {
          allowConciseArrowFunctionExpressionsStartingWithVoid: true,
        },
      ],
      "@typescript-eslint/explicit-member-accessibility": [
        "error",
        {
          overrides: {
            constructors: "off",
          },
        },
      ],
      "@typescript-eslint/method-signature-style": "error",
      "@typescript-eslint/naming-convention": [
        "error",

        {
          /*
           * Use strictCamelCase and StrictPascalCase by default
           * Pascal case is allowed because, despite variable names
           * commonly starting with lower case, there are use cases for
           * capital letter:
           *  - React Components
           *  - React Contexts
           *  - Constructors/dynamic classes
           *  - Enum-like config objects
           */
          selector: "default",
          format: ["strictCamelCase", "StrictPascalCase"],
          leadingUnderscore: "allow",
          trailingUnderscore: "forbid",
        },

        {
          // TypeLike must be in StrictPascalCase
          selector: "typeLike",
          format: ["StrictPascalCase"],
        },

        {
          // Relax restrictions for keys like `en-US` and etc.
          selector: "default",
          modifiers: ["requiresQuotes"],
          format: null,
        },

        {
          // Enum members should be in upper case
          selector: "enumMember",
          format: ["UPPER_CASE"],
        },
      ],
      "@typescript-eslint/no-confusing-non-null-assertion": "error",
      "@typescript-eslint/no-confusing-void-expression": [
        "error",
        {
          ignoreArrowShorthand: true,
          ignoreVoidOperator: true,
        },
      ],
      "@typescript-eslint/no-dynamic-delete": "error",
      "@typescript-eslint/no-extraneous-class": "error",
      // REFACTOR: this rule appears to be undocumented now? https://github.com/phiresky/typescript-eslint/blob/master/packages/eslint-plugin/src/rules/no-implicit-any-catch.ts
      "@typescript-eslint/no-implicit-any-catch": "error",
      "@typescript-eslint/no-invalid-void-type": [
        "error",
        {
          allowInGenericTypeArguments: true,
          allowAsThisParameter: true,
        },
      ],
      "@typescript-eslint/no-require-imports": "error",
      "@typescript-eslint/no-unnecessary-boolean-literal-compare": "error",
      "@typescript-eslint/no-unnecessary-condition": "error",
      "@typescript-eslint/no-unnecessary-type-arguments": "error",
      "@typescript-eslint/no-unnecessary-type-constraint": "error",
      "@typescript-eslint/non-nullable-type-assertion-style": "error",
      "@typescript-eslint/prefer-enum-initializers": "error",
      "@typescript-eslint/prefer-for-of": "error",
      "@typescript-eslint/prefer-function-type": "error",
      "@typescript-eslint/prefer-includes": "error",
      "@typescript-eslint/prefer-literal-enum-member": "error",
      "@typescript-eslint/prefer-nullish-coalescing": "error",
      "@typescript-eslint/prefer-optional-chain": "error",
      "@typescript-eslint/prefer-reduce-type-parameter": "error",
      "@typescript-eslint/prefer-string-starts-ends-with": "error",
      "@typescript-eslint/promise-function-async": "warn",
      "@typescript-eslint/require-array-sort-compare": [
        "error",
        {
          ignoreStringArrays: true,
        },
      ],
      "@typescript-eslint/strict-boolean-expressions": "error",
      "@typescript-eslint/switch-exhaustiveness-check": [
        "error",
        { requireDefaultForNonUnion: true },
      ],
      "@typescript-eslint/unified-signatures": "error",
      "default-param-last": "off",
      "@typescript-eslint/default-param-last": "warn",
      "dot-notation": "off",
      "@typescript-eslint/dot-notation": "error",
      // REFACTOR: remove or replace with  @stylistic/js
      "lines-between-class-members": "off",
      // This rule crashes for me. TODO: reEnable in the future
      "@typescript-eslint/lines-between-class-members": "off",
      // REFACTOR: replace with  import/no-duplicates
      "no-duplicate-imports": "off",
      "@typescript-eslint/no-duplicate-imports": "error",
      "no-loss-of-precision": "off",
      "@typescript-eslint/no-loss-of-precision": "error",
      "no-magic-numbers": "off",
      "@typescript-eslint/no-magic-numbers": [
        "error",
        {
          ignore: [
            // Don't know why these aren't ignored by default
            -1, 0, 1, 2,
          ],
          ignoreDefaultValues: true,
          ignoreClassFieldInitialValues: true,
          detectObjects: false,
          ignoreEnums: true,
          ignoreNumericLiteralTypes: true,
          ignoreReadonlyClassProperties: true,
          ignoreTypeIndexes: true,
        },
      ],
      "no-throw-literal": "off",
      "@typescript-eslint/no-throw-literal": "error",
      "no-unused-expressions": "off",
      "@typescript-eslint/no-unused-expressions": "error",
      "no-use-before-define": "off",
      "@typescript-eslint/no-use-before-define": "error",
      "no-useless-constructor": "off",
      "@typescript-eslint/no-useless-constructor": "error",
      "no-unused-vars": "off",
      // Redundant with TypeScript
      "@typescript-eslint/no-unused-vars": "off",
      "@typescript-eslint/consistent-type-exports": [
        "warn",
        {
          fixMixedExportsWithInlineTypeSpecifier: true,
        },
      ],
      "@typescript-eslint/member-ordering": "error",
      /**
       * Redundancy could be useful for documentation purposes
       * (i.e, unknown | undefined)
       * But also, some other ESLint rules are confused if
       * this rule is fixed
       */
      "@typescript-eslint/no-redundant-type-constituents": "warn",
      "@typescript-eslint/no-useless-empty-export": "error",
      "@typescript-eslint/sort-type-constituents": "warn",
      "no-array-constructor": "off",
      "@typescript-eslint/no-array-constructor": "error",
      "no-empty-function": "off",
      // There can be use cases for this (when providing a callback is required
      // but you don't want to do anything)
      "@typescript-eslint/no-empty-function": [
        "warn",
        {
          allow: ["decoratedFunctions", "overrideMethods"],
        },
      ],
      "no-implied-eval": "off",
      "@typescript-eslint/no-implied-eval": "error",
      "require-await": "off",
      /*
       * If passing function as a prop, and the function is expected to
       * return a promise, making function async is cleaner than
       * returning Promise.resolve()
       */
      "@typescript-eslint/require-await": "error",
      // This improves stack traces, improves performance, and makes code more
      // explicit
      "@typescript-eslint/return-await": "warn",
      /*
       * While overusing non-null assertions can be harmful, there are
       * cases when it is the best solution.
       * For example, if you have a function that may return undefined,
       * but you are absolutely sure that it won't return undefined in
       * this context, the non-null assertion is helpful.
       * An alternative is to create a `defined()` helper function that
       * would throw a runtime error if value turns out to be undefined.
       * While that aligns the runtime and compile type behaviors, it
       * would mask the error message.
       * For example, if for some reason the value would turn out to
       * be undefined, `defined` helper might throw an error like
       * `Value is not defined` in a case like this:
       * `defined(maybeStyle).color.
       * However, if we don't catch this error, the browser is going to
       * catch it and report it as `Can't read property "color" of
       * undefined", which is a more helpful error message.
       *
       * This rule recommends to use `?.` instead, but that is a bad idea
       * in some cases. I am only going to use `!.` if I am absolutely
       * sure that the value would be defined. If it turns out to be
       * undefined, then my assumption was incorrect and I want to find
       * that out as soon as possible. Where as `?.` would hide this
       * from me and prevent me from finding out that my assumption is
       * incorrect.
       */
      "@typescript-eslint/no-non-null-assertion": "off",
      /**
       * There was a bug where explicit type was required for
       * @typescript-eslint/strict-boolean-expressions to infer the type
       * correctly. Even though that bug is fixed, it's still useful
       * to be explicit about the types of function arguments
       */
      "@typescript-eslint/no-inferrable-types": "off",
      /**
       * If function returns void but the expected return type is
       * undefined, this rule causes a type error
       */
      "@typescript-eslint/no-meaningless-void-operator": "off",
      /*
       * Lot's of false positives on pure functions that don't use
       * "this"
       */
      "@typescript-eslint/unbound-method": "off",

      // This rule is a subset of unicorn/new-for-builtins
      "unicorn/throw-new-error": "off",
      // eslint-plugin-regexp is superior to this rule
      "unicorn/better-regex": "off",
      // Conflicts with array-func/prefer-array-from
      "unicorn/prefer-spread": "off",
      /*
       * Switch statements are confusing and it is easy to forget
       * to break;
       * Prefer object literal
       */
      "unicorn/prefer-switch": "off",
      // This conflicts with prettier
      "unicorn/empty-brace-spaces": "off",
      "unicorn/custom-error-definition": "error",
      "unicorn/filename-case": "off",
      /*
       * This rule fires anytime you create a global promise, even
       * if you are not awaiting it
       */
      "unicorn/prefer-top-level-await": "off",
      "unicorn/import-style": "off",
      // This goes against functional programming
      "unicorn/no-array-callback-reference": "off",
      // This goes against functional programming
      "unicorn/no-array-for-each": "off",
      // This goes against functional programming
      "unicorn/no-array-reduce": "off",
      // A useless rule
      "unicorn/no-console-spaces": "off",
      // Conflicts with consistent-return
      "unicorn/no-useless-undefined": "off",
      /**
       * Unicorn's rule automatically adds parenthesis to nested
       * ternaries. I don't think that improves readability. What is
       * worse, it conflicts with Prettier (Prettier removes redundant
       * parenthesis)
       *
       * While nested ternaries can be less readable, they aren't
       * always. I don't think a hard rule always disallowing them is
       * a best approach. Especially since Prettier team is
       * experimenting with making nested ternaries more readable
       */
      "unicorn/no-nested-ternary": "off",
      "unicorn/no-lonely-if": "error",
      "no-negated-condition": "off",
      "unicorn/no-negated-condition": "error",
      "unicorn/no-new-array": "error",
      "unicorn/no-unsafe-regex": "error",
      "unicorn/numeric-separators-style": "error",
      "unicorn/prefer-array-flat-map": "error",
      // Query selector has worse performance and is less explicit
      "unicorn/prefer-query-selector": "off",
      "unicorn/prefer-string-replace-all": "error",
      // While using "undefined" is preferred, React relies on null values
      "unicorn/no-null": "off",
      "unicorn/prevent-abbreviations": [
        "error",
        {
          replacements: replacementsConfig,
          /*
           * Renaming imports is a bad idea, is bug prone and causes
           * confusion (when the same function is called differently
           * in different files)
           *
           * Instead, the function should be renamed in the place where
           * it was defined
           */
          checkShorthandImports: false,
          checkShorthandProperties: false,
        },
      ],
      /*
       * While this improves readability, it makes it way harder to
       * find all usages of the attribute as \.dataset translates all
       * attribute names to camelCase
       */
      "unicorn/prefer-dom-node-dataset": "off",
      "unicorn/prefer-at": "error",
      "unicorn/prefer-json-parse-buffer": "error",
      "unicorn/require-post-message-target-origin": "error",
      // TODO: enable checkFromLast:true. Seems to not work yet
      "unicorn/prefer-array-find": "error",

      "eslint-comments/no-unused-disable": "error",

      "tsdoc/syntax": "warn",

      /*
       * While these are super important for consistency and minimizing
       * merge conflicts, they have excellent auto fixes, thus
       * no need to show them as errors
       */
      "simple-import-sort/imports": "warn",
      "simple-import-sort/exports": "warn",

      "sonarjs/no-duplicate-string": "warn",
      "sonarjs/no-inverted-boolean-check": "error",
      "sonarjs/no-nested-template-literals": "warn",
      "sonarjs/cognitive-complexity": ["warn", 30],

      "regexp/no-dupe-disjunctions": "error",
      "regexp/no-empty-alternative": "error",
      "regexp/no-lazy-ends": "error",
      "regexp/no-optional-assertion": "error",
      "regexp/no-potentially-useless-backreference": "error",
      "regexp/no-useless-assertions": "error",
      "regexp/no-useless-dollar-replacements": "error",
      "regexp/confusing-quantifier": "error",
      "regexp/control-character-escape": "error",
      "regexp/negation": "error",
      "regexp/no-legacy-features": "error",
      "regexp/no-non-standard-flag": "error",
      "regexp/no-obscure-range": "error",
      "regexp/no-standalone-backslash": "error",
      "regexp/no-trivially-nested-assertion": "error",
      "regexp/no-trivially-nested-quantifier": "error",
      "regexp/no-unused-capturing-group": "error",
      "regexp/no-useless-flag": "error",
      "regexp/no-useless-lazy": "error",
      "regexp/no-useless-non-greedy": "error",
      "regexp/no-useless-quantifier": "error",
      "regexp/no-useless-range": "error",
      "regexp/no-zero-quantifier": "error",
      "regexp/optimal-lookaround-quantifier": "error",
      "regexp/prefer-escape-replacement-dollar-char": "error",
      "regexp/prefer-predefined-assertion": "error",
      "regexp/prefer-quantifier": "error",
      "regexp/prefer-range": "error",
      "regexp/prefer-regexp-exec": "error",
      "regexp/prefer-regexp-test": "error",
      "regexp/hexadecimal-escape": "error",
      "regexp/letter-case": "error",
      "regexp/no-useless-escape": "error",
      "regexp/no-useless-non-capturing-group": "error",
      "regexp/order-in-character-class": "error",
      "regexp/prefer-character-class": "error",
      "regexp/prefer-named-backreference": "error",
      "regexp/prefer-unicode-codepoint-escapes": "error",
      "regexp/sort-flags": "error",
      "regexp/unicode-escape": "error",
      "regexp/no-missing-g-flag": "error",
      "regexp/no-extra-lookaround-assertions": "error",

      /*
       * Passive voice is very helpful when you need to describe that
       * something is happening, but it is not relevant who is making
       * it happen. In such cases, rewriting to not use passive only
       * makes the comment more verbose
       */
      "write-good-comments/write-good-comments": ["warn", { passive: false }],

      // I have an ESLint rule that enforces "readonly" types everywhere
      "functional/immutable-data": "off",
      /*
       * I have an ESLint rule that detects usages of "let" that are not
       * reassigned
       */
      "functional/no-let": "off",
      // There are many use cases for this
      "functional/no-mixed-type": "off",
      // This is not always possible due to readability concerns
      "functional/no-conditional-statement": "off",
      // This is less useful when working with readOnly types
      "functional/no-expression-statement": "off",
      // Callbacks need to return void
      "functional/no-return-void": "off",
      // Promise reject can be handled in a generic way (.catch(error))
      "functional/no-promise-reject": "off",
      // Partially covered by other rules
      "functional/functional-parameters": "off",
      // Redundant with functional/no-class
      "functional/no-this-expression": "off",
      "functional/prefer-tacit": [
        "error",
        { assumeTypes: { allowFixer: false } },
      ],

      /**
       * An awesome rule, but have to temporary disable it until
       * https://github.com/BrainMaestro/eslint-plugin-optimize-regex/issues/66
       * is fixed - until then, this rule breaks regular expressions!
       */
      // 'optimize-regex/optimize-regex': 'error',

      /**
       * Partially obsolete, partially redundant with TypeScript and
       * other ESLint rules
       */
      "promise/always-return": "off",

      "regexp/no-misleading-capturing-group": "error",
    },
  },
  ...compat.config(markdown.configs.recommended),
  {
    /*
     * Customize the configuration ESLint uses for ```js
     * fenced code blocks inside .md files.
     */
    files: ["**/*.{md}/*.{js,ts,tsx}"],
    rules: {
      "no-undef": "off",
      "no-unused-expression": "off",
      "no-unused-vars": "off",
      "no-console": "off",
    },
  },
  ...compat.config(jest.configs.recommended),
  ...compat.config(jest.configs.style),
  ...compat.config(jestDom.configs.recommended),
  {
    files: testFiles,
    rules: testRules,
  },
  {
    files: ['**/*.js'],
    ...tsEslint.configs.disableTypeChecked,
  },
  eslintConfigPrettier
]);

export default config;
