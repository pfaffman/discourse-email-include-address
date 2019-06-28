import { acceptance } from "helpers/qunit-helpers";

acceptance("DiscourseEmailIncludeAddress", { loggedIn: true });

test("DiscourseEmailIncludeAddress works", async assert => {
  await visit("/admin/plugins/discourse-email-include-address");

  assert.ok(false, "it shows the DiscourseEmailIncludeAddress button");
});
