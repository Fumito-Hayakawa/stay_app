// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// bootstrap導入のため以下記載
//= require jquery3
//= require popper
//= require bootstrap-sprockets

// 以下https://qiita.com/rhistoba/items/f724dae231d7e28bf477
import 'bootstrap'
import '../src/application.scss'

function start() {
  $(".header-nav-menu").addClass('d-none');
}
