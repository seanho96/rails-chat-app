import consumer from "./consumer";
import { scroll_bottom } from "../packs/application";

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $(".chatroom-message-container").append(data.body);
    scroll_bottom();
  },
});
