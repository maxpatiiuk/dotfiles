alias se="cd ~/site/esri"
alias e="cd ~/site/esri/arcgis-js-api-4"

# Meant to be called from the ./migration directory
alias migrate-widget="node --no-warnings=ExperimentalWarning --loader ts-node/esm/transpile-only ./index.mts"
alias debug-migrate-widget="node --inspect-brk --no-warnings=ExperimentalWarning --loader ts-node/esm/transpile-only ./index.mts"