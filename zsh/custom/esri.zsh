export ESRI_RUN_PRE_COMMIT_ESLINT=1

alias e="cd ~/site/esri"
alias ej="cd ~/site/esri/arcgis-js-api-4"
alias ej2="cd ~/site/esri/arcgis-js-api-42"
alias ejd="cd ~/site/esri/arcgis-js-sdk"
alias ec="cd ~/site/esri/calcite-design-system/packages/calcite-components/src/components"
alias ec2="cd ~/site/esri/calcite-design-system-2/packages/calcite-components/src/components"
alias ec3="cd ~/site/esri/calcite-design-system-3/packages/calcite-components/src/components"

# If I am working on multiple branches at once, or want to quickly test
# something, it is convenient to have multiple cloned instances, rather
# than have to stash, stop build watchers, switch branch, install dependencies,
# build all monorepo packages, and then back
function w() {
  if [[ $# -eq 0 && -t 0 ]]; then
    cd ~/site/esri/arcgis-web-components
  else
    /usr/bin/w "$@"
  fi
}
alias w2="cd ~/site/esri/arcgis-web-components-2"
alias ww="cd ~/site/esri/arcgis-web-components-2"
alias w3="cd ~/site/esri/arcgis-web-components-3"
alias www="cd ~/site/esri/arcgis-web-components-3"
alias w4="cd ~/site/esri/arcgis-web-components-4"
alias wwww="cd ~/site/esri/arcgis-web-components-4"
alias w5="cd ~/site/esri/arcgis-web-components-5"
alias w6="cd ~/site/esri/arcgis-web-components-6"

function cdawc() {
  local subpath=$1
  local basepath

  if [[ $PWD =~ '(.*/arcgis-web-components[^/]*)' ]]; then
    basepath=${match[1]}
  else
    basepath="$HOME/site/esri/arcgis-web-components"
  fi

  cd "${basepath:-$MATCH}/${subpath}" || echo "Directory not found: ${basepath}/$subpath"
}

function wm() {
  cdawc "packages/map-packages/map-components"
}
function ws() {
  cdawc "packages/support-packages"
}
function wl() {
  cdawc "packages/support-packages/lit-compiler"
}
function wll() {
  cdawc "packages/support-packages/lit"
}
function wc() {
  if [[ $# -eq 0 && -t 0 ]]; then
    cdawc "packages/support-packages/components-controllers"
  else
    /usr/bin/wc "$@"
  fi
}
function wu() {
  cdawc "packages/support-packages/components-utils"
}
function wb() {
  cdawc "packages/support-packages/components-build-utils"
}
function wa() {
  cdawc "packages/support-packages/api-extractor"
}
function wp() {
  cdawc "packages/support-packages/prettier-config"
}
function we() {
  cdawc "packages/support-packages/eslint-config"
}
function wt() {
  cdawc "packages/test-packages"
}
function wtt() {
  cdawc "packages/test-packages/lit-test-components"
}
function wtc() {
  cdawc "packages/test-packages/lit-package-consumer"
}
function wco() {
  cdawc "packages/coding-packages/coding-components"
}
function wd() {
  cdawc "packages/docs/project/docs"
}
function wcom() {
  cdawc "packages/common-packages/common-components"
}
function wai() {
  cdawc "packages/common-packages/ai-components"
}
function wi() {
  cdawc "packages/imagery-packages/imagery-components"
}
function wia() {
  cdawc "packages/instant-apps-packages/instant-apps-components"
}
function wmco() {
  cdawc "packages/map-config-packages/map-config-components"
}
function wpo() {
  cdawc "packages/portal-packages/portal-components"
}
