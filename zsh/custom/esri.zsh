export ESRI_RUN_PRE_COMMIT_ESLINT=1

alias e="cd ~/s/e"
alias ej="cd ~/s/e/arcgis-js-api-4"
alias ej2="cd ~/s/e/arcgis-js-api-42"
alias ej3="cd ~/s/e/arcgis-js-api-43"
alias ej4="cd ~/s/e/arcgis-js-api-44"
alias ejd="cd ~/s/e/arcgis-js-sdk"
alias ec="cd ~/s/e/calcite-design-system/packages/components/src/components"
alias ec2="cd ~/s/e/calcite-design-system-2/packages/components/src/components"

# If I am working on multiple branches at once, or want to quickly test
# something, it is convenient to have multiple cloned instances, rather
# than have to stash, stop build watchers, switch branch, install dependencies,
# build all monorepo packages, and then back
function w() {
  if [[ $# -eq 0 && -t 0 ]]; then
    cdawc ""
  else
    /usr/bin/w "$@"
  fi
}
alias w1="cd ~/s/e/arcgis-web-components"
alias w2="cd ~/s/e/arcgis-web-components-2"
alias ww="cd ~/s/e/arcgis-web-components-2"
alias w3="cd ~/s/e/arcgis-web-components-3"
alias w4="cd ~/s/e/arcgis-web-components-4"
alias w5="cd ~/s/e/arcgis-web-components-5"
alias w6="cd ~/s/e/arcgis-web-components-6"

function cdawc() {
  local subpath=$1
  local basepath

  if [[ $PWD =~ '(.*/arcgis-web-components[^/]*)' ]]; then
    basepath=${match[1]}
  else
    basepath="$HOME/s/e/arcgis-web-components"
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
    cdawc "packages/coding-packages/coding-components"
  else
    /usr/bin/wc "$@"
  fi
}
function wto() {
  cdawc "packages/support-packages/toolkit"
}
function wb() {
  cdawc "packages/support-packages/components-build-utils"
}
function wa() {
  cdawc "packages/support-packages/api-extractor"
}
function wj() {
  cdawc "packages/support-packages/jsapi-extractor"
}
function wp() {
  cdawc "packages/support-packages/prettier-config"
}
function we() {
  cdawc "packages/support-packages/eslint-config"
}
function wtt() {
  cdawc "packages/test-packages"
}
function wt() {
  cdawc "packages/test-packages/lit-test-components"
}
function wtc() {
  cdawc "packages/test-packages/lit-package-consumer"
}
function wch() {
  cdawc "packages/charts-packages/charts-components"
}
function wd() {
  cdawc "packages/docs/project/docs"
}
function wco() {
  cdawc "packages/common-packages/common-components"
}
function wai() {
  cdawc "packages/ai-packages/ai-components"
}
function wi() {
  cdawc "packages/imagery-packages/imagery-components"
}
function wia() {
  cdawc "packages/instant-apps-packages/instant-apps-components"
}
function wmc() {
  cdawc "packages/map-config-packages/map-config-components"
}
function wpo() {
  cdawc "packages/portal-packages/portal-components"
}
function wmb() {
  cdawc "packages/map-packages/embeddable-components"
}