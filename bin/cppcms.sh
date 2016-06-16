#!/usr/bin/env bash
#
#  this executes at application startup time
#
function indent() {
  sed -u 's/^/       /'
}

echo "-----> injecting environment into config.js ..."
ls -l
cp cppcms.js cppcms.js.template
cat cppcms.js.template | \
  jq ".service.port=${PORT} | .service.ip=\"0.0.0.0\" | .service.api=\"http\"" | \
  tee cppcms.js | indent


echo "-----> setting up linker environment ..."
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:cppcms/lib
