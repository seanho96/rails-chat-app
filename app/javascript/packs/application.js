// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "jquery";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "@doabit/semantic-ui-sass";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

export const scroll_bottom = () => {
  if ($(".chatroom-messages").length > 0) {
    $(".chatroom-messages").scrollTop(
      $(".chatroom-message-container")[0].scrollHeight
    );
  }
};

const openSignUpModal = () => {
  $(".signup-modal-button").on("click", () => {
    $(".ui.modal").modal("show");
  });
};

const submit_message = () => {
  $("#message_body").on("keydown", (e) => {
    if (e.key === "Enter") {
      $("button").click();
      e.target.value = "";
    }
  });
};

$(document).on("turbolinks:load", function functionName() {
  $(".ui.dropdown").dropdown();
  $(".message .close").on("click", function () {
    $(this).closest(".message").transition("fade");
  });
  openSignUpModal();
  scroll_bottom();
  submit_message();
});
