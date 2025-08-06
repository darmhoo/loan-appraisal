# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/ujs", to: "@rails--ujs.js", integrity: "sha384-l9ALWpdwyFAIi3p99oNAZjz/2Oh0KMHqoPoWOWtrYPXp7G62jeOk27OzCMTG29Ze" # @7.1.3
